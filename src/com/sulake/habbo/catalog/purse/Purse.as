package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_220:int = 0;
       
      
      private var var_1813:int = 0;
      
      private var var_1492:Dictionary;
      
      private var var_1874:int = 0;
      
      private var var_1873:int = 0;
      
      private var var_2355:Boolean = false;
      
      private var var_2505:int = 0;
      
      private var var_2508:int = 0;
      
      public function Purse()
      {
         this.var_1492 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_1813;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_1813 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1874;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1874 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1873;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1873 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1874 > 0 || this.var_1873 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2355;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2355 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2505;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2505 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2508;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2508 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1492;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1492 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1492[param1];
      }
   }
}
