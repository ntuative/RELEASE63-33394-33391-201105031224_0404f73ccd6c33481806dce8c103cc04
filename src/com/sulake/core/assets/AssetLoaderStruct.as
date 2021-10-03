package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_1015:IAssetLoader;
      
      private var var_1731:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_1731 = param1;
         this.var_1015 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_1731;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_1015;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_1015 != null)
            {
               if(!this.var_1015.disposed)
               {
                  this.var_1015.dispose();
                  this.var_1015 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
