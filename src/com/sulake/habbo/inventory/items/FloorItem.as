package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_2144:String;
      
      protected var var_1441:Number;
      
      protected var var_2929:Boolean;
      
      protected var var_2930:Boolean;
      
      protected var var_2409:Boolean;
      
      protected var var_2661:Boolean;
      
      protected var var_2931:int;
      
      protected var var_2411:int;
      
      protected var var_2412:int;
      
      protected var var_2413:int;
      
      protected var var_2004:String;
      
      protected var var_1730:int;
      
      protected var var_913:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2409 = param5;
         this.var_2930 = param6;
         this.var_2929 = param7;
         this.var_2661 = param8;
         this.var_2144 = param9;
         this.var_1441 = param10;
         this.var_2931 = param11;
         this.var_2411 = param12;
         this.var_2412 = param13;
         this.var_2413 = param14;
         this.var_2004 = param15;
         this.var_1730 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_2144;
      }
      
      public function get extra() : Number
      {
         return this.var_1441;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2929;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2930;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2409;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2661;
      }
      
      public function get expires() : int
      {
         return this.var_2931;
      }
      
      public function get creationDay() : int
      {
         return this.var_2411;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2412;
      }
      
      public function get creationYear() : int
      {
         return this.var_2413;
      }
      
      public function get slotId() : String
      {
         return this.var_2004;
      }
      
      public function get songId() : int
      {
         return this.var_1730;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_913 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_913;
      }
   }
}
