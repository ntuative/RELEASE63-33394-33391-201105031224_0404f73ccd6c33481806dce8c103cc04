package com.sulake.habbo.communication.demo
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.IHabboWebLogin;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Rectangle;
   import flash.net.SharedObject;
   
   public class HabboLoginDemoView extends EventDispatcher
   {
      
      public static const const_475:String = "InitConnection";
       
      
      private var var_164:HabboCommunicationDemo;
      
      private var _window:IWindowContainer;
      
      private var var_143:SSOTicket;
      
      public var name:String = "";
      
      public var password:String = "";
      
      private const const_1872:String = "fuselogin";
      
      public function HabboLoginDemoView(param1:HabboCommunicationDemo)
      {
         super();
         this.var_164 = param1;
         this.createWindow();
      }
      
      public function dispose() : void
      {
      }
      
      public function closeLoginWindow() : void
      {
         this.var_164.windowManager.removeWindow("habbo_login_window");
      }
      
      public function get useSSOTicket() : Boolean
      {
         var _loc1_:ISelectableWindow = this._window.findChildByName("useTicket") as ISelectableWindow;
         if(_loc1_ != null)
         {
            return _loc1_.isSelected;
         }
         return false;
      }
      
      public function get useExistingSession() : Boolean
      {
         var _loc1_:ISelectableWindow = this._window.findChildByName("useExistingSession") as ISelectableWindow;
         if(_loc1_ != null)
         {
            return _loc1_.isSelected;
         }
         return false;
      }
      
      private function createWindow() : void
      {
         var _loc1_:XmlAsset = (this.var_164 as Component).assets.getAssetByName("login_window") as XmlAsset;
         if(_loc1_ == null)
         {
            Logger.log("Could  not find embedded Window XML for Login Window, login_window");
            return;
         }
         this._window = this.var_164.windowManager.createWindow("habbo_login_window","Login",HabboWindowType.const_156,HabboWindowStyle.const_44,0 | 0,new Rectangle(10,10,320,240),null) as IFrameWindow;
         var _loc2_:XML = _loc1_.content as XML;
         var _loc3_:IWindowContainer = this.var_164.windowManager.buildFromXML(_loc2_) as IWindowContainer;
         this._window.addChild(_loc3_);
         this._window.width = _loc3_.width + 20;
         this._window.height = _loc3_.height + 40;
         _loc3_.x = 10;
         _loc3_.y = 30;
         this._window.center();
         var _loc4_:IButtonWindow = _loc3_.findChildByName("login_btn") as IButtonWindow;
         var _loc5_:ITextFieldWindow = _loc3_.findChildByName("name_field") as ITextFieldWindow;
         var _loc6_:ITextFieldWindow = _loc3_.findChildByName("pwd_field") as ITextFieldWindow;
         if(_loc4_ != null)
         {
            _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.windowEventProcessor);
         }
         else
         {
            Logger.log("Could not find the button");
         }
         var _loc7_:SharedObject = SharedObject.getLocal(this.const_1872,"/");
         if(_loc5_ != null)
         {
            _loc5_.textBackground = true;
            _loc5_.textBackgroundColor = 16777215;
            if(_loc7_.data.login != null)
            {
               _loc5_.text = _loc7_.data.login;
            }
         }
         if(_loc6_ != null)
         {
            _loc6_.textBackground = true;
            _loc6_.textBackgroundColor = 16777215;
            if(_loc7_.data.password != null)
            {
               _loc6_.text = _loc7_.data.password;
            }
         }
         var _loc8_:ISelectableWindow = this._window.findChildByName("useTicket") as ISelectableWindow;
         if(_loc8_)
         {
            if(this.var_164.habboConfiguration)
            {
               if(this.var_164.habboConfiguration.getKey("use.sso","HabboRoomObjectVisualizationLib_manifest") == "true")
               {
                  _loc8_.select();
               }
            }
         }
         var _loc9_:ISelectableWindow = this._window.findChildByName("useExistingSession") as ISelectableWindow;
         if(_loc9_)
         {
            _loc9_.unselect();
         }
      }
      
      public function populateUserList(param1:Map) : void
      {
         var _loc5_:* = null;
         var _loc2_:IItemListWindow = this._window.findChildByName("list") as IItemListWindow;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:XmlAsset = this.var_164.assets.getAssetByName("login_user_list_item") as XmlAsset;
         var _loc4_:IWindow = this.var_164.windowManager.buildFromXML(_loc3_.content as XML);
         _loc4_.procedure = this.listEventHandler;
         var _loc6_:int = 0;
         while(_loc6_ < param1.length)
         {
            _loc5_ = _loc4_.clone();
            _loc5_.id = param1.getKey(_loc6_);
            _loc5_.caption = param1.getWithIndex(_loc6_);
            _loc2_.addListItem(_loc5_);
            _loc6_++;
         }
         _loc4_.dispose();
      }
      
      public function displayResults(param1:String) : void
      {
         var _loc2_:ITextWindow = this._window.findChildByName("text002") as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.text = param1;
         }
      }
      
      private function windowEventProcessor(param1:WindowEvent = null, param2:IWindow = null) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:IWindowContainer = param1.target.parent as IWindowContainer;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.findChildByName("name_field") as ITextFieldWindow;
            _loc5_ = _loc3_.findChildByName("pwd_field") as ITextFieldWindow;
            if(_loc4_ != null)
            {
               this.name = _loc4_.text;
            }
            if(_loc5_ != null)
            {
               this.password = _loc5_.text;
            }
            _loc6_ = SharedObject.getLocal(this.const_1872,"/");
            _loc6_.data.login = this.name;
            _loc6_.data.password = this.password;
            _loc6_.flush();
         }
         if(this.useSSOTicket)
         {
            this.initSSOTicket(this.useExistingSession);
         }
         else
         {
            dispatchEvent(new Event(const_475));
         }
      }
      
      private function listEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_164.sendTryLogin(this.name,this.password,param2.id);
      }
      
      private function initSSOTicket(param1:Boolean) : void
      {
         if(this.var_143 != null)
         {
            this.var_143.removeEventListener(SSOTicket.const_435,this.onParsedTicketSuccess);
            this.var_143.removeEventListener(SSOTicket.const_304,this.onParsedTicketFailure);
            this.var_143 = null;
         }
         var _loc2_:String = "";
         if(this.var_164.habboConfiguration != null)
         {
            _loc2_ = this.var_164.habboConfiguration.getKey("url.prefix",_loc2_);
            _loc2_ = _loc2_.replace("http://","");
            _loc2_ = _loc2_.replace("https://","");
         }
         var _loc3_:IHabboWebLogin = this.var_164.habboCommunication.habboWebLogin(this.name,this.password);
         this.var_143 = new SSOTicket(this.var_164.assets,_loc3_,_loc2_,param1);
         this.var_143.addEventListener(SSOTicket.const_435,this.onParsedTicketSuccess);
         this.var_143.addEventListener(SSOTicket.const_304,this.onParsedTicketFailure);
      }
      
      private function onParsedTicketSuccess(param1:Event) : void
      {
         Logger.log("Got ticket: " + this.var_143.ticket);
         Logger.log("Has Facebook: " + this.var_143.isFacebookUser);
         if(this.var_143.isFacebookUser)
         {
            this.var_164.habboConfiguration.setKey("facebook.user","1");
         }
         this.var_164.flashClientUrl = this.var_143.flashClientUrl;
         this.var_164.ssoTicket = this.var_143.ticket;
         this.var_143.removeEventListener(SSOTicket.const_435,this.onParsedTicketSuccess);
         this.var_143.removeEventListener(SSOTicket.const_304,this.onParsedTicketFailure);
         this.var_143 = null;
         dispatchEvent(new Event(const_475));
      }
      
      private function onParsedTicketFailure(param1:Event) : void
      {
         Logger.log("Could not get a ticket! ");
         this.var_143.removeEventListener(SSOTicket.const_435,this.onParsedTicketSuccess);
         this.var_143.removeEventListener(SSOTicket.const_304,this.onParsedTicketFailure);
         this.var_143 = null;
         dispatchEvent(new Event(const_475));
      }
   }
}
