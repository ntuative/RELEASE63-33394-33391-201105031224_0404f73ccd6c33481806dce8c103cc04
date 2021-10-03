package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_793:String = "";
      
      public static const const_414:int = 0;
      
      public static const const_478:int = 255;
      
      public static const const_772:Boolean = false;
      
      public static const const_490:int = 0;
      
      public static const const_637:int = 0;
      
      public static const const_407:int = 0;
      
      public static const const_1296:int = 1;
      
      public static const const_1097:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2277:String = "";
      
      private var var_1951:int = 0;
      
      private var var_2290:int = 255;
      
      private var var_2291:Boolean = false;
      
      private var var_2289:int = 0;
      
      private var var_2288:int = 0;
      
      private var var_2287:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2277 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2277;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1951 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1951;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2290 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2290;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2291 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2291;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2289 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2289;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2288 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2288;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2287 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2287;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
