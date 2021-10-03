package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_65:String = "i";
      
      public static const const_83:String = "s";
      
      public static const const_209:String = "e";
       
      
      private var var_1545:String;
      
      private var var_2219:int;
      
      private var var_1260:String;
      
      private var _productCount:int;
      
      private var var_1988:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1545 = param1.readString();
         this.var_2219 = param1.readInteger();
         this.var_1260 = param1.readString();
         this._productCount = param1.readInteger();
         this.var_1988 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1545;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2219;
      }
      
      public function get extraParam() : String
      {
         return this.var_1260;
      }
      
      public function get productCount() : int
      {
         return this._productCount;
      }
      
      public function get expiration() : int
      {
         return this.var_1988;
      }
   }
}
