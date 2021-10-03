package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1549:Boolean;
      
      private var var_2557:int;
      
      private var var_1838:int;
      
      private var var_1839:int;
      
      private var var_2559:int;
      
      private var var_2558:int;
      
      private var var_2560:int;
      
      private var var_2395:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1549;
      }
      
      public function get commission() : int
      {
         return this.var_2557;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1838;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1839;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2558;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2559;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2560;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2395;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1549 = param1.readBoolean();
         this.var_2557 = param1.readInteger();
         this.var_1838 = param1.readInteger();
         this.var_1839 = param1.readInteger();
         this.var_2558 = param1.readInteger();
         this.var_2559 = param1.readInteger();
         this.var_2560 = param1.readInteger();
         this.var_2395 = param1.readInteger();
         return true;
      }
   }
}
