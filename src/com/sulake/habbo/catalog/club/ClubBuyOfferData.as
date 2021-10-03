package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1664:String;
      
      private var var_1665:int;
      
      private var var_2238:Boolean;
      
      private var var_2244:Boolean;
      
      private var var_2240:int;
      
      private var var_2243:int;
      
      private var var_368:ICatalogPage;
      
      private var var_2242:int;
      
      private var var_2241:int;
      
      private var var_2239:int;
      
      private var var_1450:String;
      
      private var var_2249:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1664 = param2;
         this.var_1665 = param3;
         this.var_2238 = param4;
         this.var_2244 = param5;
         this.var_2240 = param6;
         this.var_2243 = param7;
         this.var_2242 = param8;
         this.var_2241 = param9;
         this.var_2239 = param10;
      }
      
      public function dispose() : void
      {
      }
      
      public function get extraParameter() : String
      {
         return this.var_1450;
      }
      
      public function set extraParameter(param1:String) : void
      {
         this.var_1450 = param1;
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
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_220;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1665;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_368;
      }
      
      public function get priceType() : String
      {
         return Offer.const_920;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1664;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_368 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2249;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2249 = param1;
      }
   }
}
