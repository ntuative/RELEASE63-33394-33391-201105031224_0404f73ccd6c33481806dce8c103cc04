package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1922:int;
      
      private var var_2695:int;
      
      private var var_1439:int;
      
      private var var_2689:int;
      
      private var var_117:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1922 = param1.readInteger();
         this.var_2695 = param1.readInteger();
         this.var_1439 = param1.readInteger();
         this.var_2689 = param1.readInteger();
         this.var_117 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1922);
      }
      
      public function get callId() : int
      {
         return this.var_1922;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2695;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1439;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2689;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_117;
      }
   }
}
