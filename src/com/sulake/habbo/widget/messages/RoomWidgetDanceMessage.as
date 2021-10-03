package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDanceMessage extends RoomWidgetMessage
   {
      
      public static const const_901:String = "RWCM_MESSAGE_DANCE";
      
      public static const const_1235:int = 0;
      
      public static const const_1797:Array = [2,3,4];
       
      
      private var var_77:int = 0;
      
      public function RoomWidgetDanceMessage(param1:int)
      {
         super(const_901);
         this.var_77 = param1;
      }
      
      public function get style() : int
      {
         return this.var_77;
      }
   }
}
