package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2266:Number = 0.0;
      
      private var var_2267:Number = 0.0;
      
      private var var_2470:Number = 0.0;
      
      private var var_2471:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2266 = param1;
         this.var_2267 = param2;
         this.var_2470 = param3;
         this.var_2471 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2266;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2267;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2470;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2471;
      }
   }
}
