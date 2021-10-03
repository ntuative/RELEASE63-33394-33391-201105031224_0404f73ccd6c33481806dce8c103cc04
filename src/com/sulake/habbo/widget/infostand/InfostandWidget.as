package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.enums.RoomWidgetInfostandExtraParamEnum;
   import com.sulake.habbo.widget.events.RoomWidgetBadgeImageUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetCommandsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSongUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserBadgesUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserFigureUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserTagsUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class InfostandWidget extends RoomWidgetBase
   {
       
      
      private const const_1866:String = "infostand_user_view";
      
      private const const_1867:String = "infostand_furni_view";
      
      private const const_1868:String = "infostand_pet_view";
      
      private const const_1865:String = "infostand_bot_view";
      
      private const const_1869:String = "infostand_jukebox_view";
      
      private const const_1870:String = "infostand_songdisk_view";
      
      private var var_1141:InfoStandFurniView;
      
      private var var_181:InfoStandUserView;
      
      private var var_348:InfoStandPetView;
      
      private var var_420:InfoStandBotView;
      
      private var var_912:InfoStandJukeboxView;
      
      private var var_911:InfoStandSongDiskView;
      
      private var var_2381:Array;
      
      private var var_1420:InfostandUserData;
      
      private var var_589:InfostandFurniData;
      
      private var _petData:InfoStandPetData;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_154:Timer;
      
      private var _config:IHabboConfigurationManager;
      
      private var _catalog:IHabboCatalog;
      
      private var var_1736:Boolean;
      
      private const const_2132:int = 3000;
      
      public function InfostandWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager, param5:IHabboCatalog)
      {
         super(param1,param2,param3);
         this._config = param4;
         this._catalog = param5;
         this.var_1141 = new InfoStandFurniView(this,this.const_1867,this._catalog);
         this.var_181 = new InfoStandUserView(this,this.const_1866);
         this.var_348 = new InfoStandPetView(this,this.const_1868,this._catalog);
         this.var_420 = new InfoStandBotView(this,this.const_1865);
         this.var_912 = new InfoStandJukeboxView(this,this.const_1869,this._catalog);
         this.var_911 = new InfoStandSongDiskView(this,this.const_1870,this._catalog);
         this.var_1420 = new InfostandUserData();
         this.var_589 = new InfostandFurniData();
         this._petData = new InfoStandPetData();
         this.var_154 = new Timer(this.const_2132);
         this.var_154.addEventListener(TimerEvent.TIMER,this.onUpdateTimer);
         this.mainContainer.visible = false;
      }
      
      override public function get mainWindow() : IWindow
      {
         return this.mainContainer;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(this._mainContainer == null)
         {
            this._mainContainer = windowManager.createWindow("infostand_main_container","",HabboWindowType.const_73,HabboWindowStyle.const_44,HabboWindowParam.const_44,new Rectangle(0,0,50,100)) as IWindowContainer;
            this._mainContainer.tags.push("room_widget_infostand");
            this._mainContainer.background = true;
            this._mainContainer.color = 0;
         }
         return this._mainContainer;
      }
      
      public function getXmlWindow(param1:String) : IWindow
      {
         var asset:IAsset = null;
         var xmlAsset:XmlAsset = null;
         var name:String = param1;
         var window:IWindow = null;
         try
         {
            asset = assets.getAssetByName(name);
            xmlAsset = XmlAsset(asset);
            window = windowManager.buildFromXML(XML(xmlAsset.content));
         }
         catch(e:Error)
         {
            Logger.log("[InfoStandWidget] Missing window XML: " + name);
         }
         return window;
      }
      
      override public function dispose() : void
      {
         if(this.var_154)
         {
            this.var_154.stop();
         }
         this.var_154 = null;
         if(this.var_181)
         {
            this.var_181.dispose();
         }
         this.var_181 = null;
         if(this.var_1141)
         {
            this.var_1141.dispose();
         }
         this.var_1141 = null;
         if(this.var_420)
         {
            this.var_420.dispose();
         }
         this.var_420 = null;
         if(this.var_348)
         {
            this.var_348.dispose();
         }
         this.var_348 = null;
         if(this.var_912)
         {
            this.var_912.dispose();
         }
         this.var_912 = null;
         if(this.var_911)
         {
            this.var_911.dispose();
         }
         this.var_911 = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_290,this.onRoomObjectSelected);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_110,this.onClose);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_188,this.onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_151,this.onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_130,this.onUserInfo);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_115,this.onUserInfo);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.onBotInfo);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_345,this.onFurniInfo);
         param1.addEventListener(RoomWidgetUserTagsUpdateEvent.const_171,this.onUserTags);
         param1.addEventListener(RoomWidgetUserFigureUpdateEvent.const_184,this.onUserFigureUpdate);
         param1.addEventListener(RoomWidgetUserBadgesUpdateEvent.const_145,this.onUserBadges);
         param1.addEventListener(RoomWidgetBadgeImageUpdateEvent.const_939,this.onBadgeImage);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.PET_INFO,this.onPetInfo);
         param1.addEventListener(RoomWidgetPetCommandsUpdateEvent.PET_COMMANDS,this.onPetCommands);
         param1.addEventListener(RoomWidgetSongUpdateEvent.const_440,this.onSongUpdate);
         param1.addEventListener(RoomWidgetSongUpdateEvent.const_434,this.onSongUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_290,this.onRoomObjectSelected);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_110,this.onClose);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_188,this.onRoomObjectRemoved);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_151,this.onRoomObjectRemoved);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_130,this.onUserInfo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_115,this.onUserInfo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.onBotInfo);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_345,this.onFurniInfo);
         param1.removeEventListener(RoomWidgetUserTagsUpdateEvent.const_171,this.onUserTags);
         param1.removeEventListener(RoomWidgetUserFigureUpdateEvent.const_184,this.onUserFigureUpdate);
         param1.removeEventListener(RoomWidgetUserBadgesUpdateEvent.const_145,this.onUserBadges);
         param1.removeEventListener(RoomWidgetBadgeImageUpdateEvent.const_939,this.onBadgeImage);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.PET_INFO,this.onPetInfo);
         param1.removeEventListener(RoomWidgetPetCommandsUpdateEvent.PET_COMMANDS,this.onPetCommands);
         param1.removeEventListener(RoomWidgetSongUpdateEvent.const_440,this.onSongUpdate);
         param1.removeEventListener(RoomWidgetSongUpdateEvent.const_434,this.onSongUpdate);
      }
      
      public function get userData() : InfostandUserData
      {
         return this.var_1420;
      }
      
      public function get furniData() : InfostandFurniData
      {
         return this.var_589;
      }
      
      public function get petData() : InfoStandPetData
      {
         return this._petData;
      }
      
      private function onUpdateTimer(param1:TimerEvent) : void
      {
         if(this.var_348 == null)
         {
            return;
         }
         messageListener.processWidgetMessage(new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_417,this.var_348.getCurrentPetId()));
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         if(this.var_1736)
         {
            this.var_1736 = false;
            this.userData.setData(param1);
            this.var_181.update(param1);
            this.selectView(this.const_1866);
            if(this.var_154)
            {
               this.var_154.stop();
            }
         }
      }
      
      private function onBotInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.userData.setData(param1);
         this.var_420.update(param1);
         this.selectView(this.const_1865);
         if(this.var_154)
         {
            this.var_154.stop();
         }
      }
      
      private function onFurniInfo(param1:RoomWidgetFurniInfoUpdateEvent) : void
      {
         this.furniData.setData(param1);
         if(param1.extraParam == RoomWidgetInfostandExtraParamEnum.const_706)
         {
            this.var_912.update(param1);
            this.selectView(this.const_1869);
         }
         else if(param1.extraParam.indexOf(RoomWidgetInfostandExtraParamEnum.const_439) != -1)
         {
            this.var_911.update(param1);
            this.selectView(this.const_1870);
         }
         else
         {
            this.var_1141.update(param1);
            this.selectView(this.const_1867);
         }
         if(this.var_154)
         {
            this.var_154.stop();
         }
      }
      
      private function onPetInfo(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         this.petData.setData(param1);
         this.userData.petRespectLeft = param1.petRespectLeft;
         this.var_348.update(this.petData);
         this.selectView(this.const_1868);
         if(this.var_154)
         {
            this.var_154.start();
         }
      }
      
      private function onPetCommands(param1:RoomWidgetPetCommandsUpdateEvent) : void
      {
         this.var_348.updateEnabledTrainingCommands(param1.id,new CommandConfiguration(param1.allCommands,param1.enabledCommands));
      }
      
      private function onUserTags(param1:RoomWidgetUserTagsUpdateEvent) : void
      {
         if(param1.isOwnUser)
         {
            this.var_2381 = param1.tags;
         }
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         if(param1.isOwnUser)
         {
            this.var_181.setTags(param1.tags);
         }
         else
         {
            this.var_181.setTags(param1.tags,this.var_2381);
         }
      }
      
      private function onUserFigureUpdate(param1:RoomWidgetUserFigureUpdateEvent) : void
      {
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         if(this.userData.isBot())
         {
            this.var_420.image = param1.image;
         }
         else
         {
            this.var_181.image = param1.image;
            this.var_181.setMotto(param1.customInfo,param1.isOwnUser);
            this.var_181.achievementScore = param1.achievementScore;
         }
      }
      
      private function onUserBadges(param1:RoomWidgetUserBadgesUpdateEvent) : void
      {
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         this.userData.badges = param1.badges;
         this.var_181.clearBadges();
      }
      
      private function onBadgeImage(param1:RoomWidgetBadgeImageUpdateEvent) : void
      {
         var _loc2_:int = this.userData.badges.indexOf(param1.badgeID);
         if(_loc2_ >= 0)
         {
            if(this.userData.isBot())
            {
               this.var_420.setBadgeImage(_loc2_,param1.badgeImage);
            }
            else
            {
               this.var_181.setBadgeImage(_loc2_,param1.badgeImage);
            }
            return;
         }
         if(param1.badgeID == this.userData.groupBadgeId)
         {
            this.var_181.setGroupBadgeImage(param1.badgeImage);
         }
      }
      
      private function onRoomObjectSelected(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_305,param1.id,param1.category);
         if(param1.category == RoomObjectCategoryEnum.const_33)
         {
            this.var_1736 = true;
         }
         messageListener.processWidgetMessage(_loc2_);
      }
      
      private function onRoomObjectRemoved(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:* = false;
         switch(param1.type)
         {
            case RoomWidgetRoomObjectUpdateEvent.const_151:
               _loc2_ = param1.id == this.var_589.id;
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_188:
               if(this.var_181 != null && this.var_181.window != null && this.var_181.window.visible)
               {
                  _loc2_ = param1.id == this.var_1420.userRoomId;
                  break;
               }
               if(this.var_348 != null && this.var_348.window != null && this.var_348.window.visible)
               {
                  _loc2_ = param1.id == this._petData.roomIndex;
                  break;
               }
               if(this.var_420 != null && this.var_420.window != null && this.var_420.window.visible)
               {
                  _loc2_ = param1.id == this.var_1420.userRoomId;
                  break;
               }
         }
         if(_loc2_)
         {
            this.close();
         }
      }
      
      private function onSongUpdate(param1:RoomWidgetSongUpdateEvent) : void
      {
         this.var_912.updateSongInfo(param1);
         this.var_911.updateSongInfo(param1);
      }
      
      public function close() : void
      {
         this.hideChildren();
         if(this.var_154)
         {
            this.var_154.stop();
         }
      }
      
      private function onClose(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         this.close();
         if(this.var_154)
         {
            this.var_154.stop();
         }
      }
      
      private function hideChildren() : void
      {
         var _loc1_:int = 0;
         if(this._mainContainer != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this._mainContainer.numChildren)
            {
               this._mainContainer.getChildAt(_loc1_).visible = false;
               _loc1_++;
            }
         }
      }
      
      private function selectView(param1:String) : void
      {
         this.hideChildren();
         var _loc2_:IWindow = this.mainContainer.getChildByName(param1) as IWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = true;
         this.mainContainer.visible = true;
         this.mainContainer.width = _loc2_.width;
         this.mainContainer.height = _loc2_.height;
      }
      
      public function refreshContainer() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.mainContainer.numChildren)
         {
            _loc1_ = this.mainContainer.getChildAt(_loc2_);
            if(_loc1_.visible)
            {
               this.mainContainer.width = _loc1_.width;
               this.mainContainer.height = _loc1_.height;
            }
            _loc2_++;
         }
      }
   }
}
