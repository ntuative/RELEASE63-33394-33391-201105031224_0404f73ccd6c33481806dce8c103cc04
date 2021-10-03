package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2190:int;
      
      private var var_2187:int;
      
      private var var_2186:int;
      
      private var _dayOffsets:Array;
      
      private var var_1876:Array;
      
      private var var_1875:Array;
      
      private var var_2189:int;
      
      private var var_2188:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2190;
      }
      
      public function get offerCount() : int
      {
         return this.var_2187;
      }
      
      public function get historyLength() : int
      {
         return this.var_2186;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1876;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1875;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2189;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2188;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2190 = param1.readInteger();
         this.var_2187 = param1.readInteger();
         this.var_2186 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1876 = [];
         this.var_1875 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1876.push(param1.readInteger());
            this.var_1875.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2188 = param1.readInteger();
         this.var_2189 = param1.readInteger();
         return true;
      }
   }
}
