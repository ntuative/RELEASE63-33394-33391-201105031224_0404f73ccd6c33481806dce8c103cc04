package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_119:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1733:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_119);
         this.var_1733 = param1;
      }
      
      public function get vote() : int
      {
         return this.var_1733;
      }
   }
}
