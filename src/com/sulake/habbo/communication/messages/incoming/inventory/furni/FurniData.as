package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2515:int;
      
      private var var_1414:String;
      
      private var _objId:int;
      
      private var var_1828:int;
      
      private var _category:int;
      
      private var var_2144:String;
      
      private var var_2623:Boolean;
      
      private var var_2622:Boolean;
      
      private var var_2621:Boolean;
      
      private var var_2568:Boolean;
      
      private var var_2159:int;
      
      private var var_1441:int;
      
      private var var_2004:String = "";
      
      private var var_1730:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2515 = param1;
         this.var_1414 = param2;
         this._objId = param3;
         this.var_1828 = param4;
         this._category = param5;
         this.var_2144 = param6;
         this.var_2623 = param7;
         this.var_2622 = param8;
         this.var_2621 = param9;
         this.var_2568 = param10;
         this.var_2159 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_2004 = param1;
         this.var_1441 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2515;
      }
      
      public function get itemType() : String
      {
         return this.var_1414;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1828;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2144;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2623;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2622;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2621;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2568;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2159;
      }
      
      public function get slotId() : String
      {
         return this.var_2004;
      }
      
      public function get songId() : int
      {
         return this.var_1730;
      }
      
      public function get extra() : int
      {
         return this.var_1441;
      }
   }
}
