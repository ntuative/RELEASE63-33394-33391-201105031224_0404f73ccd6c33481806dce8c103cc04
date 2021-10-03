package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1550:String = "pricing_model_unknown";
      
      public static const const_408:String = "pricing_model_single";
      
      public static const const_390:String = "pricing_model_multi";
      
      public static const const_644:String = "pricing_model_bundle";
      
      public static const const_1746:String = "price_type_none";
      
      public static const const_920:String = "price_type_credits";
      
      public static const const_1234:String = "price_type_activitypoints";
      
      public static const const_1239:String = "price_type_credits_and_activitypoints";
       
      
      private var var_828:String;
      
      private var var_1264:String;
      
      private var _offerId:int;
      
      private var var_1998:String;
      
      private var var_1266:int;
      
      private var var_1265:int;
      
      private var var_1997:int;
      
      private var var_368:ICatalogPage;
      
      private var var_671:IProductContainer;
      
      private var var_2778:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:Array, param7:ICatalogPage)
      {
         super();
         this._offerId = param1;
         this.var_1998 = param2;
         this.var_1266 = param3;
         this.var_1265 = param4;
         this.var_1997 = param5;
         this.var_368 = param7;
         this.analyzePricingModel(param6);
         this.analyzePriceType();
         this.createProductContainer(param6);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_368;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1998;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1266;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1265;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1997;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_671;
      }
      
      public function get pricingModel() : String
      {
         return this.var_828;
      }
      
      public function get priceType() : String
      {
         return this.var_1264;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2778;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2778 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1998 = "";
         this.var_1266 = 0;
         this.var_1265 = 0;
         this.var_1997 = 0;
         this.var_368 = null;
         if(this.var_671 != null)
         {
            this.var_671.dispose();
            this.var_671 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_828)
         {
            case const_408:
               this.var_671 = new SingleProductContainer(this,param1);
               break;
            case const_390:
               this.var_671 = new MultiProductContainer(this,param1);
               break;
            case const_644:
               this.var_671 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_828);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_828 = const_408;
            }
            else
            {
               this.var_828 = const_390;
            }
         }
         else if(param1.length > 1)
         {
            this.var_828 = const_644;
         }
         else
         {
            this.var_828 = const_1550;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1266 > 0 && this.var_1265 > 0)
         {
            this.var_1264 = const_1239;
         }
         else if(this.var_1266 > 0)
         {
            this.var_1264 = const_920;
         }
         else if(this.var_1265 > 0)
         {
            this.var_1264 = const_1234;
         }
         else
         {
            this.var_1264 = const_1746;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_368.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_671.products)
         {
            _loc4_ = this.var_368.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,_loc1_,this.page);
      }
   }
}
