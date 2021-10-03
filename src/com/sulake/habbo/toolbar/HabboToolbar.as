package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.IWindow;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.ConversionPointMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import iid.IIDHabboWindowManager;
   
   public class HabboToolbar extends Component implements IHabboToolbar
   {
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_262:IHabboCommunicationManager;
      
      private var _config:IHabboConfigurationManager;
      
      private var _view:IToolbarView;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _state:Boolean = false;
      
      private var var_1454:LogoutController;
      
      private var var_942:Boolean;
      
      private var _connection:IConnection;
      
      private var _catalog:IHabboCatalog;
      
      public function HabboToolbar(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         lock();
         this._assetLibrary = param3;
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDHabboCatalog(),this.onCatalogReady);
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._catalog = param2 as IHabboCatalog;
      }
      
      override public function dispose() : void
      {
         this._state = false;
         this._connection = null;
         if(this.var_1454)
         {
            this.var_1454.dispose();
            this.var_1454 = null;
         }
         if(this.var_262)
         {
            this.var_262.release(new IIDHabboCommunicationManager());
            this.var_262 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this._config)
         {
            this._config.release(new IIDHabboConfigurationManager());
            this._config = null;
         }
         if(this._catalog != null)
         {
            this._catalog.release(new IIDHabboCatalog());
            this._catalog = null;
         }
         if(this._view != null)
         {
            this._view.dispose();
            this._view = null;
         }
         super.dispose();
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_262 = IHabboCommunicationManager(param2);
         this._connection = this.var_262.getHabboMainConnection(null);
         this.tryInitialize();
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         this.tryInitialize();
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._config = IHabboConfigurationManager(param2);
         this.var_942 = this._config.getKey("client.toolbar.static.enabled","HabboRoomObjectVisualizationLib_manifest") == "true";
         this.tryInitialize();
      }
      
      private function tryInitialize() : void
      {
         if(this.var_262 && this._windowManager && this._config)
         {
            this.var_262.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(this.onAuthenticationOK));
            unlock();
         }
      }
      
      private function onAuthenticationOK(param1:IMessageEvent) : void
      {
         if(this.var_942)
         {
            this._view = new ToolbarViewStatic(this,this._windowManager,this._assetLibrary,this._connection,this._catalog,events,this._config);
         }
         else
         {
            this._view = new ToolbarView(this,this._windowManager,this._assetLibrary,this._connection,events,this._config);
         }
         if(this._config && this._config.getKey("client.logout.enabled","HabboRoomObjectVisualizationLib_manifest") == "true")
         {
            this.var_1454 = new LogoutController(this,this._windowManager,this._assetLibrary,events,this._config);
         }
         if(this._view == null)
         {
            return;
         }
         events.addEventListener(HabboToolbarSetIconEvent.const_137,this.onSetToolbarIconEvent);
         events.addEventListener(HabboToolbarSetIconEvent.const_1195,this.onSetToolbarIconBitmapEvent);
         events.addEventListener(HabboToolbarSetIconEvent.const_187,this.onRemoveToolbarIconEvent);
         events.addEventListener(HabboToolbarSetIconEvent.const_104,this.onSetToolbarIconStateEvent);
         events.addEventListener(HabboToolbarShowMenuEvent.const_59,this.onAnimateWindowEvent);
         events.addEventListener(HabboToolbarShowMenuEvent.const_546,this.onAnimateWindowEvent);
         events.addEventListener(HabboToolbarShowMenuEvent.const_1211,this.onDisplayWindowEvent);
         events.addEventListener(HabboToolbarShowMenuEvent.const_1157,this.onHideWindowEvent);
         this._state = true;
         events.dispatchEvent(new HabboToolbarEvent(HabboToolbarEvent.const_72));
      }
      
      private function onSetToolbarIconEvent(param1:HabboToolbarSetIconEvent) : void
      {
         var _loc2_:* = null;
         if(this._view != null && this._state)
         {
            if(param1.assetName != null)
            {
               _loc2_ = this.solveAssetBitmapData(param1.iconId,param1.assetName);
               this._view.setIconBitmap(param1.iconId,_loc2_);
            }
            else
            {
               this._view.setIcon(param1.iconId);
            }
         }
      }
      
      private function onSetToolbarIconStateEvent(param1:HabboToolbarSetIconEvent) : void
      {
         if(this._view != null && this._state)
         {
            this._view.setIconState(param1.iconId,param1.iconState);
         }
      }
      
      private function onSetToolbarIconBitmapEvent(param1:HabboToolbarSetIconEvent) : void
      {
         var _loc2_:* = null;
         if(this._view != null && this._state)
         {
            _loc2_ = param1.bitmapData;
            if(_loc2_ == null)
            {
               _loc2_ = this.solveAssetBitmapData(param1.iconId);
            }
            this._view.setIconBitmap(param1.iconId,_loc2_);
         }
      }
      
      private function onRemoveToolbarIconEvent(param1:HabboToolbarSetIconEvent) : void
      {
         if(this._view != null && this._state)
         {
            this._view.removeIcon(param1.iconId);
         }
      }
      
      public function toggleWindowVisibility(param1:String) : void
      {
         var _loc2_:String = "null";
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_37);
         _loc3_.iconId = _loc2_;
         _loc3_.iconName = param1;
         events.dispatchEvent(_loc3_);
         var _loc4_:ConversionPointMessageComposer = new ConversionPointMessageComposer("Toolbar",param1,"client.toolbar.clicked");
         if(this._connection)
         {
            this._connection.send(_loc4_);
         }
      }
      
      private function onAnimateWindowEvent(param1:HabboToolbarShowMenuEvent) : void
      {
         if(!this._state || !this._view)
         {
            return;
         }
         if(this.var_942)
         {
            return;
         }
         if(param1.type == HabboToolbarShowMenuEvent.const_59)
         {
            if(param1.alignToIcon)
            {
               this._view.animateWindowIn(param1.menuId,param1.window);
            }
            else
            {
               this._view.animateWindowIn(param1.menuId,param1.window,new Point(param1.window.x,param1.window.y));
            }
         }
         else
         {
            this._view.animateWindowOut(param1.menuId,param1.window);
         }
      }
      
      private function onDisplayWindowEvent(param1:HabboToolbarShowMenuEvent) : void
      {
         if(!this._state || !this._view)
         {
            return;
         }
         if(this.var_942)
         {
            this.toggleWindowVisibility(param1.menuId);
         }
         else
         {
            this._view.positionWindow(param1.menuId,param1.window);
         }
      }
      
      private function onHideWindowEvent(param1:HabboToolbarShowMenuEvent) : void
      {
         if(!this._state || !this._view)
         {
            return;
         }
         if(this.var_942)
         {
            this.toggleWindowVisibility(param1.menuId);
         }
         else
         {
            this._view.hideWindow(param1.menuId,param1.window);
         }
      }
      
      private function solveAssetBitmapData(param1:String, param2:String = null) : BitmapData
      {
         if(param2 == null)
         {
            switch(param1)
            {
               case HabboToolbarIconEnum.CATALOGUE:
                  param2 = "catalogue_icon";
                  break;
               case HabboToolbarIconEnum.FRIENDLIST:
                  param2 = "friendlist_icon";
                  break;
               case HabboToolbarIconEnum.HAND:
                  param2 = "hand_icon";
                  break;
               case HabboToolbarIconEnum.HELP:
                  param2 = "help_icon";
                  break;
               case HabboToolbarIconEnum.INVENTORY:
                  param2 = "inventory_icon";
                  break;
               case HabboToolbarIconEnum.MEMENU:
                  param2 = "memenu_default_icon";
                  break;
               case HabboToolbarIconEnum.MESSENGER:
                  param2 = "messenger_icon";
                  break;
               case HabboToolbarIconEnum.NAVIGATOR:
                  param2 = "navigator_icon";
                  break;
               case HabboToolbarIconEnum.ROOMINFO:
                  param2 = "roominfo_icon";
                  break;
               case HabboToolbarIconEnum.SETTINGS:
                  param2 = "settings_icon";
                  break;
               case HabboToolbarIconEnum.ZOOM:
                  param2 = "zoomout_icon";
            }
         }
         var _loc3_:BitmapDataAsset = this._assetLibrary.getAssetByName(param2) as BitmapDataAsset;
         if(_loc3_ == null)
         {
            Logger.log("* Toolbar icon asset \'" + param2 + "\' not found!");
            return null;
         }
         var _loc4_:BitmapData = _loc3_.content as BitmapData;
         return _loc4_.clone();
      }
      
      public function get orientation() : String
      {
         if(this._view != null)
         {
            return this._view.orientation;
         }
         return "";
      }
      
      public function get size() : int
      {
         if(this._view != null)
         {
            return this._view.barSize;
         }
         return 0;
      }
      
      public function getIconLocation(param1:String) : int
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._view != null && this._state)
         {
            _loc2_ = this._view.getIconByMenuId(param1);
            if(_loc2_)
            {
               _loc3_ = _loc2_.window;
               if(_loc3_)
               {
                  return _loc3_.y + _loc3_.height / 2;
               }
            }
         }
         switch(param1)
         {
            case HabboToolbarIconEnum.NAVIGATOR:
               return 60;
            case HabboToolbarIconEnum.QUESTS:
               return 130;
            default:
               return 0;
         }
      }
      
      public function setNewItemCount(param1:String, param2:int) : void
      {
         if(this.var_942)
         {
            this._view.setNewItemCount(param1,param2);
         }
      }
   }
}
