package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2414:int;
      
      private var var_1414:String;
      
      private var var_2415:int;
      
      private var var_2416:int;
      
      private var _category:int;
      
      private var var_2144:String;
      
      private var var_1441:int;
      
      private var var_2410:int;
      
      private var var_2411:int;
      
      private var var_2412:int;
      
      private var var_2413:int;
      
      private var var_2409:Boolean;
      
      private var var_2987:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2414 = param1;
         this.var_1414 = param2;
         this.var_2415 = param3;
         this.var_2416 = param4;
         this._category = param5;
         this.var_2144 = param6;
         this.var_1441 = param7;
         this.var_2410 = param8;
         this.var_2411 = param9;
         this.var_2412 = param10;
         this.var_2413 = param11;
         this.var_2409 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2414;
      }
      
      public function get itemType() : String
      {
         return this.var_1414;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2415;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2416;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2144;
      }
      
      public function get extra() : int
      {
         return this.var_1441;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2410;
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
      
      public function get groupable() : Boolean
      {
         return this.var_2409;
      }
      
      public function get songID() : int
      {
         return this.var_1441;
      }
   }
}
