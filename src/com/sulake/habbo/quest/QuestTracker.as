package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.communication.messages.outgoing.quest.StartCampaignMessageComposer;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class QuestTracker implements IDisposable
   {
      
      private static const const_991:Array = [-2,-3,-2,0,2,3,2,0,2,1,0,1];
      
      private static const const_989:Array = [1,1,2,2,3,3,4,4,5,5,6,6,4];
      
      private static const const_990:int = 6;
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var _questInTracker:QuestMessageData;
      
      private var _window:IWindowContainer;
      
      private var var_482:Timer;
      
      private var var_198:int = 0;
      
      private var var_881:int = 0;
      
      private var var_1353:int = 0;
      
      private var var_1090:int = -1;
      
      private const const_652:int = 0;
      
      private const const_1851:int = 1;
      
      private const const_1850:int = 2;
      
      private const const_1848:int = 3;
      
      private const const_1847:int = 4;
      
      private const const_1849:int = 5;
      
      public function QuestTracker(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         this._questInTracker = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_482)
         {
            this.var_482.stop();
            this.var_482 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         if(this._window)
         {
            this._questInTracker = param1;
            this.var_881 = 0;
            this.refreshTrackerDetails(this._questInTracker);
            this.var_1090 = 0;
            this.var_198 = this.const_1848;
         }
      }
      
      public function onQuestCancelled() : void
      {
         this._questInTracker = null;
         if(this._window)
         {
            this.var_198 = this.const_1850;
         }
      }
      
      public function onRoomEnter() : void
      {
         var _loc3_:int = 0;
         var _loc1_:Boolean = Boolean(parseInt(this._questEngine.configuration.getKey("new.identity","0")));
         var _loc2_:String = this.getDefaultCampaign();
         if(this.var_482 == null && _loc1_ && _loc2_ != "" && this._questEngine.isQuestingEnabled())
         {
            _loc3_ = int(this._questEngine.configuration.getKey("questing.startQuestDelayInSeconds","30"));
            this.var_482 = new Timer(_loc3_ * 1000,1);
            this.var_482.addEventListener(TimerEvent.TIMER,this.onStartQuestTimer);
            this.var_482.start();
            Logger.log("Initialized start quest timer with period: " + _loc3_);
         }
      }
      
      public function onRoomExit() : void
      {
         if(this._window != null && this._window.visible)
         {
            this._window.findChildByName("more_info_txt").visible = false;
            this._window.findChildByName("more_info_region").visible = false;
         }
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         var _loc2_:Boolean = this._window && this._window.visible;
         this._questInTracker = param1;
         this.prepareTrackerWindow();
         this.refreshTrackerDetails(param1);
         this.hideSuccessFrames();
         if(_loc2_)
         {
            this.var_881 = 0;
            this.var_198 = this.const_1847;
         }
         else
         {
            this._window.x = this._window.desktop.width;
            this.var_198 = this.const_1851;
         }
         this._window.visible = true;
         this._questEngine.notifications.setQuestTrackerVisible(true);
      }
      
      private function prepareTrackerWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._questEngine.getXmlWindow("QuestTracker"));
         this._window.y = 75;
         this._window.findChildByName("more_info_region").procedure = this.onMoreInfo;
         new PendingImage(this._questEngine,this._window.findChildByName("quest_tracker_bg"),"questtrackerbkg");
         var _loc1_:int = 1;
         while(_loc1_ <= const_990)
         {
            new PendingImage(this._questEngine,this.getSuccessFrame(_loc1_),"checkanim" + _loc1_);
            _loc1_++;
         }
         this.hideSuccessFrames();
      }
      
      private function hideSuccessFrames() : void
      {
         var _loc1_:int = 1;
         while(_loc1_ <= const_990)
         {
            this.getSuccessFrame(_loc1_).visible = false;
            _loc1_++;
         }
      }
      
      private function getSuccessFrame(param1:int) : IBitmapWrapperWindow
      {
         return IBitmapWrapperWindow(this._window.findChildByName("success_pic_" + param1));
      }
      
      private function refreshTrackerDetails(param1:QuestMessageData) : void
      {
         this._questEngine.localization.registerParameter("quests.tracker.caption","quest_name",this._questEngine.getQuestName(param1));
         this._window.findChildByName("desc_txt").caption = this._questEngine.getQuestDesc(param1);
         this._window.findChildByName("more_info_txt").visible = true;
         this._window.findChildByName("more_info_region").visible = true;
         var _loc2_:int = Math.round(100 * param1.completedSteps / param1.totalSteps);
         this._questEngine.localization.registerParameter("quests.tracker.progress","progress","" + _loc2_);
         this._questEngine.setupQuestImage(this._window,param1);
      }
      
      private function onMoreInfo(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._questEngine.controller.questDetails.showDetails(this._questInTracker);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this._window == null || this.var_198 == this.const_652)
         {
            return;
         }
         if(this.var_198 == this.const_1851)
         {
            _loc2_ = this.getDefaultLocationX();
            _loc3_ = this._window.x - _loc2_;
            if(_loc3_ > 0)
            {
               _loc4_ = Math.max(1,Math.round(_loc3_ * param1 * 0.01));
               this._window.x -= _loc4_;
            }
            else
            {
               this.var_198 = this.const_652;
               this._window.x = _loc2_;
            }
         }
         else if(this.var_198 == this.const_1850)
         {
            _loc2_ = this._window.desktop.width;
            _loc3_ = _loc2_ - this._window.x;
            if(_loc3_ > 0)
            {
               _loc4_ = Math.max(1,Math.round(param1 * 100 / _loc3_));
               this._window.x += _loc4_;
            }
            else
            {
               this.var_198 = this.const_652;
               this._window.x = _loc2_;
               this._window.visible = false;
               this._questEngine.notifications.setQuestTrackerVisible(false);
            }
         }
         else if(this.var_198 == this.const_1848)
         {
            this.hideSuccessFrames();
            this.getSuccessFrame(const_989[this.var_1090]).visible = true;
            ++this.var_1090;
            if(this.var_1090 >= const_989.length)
            {
               this.var_198 = this.const_1849;
               this.var_1353 = 1000;
            }
         }
         else if(this.var_198 == this.const_1847)
         {
            if(this.var_881 >= -1)
            {
               this._window.x = this.getDefaultLocationX();
               this.var_198 = this.const_652;
            }
            else
            {
               this._window.x = this.getDefaultLocationX() + const_991[this.var_881];
               ++this.var_881;
            }
         }
         else if(this.var_198 == this.const_1849)
         {
            this.var_1353 -= param1;
            if(this.var_1353 < 0)
            {
               this.var_198 = this.const_652;
               this._window.visible = false;
            }
         }
      }
      
      private function getDefaultLocationX() : int
      {
         return this._window.desktop.width - this._window.width - 4;
      }
      
      public function isVisible() : Boolean
      {
         return this._window && this._window.visible;
      }
      
      private function onStartQuestTimer(param1:TimerEvent) : void
      {
         if(this.hasBlockingWindow())
         {
            Logger.log("Quest start blocked. Waiting some more");
            this.var_482.reset();
            this.var_482.start();
         }
         else
         {
            this._questEngine.controller.questDetails.openForNextQuest = this._questEngine.configuration.getKey("questing.showDetailsForNextQuest") == "true";
            this._questEngine.send(new StartCampaignMessageComposer(this.getDefaultCampaign()));
         }
      }
      
      private function getDefaultCampaign() : String
      {
         var _loc1_:String = this._questEngine.configuration.getKey("questing.defaultCampaign");
         return _loc1_ == null ? "" : _loc1_;
      }
      
      private function hasBlockingWindow() : Boolean
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ <= 2)
         {
            _loc2_ = this._questEngine.windowManager.getDesktop(_loc1_);
            if(_loc2_ != null && this.hasBlockingWindowInLayer(_loc2_))
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      private function hasBlockingWindowInLayer(param1:IWindowContainer) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         while(_loc2_ < param1.numChildren)
         {
            _loc3_ = param1.getChildAt(_loc2_);
            if(_loc3_ != null && _loc3_.visible)
            {
               if(_loc3_ as IFrameWindow != null)
               {
                  if(_loc3_.name != "mod_start_panel")
                  {
                     return true;
                  }
               }
               else if(_loc3_.name == "welcome_screen")
               {
                  return true;
               }
            }
            _loc2_++;
         }
         return false;
      }
   }
}
