package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_268:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2348:int = 0;
      
      private var var_2345:int = 0;
      
      private var var_2347:int = 0;
      
      private var var_2346:Boolean = false;
      
      private var var_2220:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_268,param6,param7);
         this.var_2348 = param1;
         this.var_2345 = param2;
         this.var_2347 = param3;
         this.var_2346 = param4;
         this.var_2220 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2348;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2345;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2347;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2346;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2220;
      }
   }
}
