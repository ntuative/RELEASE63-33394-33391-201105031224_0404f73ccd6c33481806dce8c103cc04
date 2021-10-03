package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneBitmapMask
   {
       
      
      private var _type:String = null;
      
      private var var_2266:Number = 0.0;
      
      private var var_2267:Number = 0.0;
      
      public function RoomPlaneBitmapMask(param1:String, param2:Number, param3:Number)
      {
         super();
         this._type = param1;
         this.var_2266 = param2;
         this.var_2267 = param3;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2266;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2267;
      }
   }
}
