package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_153:Number = 0;
      
      private var var_152:Number = 0;
      
      private var var_2260:Number = 0;
      
      private var var_2262:Number = 0;
      
      private var var_2261:Number = 0;
      
      private var var_2258:Number = 0;
      
      private var var_455:int = 0;
      
      private var var_2259:int = 0;
      
      private var var_329:Array;
      
      private var var_2257:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_329 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_153 = param3;
         this.var_152 = param4;
         this.var_2260 = param5;
         this.var_455 = param6;
         this.var_2259 = param7;
         this.var_2262 = param8;
         this.var_2261 = param9;
         this.var_2258 = param10;
         this.var_2257 = param11;
         this.var_329 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_153;
      }
      
      public function get z() : Number
      {
         return this.var_152;
      }
      
      public function get localZ() : Number
      {
         return this.var_2260;
      }
      
      public function get targetX() : Number
      {
         return this.var_2262;
      }
      
      public function get targetY() : Number
      {
         return this.var_2261;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2258;
      }
      
      public function get dir() : int
      {
         return this.var_455;
      }
      
      public function get dirHead() : int
      {
         return this.var_2259;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2257;
      }
      
      public function get actions() : Array
      {
         return this.var_329.slice();
      }
   }
}
