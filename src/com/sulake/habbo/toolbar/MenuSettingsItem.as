package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2426:String;
      
      private var var_2425:Array;
      
      private var var_2427:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2426 = param1;
         this.var_2425 = param2;
         this.var_2427 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2426;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2425;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2427;
      }
   }
}
