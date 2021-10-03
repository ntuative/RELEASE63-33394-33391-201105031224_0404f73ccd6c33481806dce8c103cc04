package com.sulake.habbo.widget.avatarinfo
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarInfoEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectNameEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserDataUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserLocationUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetGetUserLocationMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class AvatarInfoWidget extends RoomWidgetBase implements IUpdateReceiver
   {
       
      
      private var var_22:Component;
      
      private var var_193:IHabboConfigurationManager;
      
      private var _view:AvatarInfoView;
      
      private var var_195:Boolean = false;
      
      private var var_1651:Boolean = false;
      
      private var var_1178:Timer;
      
      private var var_2949:int = 3000;
      
      private var var_1460:Boolean;
      
      private var var_946:Boolean;
      
      private var _blend:Number;
      
      private var var_1461:int;
      
      private var var_2950:int = 500;
      
      private var var_306:AvatarInfoData;
      
      private var var_2529:Boolean;
      
      private var var_1816:Boolean;
      
      private var var_1815:int = -1;
      
      public function AvatarInfoWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboConfigurationManager, param4:IHabboLocalizationManager, param5:Component)
      {
         super(param1,param2,param4);
         this.var_22 = param5;
         this.var_193 = param3;
         this.var_1460 = false;
         this.var_946 = false;
         this.var_1178 = new Timer(this.var_2949,1);
         this.var_1178.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         this.var_306 = new AvatarInfoData();
         this.var_2529 = this.var_193.getBoolean("menu.avatar.enabled",false);
         this.var_1816 = this.var_193.getBoolean("hover.name.enabled",false);
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_193;
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this.var_946 = true;
         this.var_1461 = 0;
      }
      
      private function method_7() : void
      {
         messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_895,0,0));
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(this.var_22)
         {
            this.var_22.removeUpdateReceiver(this);
            this.var_22 = null;
         }
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
         }
         this.var_193 = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(RoomWidgetAvatarInfoEvent.const_131,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_130,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_115,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_110,this.updateEventHandler);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_345,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.PET_INFO,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserDataUpdateEvent.const_121,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_188,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_93,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_423,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectNameEvent.const_516,this.updateEventHandler);
         if(this.var_1816)
         {
            param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_805,this.updateEventHandler);
            param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_425,this.updateEventHandler);
         }
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetAvatarInfoEvent.const_131,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_130,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_115,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_110,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_345,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.PET_INFO,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserDataUpdateEvent.const_121,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_188,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_93,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_423,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectNameEvent.const_516,this.updateEventHandler);
         if(this.var_1816)
         {
            param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_425,this.updateEventHandler);
            param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_425,this.updateEventHandler);
         }
      }
      
      private function updateEventHandler(param1:RoomWidgetUpdateEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(param1.type)
         {
            case RoomWidgetAvatarInfoEvent.const_131:
               _loc2_ = param1 as RoomWidgetAvatarInfoEvent;
               this.updateView(_loc2_.userId,_loc2_.userName,_loc2_.roomIndex,RoomObjectTypeEnum.const_166,_loc2_.allowNameChange,null);
               this.var_195 = true;
               break;
            case RoomWidgetRoomObjectNameEvent.const_516:
               if(RoomWidgetRoomObjectNameEvent(param1).category == RoomObjectCategoryEnum.const_33)
               {
                  this.updateView(RoomWidgetRoomObjectNameEvent(param1).userId,RoomWidgetRoomObjectNameEvent(param1).userName,RoomWidgetRoomObjectNameEvent(param1).roomIndex,RoomObjectTypeEnum.const_166,false,null);
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_110:
            case RoomWidgetFurniInfoUpdateEvent.const_345:
               this.removeView();
               break;
            case RoomWidgetUserInfoUpdateEvent.const_130:
               this.method_7();
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_805:
               if(!(this._view is AvatarMenuView))
               {
                  this.var_1815 = RoomWidgetRoomObjectUpdateEvent(param1).id;
                  messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_840,RoomWidgetRoomObjectUpdateEvent(param1).id,RoomWidgetRoomObjectUpdateEvent(param1).category));
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_425:
               if(!(this._view is AvatarMenuView))
               {
                  if(RoomWidgetRoomObjectUpdateEvent(param1).id == this.var_1815)
                  {
                     this.removeView();
                     this.var_1815 = -1;
                  }
               }
               break;
            case RoomWidgetUserInfoUpdateEvent.const_115:
               _loc3_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.var_306.amIAnyRoomController = _loc3_.amIAnyRoomController;
               this.var_306.amIController = _loc3_.amIController;
               this.var_306.amIOwner = _loc3_.amIOwner;
               this.var_306.canBeAskedAsFriend = _loc3_.canBeAskedAsFriend;
               this.var_306.canBeKicked = _loc3_.canBeKicked;
               this.var_306.canTrade = _loc3_.canTrade;
               this.var_306.canTradeReason = _loc3_.canTradeReason;
               this.var_306.hasFlatControl = _loc3_.hasFlatControl;
               this.var_306.isIgnored = _loc3_.isIgnored;
               this.var_306.respectLeft = _loc3_.respectLeft;
               this.updateView(_loc3_.webID,_loc3_.name,_loc3_.userRoomId,RoomObjectTypeEnum.const_166,false,!!_loc3_.isSpectatorMode ? null : this.var_306);
               break;
            case RoomWidgetUserInfoUpdateEvent.BOT:
               _loc4_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.updateView(_loc4_.webID,_loc4_.name,_loc4_.userRoomId,RoomObjectTypeEnum.const_510,false,null);
               break;
            case RoomWidgetPetInfoUpdateEvent.PET_INFO:
               _loc5_ = param1 as RoomWidgetPetInfoUpdateEvent;
               this.updateView(_loc5_.id,_loc5_.name,_loc5_.roomIndex,RoomObjectTypeEnum.const_227,false,null);
               break;
            case RoomWidgetUserDataUpdateEvent.const_121:
               if(!this.var_195)
               {
                  this.method_7();
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_188:
               _loc6_ = param1 as RoomWidgetRoomObjectUpdateEvent;
               if(this._view && this._view.roomIndex == _loc6_.id)
               {
                  this.disposeView();
               }
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_93:
               this.var_1651 = false;
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_423:
               this.var_1651 = true;
         }
         this.checkUpdateNeed();
      }
      
      private function updateView(param1:int, param2:String, param3:int, param4:int, param5:Boolean, param6:AvatarInfoData) : void
      {
         this.var_946 = false;
         if(this.var_1178.running)
         {
            this.var_1178.stop();
         }
         var _loc7_:Boolean = param6 != null && this.var_2529;
         if(_loc7_ && !(this._view is AvatarMenuView))
         {
            this.disposeView();
         }
         if(this._view == null || this._view.userId != param1 || this._view.userName != param2 || this._view.roomIndex != param3 || this._view.userType != param4)
         {
            if(this._view)
            {
               this.disposeView();
            }
            if(!this.var_1651)
            {
               if(_loc7_)
               {
                  this._view = new AvatarMenuView(this,param1,param2,param3,param4,param6);
               }
               else
               {
                  this._view = new AvatarInfoView(this,param1,param2,param3,param4,param5);
               }
            }
         }
      }
      
      public function disposeView() : void
      {
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
            this.var_1460 = true;
            this.var_946 = false;
         }
      }
      
      public function removeView() : void
      {
         if(!this.var_1460)
         {
            this.var_1460 = true;
            this.var_1178.start();
         }
         else if(!this.var_946)
         {
            this.disposeView();
         }
      }
      
      public function checkUpdateNeed() : void
      {
         if(!this.var_22)
         {
            return;
         }
         if(this._view)
         {
            this.var_22.registerUpdateReceiver(this,10);
         }
         else
         {
            this.var_22.removeUpdateReceiver(this);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(!this._view)
         {
            return;
         }
         _loc2_ = messageListener.processWidgetMessage(new RoomWidgetGetUserLocationMessage(this._view.userId,this._view.userType)) as RoomWidgetUserLocationUpdateEvent;
         if(!_loc2_)
         {
            return;
         }
         if(this.var_946)
         {
            this.var_1461 += param1;
            this._blend = 1 - this.var_1461 / Number(this.var_2950);
         }
         else
         {
            this._blend = 1;
         }
         if(this._blend <= 0)
         {
            this.disposeView();
            return;
         }
         this._view.update(_loc2_.rectangle,_loc2_.screenLocation,this._blend);
      }
   }
}
