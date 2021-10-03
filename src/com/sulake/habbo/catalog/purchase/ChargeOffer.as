package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.communication.messages.incoming.catalog.ChargeInfo;
   
   public class ChargeOffer implements IPurchasableOffer
   {
       
      
      private var var_1468:ChargeInfo;
      
      private var var_1450:String;
      
      public function ChargeOffer(param1:ChargeInfo)
      {
         super();
         this.var_1468 = param1;
      }
      
      public function get offerId() : int
      {
         return 0;
      }
      
      public function get extraParameter() : String
      {
         return this.var_1450;
      }
      
      public function set extraParameter(param1:String) : void
      {
         this.var_1450 = param1;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1468.priceInActivityPoints;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1468.activityPointType;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1468.priceInCredits;
      }
      
      public function get page() : ICatalogPage
      {
         return null;
      }
      
      public function get priceType() : String
      {
         return null;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return null;
      }
   }
}
