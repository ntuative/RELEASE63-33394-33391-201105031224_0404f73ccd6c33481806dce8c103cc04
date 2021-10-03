package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_978:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_614:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_978);
         this.var_614 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_614;
      }
   }
}
