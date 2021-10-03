package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChangeEmailMessage extends RoomWidgetMessage
   {
      
      public static const const_851:String = "rwcem_change_email";
       
      
      private var var_2681:String;
      
      public function RoomWidgetChangeEmailMessage(param1:String)
      {
         super(const_851);
         this.var_2681 = param1;
      }
      
      public function get newEmail() : String
      {
         return this.var_2681;
      }
   }
}
