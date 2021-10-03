package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_1731:String;
      
      private var var_2227:String;
      
      private var var_413:BitmapDataAsset;
      
      private var var_1388:Boolean;
      
      private var var_1389:Boolean;
      
      private var var_2226:Boolean;
      
      private var _offsetX:int;
      
      private var var_1128:int;
      
      private var var_260:int;
      
      private var _height:int;
      
      private var _initialized:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_1731 = param1;
         this.var_2227 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_413 = _loc9_;
            this._initialized = false;
         }
         else
         {
            this.var_413 = null;
            this._initialized = true;
         }
         this.var_1388 = param4;
         this.var_1389 = param5;
         this._offsetX = param6;
         this.var_1128 = param7;
         this.var_2226 = param8;
      }
      
      public function dispose() : void
      {
         this.var_413 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this._initialized && this.var_413 != null)
         {
            _loc1_ = this.var_413.content as BitmapData;
            if(_loc1_ != null)
            {
               this.var_260 = _loc1_.width;
               this._height = _loc1_.height;
            }
            this._initialized = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1389;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1388;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this.var_260;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_1731;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2227;
      }
      
      public function get asset() : IAsset
      {
         return this.var_413;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2226;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1388)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1389)
         {
            return this.var_1128;
         }
         return -(this.height + this.var_1128);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1128;
      }
   }
}
