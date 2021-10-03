package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      public static const const_1181:int = 1;
      
      public static const const_556:int = 2;
      
      private static const const_1078:int = 5;
      
      private static const const_1511:int = 250;
      
      private static const const_1512:int = 100;
      
      private static const const_1510:int = 180;
      
      private static const const_1513:int = 200;
       
      
      private var var_393:Timer;
      
      private var var_392:Timer;
      
      private var _assets:IAssetLibrary;
      
      private var var_80:IWindowContainer;
      
      private var _parent:IWindowContainer;
      
      private var var_2073:int = 2;
      
      private var var_853:BitmapData;
      
      private var var_1054:BitmapData;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         this.var_393 = new Timer(const_1511,1);
         this.var_392 = new Timer(const_1512,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         this.var_80 = param1;
         this.var_80.visible = false;
         this._assets = param2;
         this.var_393.addEventListener(TimerEvent.TIMER,this.onDisplayTimer);
         this.var_392.addEventListener(TimerEvent.TIMER,this.onHideTimer);
         var _loc3_:BitmapDataAsset = this._assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            this.var_1054 = _loc3_.content as BitmapData;
         }
         _loc3_ = this._assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            this.var_853 = _loc3_.content as BitmapData;
         }
      }
      
      public function dispose() : void
      {
         if(this.var_393 != null)
         {
            this.var_393.removeEventListener(TimerEvent.TIMER,this.onDisplayTimer);
            this.var_393.stop();
            this.var_393 = null;
         }
         if(this.var_392 != null)
         {
            this.var_392.removeEventListener(TimerEvent.TIMER,this.onHideTimer);
            this.var_392.stop();
            this.var_392 = null;
         }
         this._assets = null;
         this.var_80 = null;
         this._parent = null;
         this.var_853 = null;
         this.var_1054 = null;
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(this.var_80 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(this._parent != null)
         {
            this._parent.removeChild(this.var_80);
         }
         this._parent = param1;
         this.var_2073 = param4;
         var _loc5_:ITextWindow = ITextWindow(this.var_80.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = this.var_80.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1510,param3.width),Math.min(const_1513,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (this.var_80.width - _loc6_.width) / 2;
            this.var_80.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      public function show() : void
      {
         this.var_392.reset();
         this.var_393.reset();
         if(this._parent == null)
         {
            return;
         }
         this.var_80.visible = true;
         this._parent.addChild(this.var_80);
         this.refreshArrow(this.var_2073);
         switch(this.var_2073)
         {
            case const_1181:
               this.var_80.x = -1 * this.var_80.width - const_1078;
               break;
            case const_556:
               this.var_80.x = this._parent.width + const_1078;
         }
         this.var_80.y = (this._parent.height - this.var_80.height) / 2;
      }
      
      public function hide() : void
      {
         this.var_80.visible = false;
         this.var_392.reset();
         this.var_393.reset();
         if(this._parent != null)
         {
            this._parent.removeChild(this.var_80);
         }
      }
      
      public function showDelayed() : void
      {
         this.var_392.reset();
         this.var_393.reset();
         this.var_393.start();
      }
      
      public function hideDelayed() : void
      {
         this.var_392.reset();
         this.var_393.reset();
         this.var_392.start();
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(this.var_80 == null || this.var_80.disposed)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(this.var_80.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_1181:
               _loc2_.bitmap = this.var_1054.clone();
               _loc2_.width = this.var_1054.width;
               _loc2_.height = this.var_1054.height;
               _loc2_.y = (this.var_80.height - this.var_1054.height) / 2;
               _loc2_.x = this.var_80.width - 1;
               break;
            case const_556:
               _loc2_.bitmap = this.var_853.clone();
               _loc2_.width = this.var_853.width;
               _loc2_.height = this.var_853.height;
               _loc2_.y = (this.var_80.height - this.var_853.height) / 2;
               _loc2_.x = -1 * this.var_853.width + 1;
         }
         _loc2_.invalidate();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         this.show();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         this.hide();
      }
   }
}
