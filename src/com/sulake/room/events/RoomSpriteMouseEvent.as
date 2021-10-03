package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_2085:String = "";
      
      private var var_2080:String = "";
      
      private var var_2300:String = "";
      
      private var var_2298:Number = 0;
      
      private var var_2295:Number = 0;
      
      private var var_2294:Number = 0;
      
      private var var_2293:Number = 0;
      
      private var var_2299:Boolean = false;
      
      private var var_2301:Boolean = false;
      
      private var var_2297:Boolean = false;
      
      private var var_2296:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_2085 = param2;
         this.var_2080 = param3;
         this.var_2300 = param4;
         this.var_2298 = param5;
         this.var_2295 = param6;
         this.var_2294 = param7;
         this.var_2293 = param8;
         this.var_2299 = param9;
         this.var_2301 = param10;
         this.var_2297 = param11;
         this.var_2296 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_2085;
      }
      
      public function get canvasId() : String
      {
         return this.var_2080;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2300;
      }
      
      public function get screenX() : Number
      {
         return this.var_2298;
      }
      
      public function get screenY() : Number
      {
         return this.var_2295;
      }
      
      public function get localX() : Number
      {
         return this.var_2294;
      }
      
      public function get localY() : Number
      {
         return this.var_2293;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2299;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2301;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2297;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2296;
      }
   }
}
