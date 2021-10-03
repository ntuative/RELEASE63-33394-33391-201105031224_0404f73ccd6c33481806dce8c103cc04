package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1664:String;
      
      private var var_1665:int;
      
      private var var_2238:Boolean;
      
      private var var_2244:Boolean;
      
      private var var_2240:int;
      
      private var var_2243:int;
      
      private var var_2242:int;
      
      private var var_2241:int;
      
      private var var_2239:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1664 = param1.readString();
         this.var_1665 = param1.readInteger();
         this.var_2238 = param1.readBoolean();
         this.var_2244 = param1.readBoolean();
         this.var_2240 = param1.readInteger();
         this.var_2243 = param1.readInteger();
         this.var_2242 = param1.readInteger();
         this.var_2241 = param1.readInteger();
         this.var_2239 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1664;
      }
      
      public function get price() : int
      {
         return this.var_1665;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2238;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2244;
      }
      
      public function get periods() : int
      {
         return this.var_2240;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2243;
      }
      
      public function get year() : int
      {
         return this.var_2242;
      }
      
      public function get month() : int
      {
         return this.var_2241;
      }
      
      public function get day() : int
      {
         return this.var_2239;
      }
   }
}
