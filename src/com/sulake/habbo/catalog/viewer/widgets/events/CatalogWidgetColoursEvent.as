package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_1024:Array;
      
      private var var_2157:String;
      
      private var var_2155:String;
      
      private var var_2156:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         this.var_1024 = param1;
         this.var_2157 = param2;
         this.var_2155 = param3;
         this.var_2156 = param4;
      }
      
      public function get colours() : Array
      {
         return this.var_1024;
      }
      
      public function get backgroundAssetName() : String
      {
         return this.var_2157;
      }
      
      public function get colourAssetName() : String
      {
         return this.var_2155;
      }
      
      public function get chosenColourAssetName() : String
      {
         return this.var_2156;
      }
   }
}
