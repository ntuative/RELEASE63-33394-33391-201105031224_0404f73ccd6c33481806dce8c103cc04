package com.sulake.habbo.quest
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.notifications.IHabboNotifications;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboNotifications;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import iid.IIDHabboWindowManager;
   
   public class HabboQuestEngine extends Component implements IHabboQuestEngine
   {
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_193:IHabboConfigurationManager;
      
      private var var_1543:IncomingMessages;
      
      private var _controller:QuestController;
      
      private var _roomEngine:IRoomEngine;
      
      private var _toolbar:IHabboToolbar;
      
      private var _catalog:IHabboCatalog;
      
      private var var_989:IHabboNotifications;
      
      private var var_388:ISessionDataManager;
      
      private var var_2737:String;
      
      private var _habboHelp:IHabboHelp;
      
      public function HabboQuestEngine(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         this._controller = new QuestController(this);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationComponentInit);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDRoomEngine(),this.onRoomEngineReady);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationReady);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
         queueInterface(new IIDHabboCatalog(),this.onCatalogReady);
         queueInterface(new IIDHabboNotifications(),this.onNotificationsReady);
         queueInterface(new IIDHabboHelp(),this.onHabboHelpReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
         registerUpdateReceiver(this._controller,3);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this._toolbar)
         {
            this._toolbar.release(new IIDHabboToolbar());
            this._toolbar = null;
         }
         if(this._catalog != null)
         {
            this._catalog.release(new IIDHabboCatalog());
            this._catalog = null;
         }
         if(this.var_989 != null)
         {
            this.var_989.release(new IIDHabboNotifications());
            this.var_989 = null;
         }
         if(this._windowManager != null)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this._roomEngine != null)
         {
            this._roomEngine.release(new IIDRoomEngine());
            this._roomEngine = null;
         }
         if(this.var_193 != null)
         {
            this.var_193.release(new IIDHabboConfigurationManager());
            this.var_193 = null;
         }
         if(this._localization != null)
         {
            this._localization.release(new IIDHabboLocalizationManager());
            this._localization = null;
         }
         if(this._communication != null)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this.var_388 != null)
         {
            this.var_388.release(new IIDSessionDataManager());
            this.var_388 = null;
         }
         if(this.var_1543)
         {
            this.var_1543.dispose();
         }
         if(this._habboHelp != null)
         {
            this._habboHelp.release(new IIDHabboHelp());
            this._habboHelp = null;
         }
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
            window = this._windowManager.buildFromXML(XML(xmlAsset.content));
         }
         catch(e:Error)
         {
         }
         return window;
      }
      
      private function onCommunicationComponentInit(param1:IID = null, param2:IUnknown = null) : void
      {
         this._communication = IHabboCommunicationManager(param2);
         this.var_1543 = new IncomingMessages(this);
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._roomEngine = param2 as IRoomEngine;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         return this._roomEngine;
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._localization = IHabboLocalizationManager(param2);
      }
      
      private function onConfigurationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         this.var_193 = param2 as IHabboConfigurationManager;
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._catalog = param2 as IHabboCatalog;
      }
      
      private function onNotificationsReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_989 = param2 as IHabboNotifications;
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_388 = param2 as ISessionDataManager;
      }
      
      private function onHabboHelpReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._habboHelp = param2 as IHabboHelp;
      }
      
      public function get communication() : IHabboCommunicationManager
      {
         return this._communication;
      }
      
      public function get habboHelp() : IHabboHelp
      {
         return this._habboHelp;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this._localization;
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_193;
      }
      
      public function get controller() : QuestController
      {
         return this._controller;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this._toolbar;
      }
      
      public function openCatalog(param1:QuestMessageData) : void
      {
         var _loc2_:String = "catalog.page.quest." + param1.campaignCode;
         Logger.log("Questing->Open Catalog: " + _loc2_);
         this._catalog.openCatalogPage(_loc2_,true);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._toolbar = IHabboToolbar(param2) as IHabboToolbar;
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_37,this.onHabboToolbarEvent);
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_37)
         {
            if(param1.iconId == HabboToolbarIconEnum.QUESTS)
            {
               this._controller.onToolbarClick();
               return;
            }
         }
      }
      
      public function get notifications() : IHabboNotifications
      {
         return this.var_989;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return this.var_388;
      }
      
      public function get defaultCampaignCode() : String
      {
         return this.var_2737;
      }
      
      public function set defaultCampaignCode(param1:String) : void
      {
         this.var_2737 = param1;
      }
      
      public function send(param1:IMessageComposer) : void
      {
         this.communication.getHabboMainConnection(null).send(param1);
      }
      
      public function isTrackerVisible() : Boolean
      {
         return this._controller.questTracker.isVisible();
      }
      
      public function getQuestRowTitle(param1:QuestMessageData) : String
      {
         var _loc2_:* = param1.getQuestLocalizationKey() + ".name";
         return this._localization.getKey(_loc2_,_loc2_);
      }
      
      public function getQuestName(param1:QuestMessageData) : String
      {
         var _loc2_:* = param1.getQuestLocalizationKey() + ".name";
         return this._localization.getKey(_loc2_,_loc2_);
      }
      
      public function getQuestDesc(param1:QuestMessageData) : String
      {
         var _loc2_:* = param1.getQuestLocalizationKey() + ".desc";
         return this._localization.getKey(_loc2_,_loc2_);
      }
      
      public function getQuestHint(param1:QuestMessageData) : String
      {
         var _loc2_:* = param1.getQuestLocalizationKey() + ".hint";
         return this._localization.getKey(_loc2_,_loc2_);
      }
      
      public function getCampaignName(param1:QuestMessageData) : String
      {
         var _loc2_:* = param1.getCampaignLocalizationKey() + ".name";
         return this._localization.getKey(_loc2_,_loc2_);
      }
      
      public function setupQuestImage(param1:IWindowContainer, param2:QuestMessageData) : void
      {
         var _loc3_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName("quest_pic_bitmap"));
         if(_loc3_.id == param2.id)
         {
            Logger.log("No need to refresh image...");
            return;
         }
         _loc3_.id = param2.id;
         new PendingImage(this,_loc3_,(param2.campaignCode + "_" + param2.localizationCode + param2.imageVersion).toLowerCase());
      }
      
      public function setupRewardImage(param1:IWindowContainer, param2:QuestMessageData) : void
      {
         var _loc3_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName("currency_bitmap"));
         if(_loc3_.id == param2.id)
         {
            Logger.log("No need to refresh reward image...");
            return;
         }
         _loc3_.id = param2.id;
         new PendingImage(this,_loc3_,"quest_pixel");
      }
      
      public function setupCampaignImage(param1:IWindowContainer, param2:QuestMessageData) : void
      {
         var _loc3_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName("campaign_pic_bitmap"));
         if(_loc3_.tags[0] == param2.campaignCode)
         {
            Logger.log("No need to refresh campaign image...");
            return;
         }
         _loc3_.tags[0] = param2.campaignCode;
         new PendingImage(this,_loc3_,param2.campaignCode);
      }
      
      public function isQuestingEnabled() : Boolean
      {
         return this.var_193.getKey("questing.enabled","HabboRoomObjectVisualizationLib_manifest") == "true";
      }
   }
}
