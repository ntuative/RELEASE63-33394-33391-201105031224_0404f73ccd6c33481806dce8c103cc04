package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2518:String;
      
      private var var_2517:Class;
      
      private var var_2519:Class;
      
      private var var_1804:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2518 = param1;
         this.var_2517 = param2;
         this.var_2519 = param3;
         if(rest == null)
         {
            this.var_1804 = new Array();
         }
         else
         {
            this.var_1804 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2518;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2517;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2519;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1804;
      }
   }
}
