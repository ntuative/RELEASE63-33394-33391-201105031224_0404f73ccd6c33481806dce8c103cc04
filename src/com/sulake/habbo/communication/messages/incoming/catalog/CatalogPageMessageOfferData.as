package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1998:String;
      
      private var var_1266:int;
      
      private var var_1265:int;
      
      private var var_1997:int;
      
      private var var_1138:Array;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1998 = param1.readString();
         this.var_1266 = param1.readInteger();
         this.var_1265 = param1.readInteger();
         this.var_1997 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1138 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1138.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
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
      
      public function get products() : Array
      {
         return this.var_1138;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1997;
      }
   }
}
