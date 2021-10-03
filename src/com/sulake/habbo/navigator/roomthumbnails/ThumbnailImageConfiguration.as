package com.sulake.habbo.navigator.roomthumbnails
{
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ThumbnailImageConfiguration
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _id:int;
      
      private var _type:int;
      
      private var var_1886:String;
      
      private var var_1885:BitmapData;
      
      private var _selected:Boolean;
      
      private var var_1887:BitmapData;
      
      private var var_640:IBitmapWrapperWindow;
      
      private var var_1888:Rectangle;
      
      private var var_1498:int = 1;
      
      public function ThumbnailImageConfiguration(param1:HabboNavigator, param2:int, param3:int, param4:String, param5:BitmapData)
      {
         super();
         this._navigator = param1;
         this._id = param2;
         this._type = param3;
         this.var_1886 = param4;
         this.var_1887 = param5;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get picName() : String
      {
         return this.var_1886;
      }
      
      public function getImg() : BitmapData
      {
         if(this.var_1885 == null)
         {
            this.var_1885 = this._navigator.getButtonImage(this.var_1886);
         }
         return this.var_1885;
      }
      
      public function registerListImg(param1:IBitmapWrapperWindow) : void
      {
         this.var_640 = param1;
         this.refreshListImg();
      }
      
      public function copyTo(param1:BitmapData) : void
      {
         var _loc2_:BitmapData = this.getImg();
         param1.copyPixels(_loc2_,_loc2_.rect,new Point((param1.width - _loc2_.width) / 2,param1.height - _loc2_.height),null,null,true);
      }
      
      public function setSelected(param1:Boolean) : void
      {
         if(this._selected == param1)
         {
            return;
         }
         this._selected = param1;
         this.refreshListImg();
      }
      
      private function refreshListImg() : void
      {
         var _loc1_:* = null;
         if(this.var_1888 == null)
         {
            _loc1_ = this.var_640.bitmap.rect;
            this.var_1888 = new Rectangle(this.var_1498,this.var_1498,_loc1_.width - 2 * this.var_1498,_loc1_.height - 2 * this.var_1498);
         }
         this.var_640.bitmap.fillRect(this.var_640.bitmap.rect,4281545523);
         this.var_640.bitmap.fillRect(this.var_1888,4284900966);
         this.copyTo(this.var_640.bitmap);
         if(this._selected)
         {
            this.var_640.bitmap.copyPixels(this.var_1887,this.var_1887.rect,new Point(0,0),null,null,true);
         }
         this.var_640.invalidate();
      }
   }
}
