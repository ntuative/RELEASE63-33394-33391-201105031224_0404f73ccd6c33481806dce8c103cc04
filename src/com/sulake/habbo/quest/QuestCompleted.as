package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.communication.messages.outgoing.quest.OpenQuestTrackerMessageComposer;
   
   public class QuestCompleted implements IDisposable
   {
       
      
      private var _window:IFrameWindow;
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_387:QuestMessageData;
      
      private var var_1296:int = 0;
      
      public function QuestCompleted(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
      }
      
      public function dispose() : void
      {
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._window == null;
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         this.close();
      }
      
      public function onQuestCancelled() : void
      {
         this.close();
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.prepare(param1);
         this.var_1296 = 2000;
      }
      
      private function close() : void
      {
         if(this._window)
         {
            this._window.visible = false;
         }
      }
      
      private function onNextQuest(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._window.visible = false;
         if(this.var_387.completedQuestsInCampaign >= this.var_387.questCountInCampaign)
         {
            this.var_387.id = 0;
            this.var_387.accepted = false;
            this._questEngine.controller.campaignCompleted.show(this.var_387);
         }
         else
         {
            this._questEngine.controller.questDetails.openForNextQuest = this._questEngine.configuration.getKey("questing.showDetailsForNextQuest") == "true";
            this._questEngine.send(new OpenQuestTrackerMessageComposer());
         }
      }
      
      public function prepare(param1:QuestMessageData) : void
      {
         this.var_387 = param1;
         if(this._window == null)
         {
            this._window = IFrameWindow(this._questEngine.getXmlWindow("QuestCompletedDialog"));
            this._window.findChildByTag("close").procedure = this.onNextQuest;
            this._window.findChildByName("next_quest_button").procedure = this.onNextQuest;
            new PendingImage(this._questEngine,this._window.findChildByName("reward_icon"),"quest_complete");
            this._window.findChildByName("catalog_link_region").procedure = this.onCatalogLink;
         }
         this._window.findChildByName("catalog_link_txt").caption = this._questEngine.localization.getKey("quests.completed.cataloglink." + this.var_387.activityPointType);
         var _loc2_:String = "quests.completed.reward." + this.var_387.activityPointType;
         this._questEngine.localization.registerParameter(_loc2_,"amount",this.var_387.rewardCurrencyAmount.toString());
         this._window.findChildByName("reward_txt").caption = this._questEngine.localization.getKey(_loc2_,_loc2_);
         var _loc3_:* = this.var_387.getQuestLocalizationKey() + ".completed";
         this._window.findChildByName("desc_txt").caption = this._questEngine.localization.getKey(_loc3_,_loc3_);
         this._window.visible = false;
      }
      
      private function onCatalogLink(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._questEngine.openCatalog(this.var_387);
         }
      }
      
      public function update(param1:uint) : void
      {
         if(this.var_1296 > 0)
         {
            this.var_1296 -= param1;
            if(this.var_1296 < 1)
            {
               this._window.center();
               this._window.visible = true;
               this._window.activate();
            }
         }
      }
   }
}
