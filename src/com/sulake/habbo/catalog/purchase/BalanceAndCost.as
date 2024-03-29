package com.sulake.habbo.catalog.purchase
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   
   public class BalanceAndCost
   {
       
      
      private var var_2256:String;
      
      private var var_2302:String;
      
      public function BalanceAndCost(param1:HabboCatalog, param2:ICoreLocalizationManager, param3:IPurchasableOffer)
      {
         super();
         if(param3.priceInCredits > 0 && param3.priceInActivityPoints > 0)
         {
            this.setWithKey(param1,param2,param3,"catalog.purchase.confirmation.dialog.price.credits+activitypoints." + param3.activityPointType);
         }
         else if(param3.priceInCredits > 0)
         {
            this.setWithKey(param1,param2,param3,"catalog.purchase.confirmation.dialog.price.credits");
         }
         else if(param3.priceInActivityPoints > 0)
         {
            this.setWithKey(param1,param2,param3,"catalog.purchase.confirmation.dialog.price.activitypoints." + param3.activityPointType);
         }
         else
         {
            this.setWithKey(param1,param2,param3,"catalog.purchase.confirmation.dialog.price.nothing");
         }
      }
      
      private function setWithKey(param1:HabboCatalog, param2:ICoreLocalizationManager, param3:IPurchasableOffer, param4:String) : void
      {
         var _loc5_:String = param1.getPurse().credits.toString();
         var _loc6_:String = param3.activityPointType == Purse.const_220 ? "pixels" : "activitypoints";
         var _loc7_:ILocalization = param2.getLocalization(param4);
         if(_loc7_)
         {
            param2.registerParameter(param4,"credits",param3.priceInCredits.toString());
            param2.registerParameter(param4,_loc6_,param3.priceInActivityPoints.toString());
            this.var_2302 = _loc7_.value;
            param2.registerParameter(param4,"credits",_loc5_);
            param2.registerParameter(param4,_loc6_,param1.getPurse().getActivityPointsForType(param3.activityPointType).toString());
            this.var_2256 = _loc7_.value;
         }
         else
         {
            Logger.log("[CATALOG] Add pricing-model-localization for activity-point-type: " + param4);
         }
      }
      
      public function get balance() : String
      {
         return this.var_2256;
      }
      
      public function get cost() : String
      {
         return this.var_2302;
      }
   }
}
