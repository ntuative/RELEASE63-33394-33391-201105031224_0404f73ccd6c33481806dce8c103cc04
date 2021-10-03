package com.sulake.habbo.widget.avatarinfo
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.utils.FixedSizeStack;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AvatarInfoView
   {
      
      private static const const_1475:int = 25;
      
      private static const const_1063:int = 3;
       
      
      protected var _window:IWindowContainer;
      
      protected var _widget:AvatarInfoWidget;
      
      protected var _userId:int;
      
      protected var _userName:String;
      
      protected var var_2809:Boolean;
      
      protected var var_1618:int;
      
      protected var var_2193:int;
      
      protected var var_1344:XML;
      
      protected var var_1343:Boolean;
      
      protected var var_2150:FixedSizeStack;
      
      protected var var_2149:int = -1000000;
      
      public function AvatarInfoView(param1:AvatarInfoWidget, param2:int, param3:String, param4:int, param5:int, param6:Boolean = false)
      {
         this.var_2150 = new FixedSizeStack(const_1475);
         super();
         this._widget = param1;
         this._userId = param2;
         this._userName = param3;
         this.var_1618 = param5;
         this.var_2193 = param4;
         this.var_2809 = param6;
         this.var_1344 = XmlAsset(this._widget.assets.getAssetByName("avatar_info_widget")).content as XML;
      }
      
      public function dispose() : void
      {
         this._widget = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      protected function addMouseClickListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,param2);
         }
      }
      
      protected function createWindow() : void
      {
         if(!this._widget || !this._widget.assets || !this._widget.windowManager)
         {
            return;
         }
         this._window = this._widget.windowManager.buildFromXML(this.var_1344,0) as IWindowContainer;
         if(!this._window)
         {
            return;
         }
         var _loc1_:IWindow = this._window.findChildByName("name");
         _loc1_.caption = this._userName;
         this.setImageAsset(this._window.findChildByName("pointer") as IBitmapWrapperWindow,"arrow_down_gray");
         this.setImageAsset(this._window.findChildByName("pen_icon") as IBitmapWrapperWindow,"edit_pen_icon");
         if(!this.var_2809)
         {
            this._window.findChildByName("change_name_container").visible = false;
            this._window.findChildByName("border").height = 22;
            this._window.findChildByName("border").width = _loc1_.width + 16;
         }
         else
         {
            this.addMouseClickListener(this._window.findChildByName("change_name_container"),this.clickHandler);
         }
         this._window.visible = false;
      }
      
      protected function clickHandler(param1:WindowMouseEvent) : void
      {
         this._widget.messageListener.processWidgetMessage(new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_741));
         this._widget.disposeView();
      }
      
      public function setImageAsset(param1:IBitmapWrapperWindow, param2:String) : void
      {
         if(!param1 || !this._widget || !this._widget.assets)
         {
            return;
         }
         var _loc3_:BitmapDataAsset = this._widget.assets.getAssetByName(param2) as BitmapDataAsset;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:BitmapData = _loc3_.content as BitmapData;
         if(!_loc4_)
         {
            return;
         }
         if(param1.bitmap)
         {
            param1.bitmap.fillRect(param1.bitmap.rect,0);
         }
         else
         {
            param1.bitmap = new BitmapData(param1.width,param1.height,true,0);
         }
         param1.bitmap.draw(_loc4_);
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userType() : int
      {
         return this.var_1618;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2193;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function show() : void
      {
         if(this._window != null)
         {
            this._window.visible = true;
            this._window.activate();
         }
      }
      
      public function update(param1:Rectangle, param2:Point, param3:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(!param1)
         {
            return;
         }
         if(!this._window)
         {
            this.createWindow();
         }
         if(!this.var_1343)
         {
            _loc4_ = -this._window.height;
            if(this.var_1618 == RoomObjectTypeEnum.const_166 || this.var_1618 == RoomObjectTypeEnum.const_510)
            {
               _loc4_ += param1.height > 50 ? 25 : 0;
            }
            else
            {
               _loc4_ -= 4;
            }
            _loc5_ = param2.y - param1.top;
            this.var_2150.addValue(_loc5_);
            _loc6_ = this.var_2150.getMax();
            if(_loc6_ < this.var_2149 - const_1063)
            {
               _loc6_ = this.var_2149 - const_1063;
            }
            _loc7_ = param2.y - _loc6_;
            this.var_2149 = _loc6_;
            this._window.x = param2.x - this._window.width / 2;
            this._window.y = _loc7_ + _loc4_;
         }
         this._window.blend = param3;
         this.show();
      }
   }
}
