package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1874:int = 0;
      
      private var var_1873:int = 0;
      
      private var var_2357:int = 0;
      
      private var var_2356:Boolean = false;
      
      private var var_2355:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1874 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1873 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2357 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2356 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2355 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1874;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1873;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2357;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2356;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2355;
      }
   }
}
