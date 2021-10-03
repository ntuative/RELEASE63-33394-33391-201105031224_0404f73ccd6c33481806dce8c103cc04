package com.sulake.habbo.toolbar.events
{
   import flash.events.Event;
   
   public class HabboToolbarEvent extends Event
   {
      
      public static const const_72:String = "HTE_INITIALIZED";
      
      public static const const_37:String = "HTE_TOOLBAR_CLICK";
      
      public static const const_632:String = "HTE_TOOLBAR_ORIENTATION";
      
      public static const const_785:String = "HTE_TOOLBAR_RESIZED";
      
      public static const const_313:String = "HTE_TOOLBAR_STATE_HOTEL_VIEW";
      
      public static const const_355:String = "HTE_TOOLBAR_STATE_ROOM_VIEW";
       
      
      private var var_711:String;
      
      private var var_552:String;
      
      private var var_1096:String;
      
      public function HabboToolbarEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set iconId(param1:String) : void
      {
         this.var_711 = param1;
      }
      
      public function get iconId() : String
      {
         return this.var_711;
      }
      
      public function set orientation(param1:String) : void
      {
         this.var_552 = param1;
      }
      
      public function get orientation() : String
      {
         return this.var_552;
      }
      
      public function set iconName(param1:String) : void
      {
         this.var_1096 = param1;
      }
      
      public function get iconName() : String
      {
         return this.var_1096;
      }
   }
}
