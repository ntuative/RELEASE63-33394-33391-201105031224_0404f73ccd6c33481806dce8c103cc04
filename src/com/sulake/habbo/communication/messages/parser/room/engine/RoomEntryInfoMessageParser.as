package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1912:Boolean;
      
      private var var_2680:int;
      
      private var var_441:Boolean;
      
      private var var_1216:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get privateRoom() : Boolean
      {
         return this.var_1912;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2680;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1216;
      }
      
      public function get owner() : Boolean
      {
         return this.var_441;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1216 != null)
         {
            this.var_1216.dispose();
            this.var_1216 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1912 = param1.readBoolean();
         if(this.var_1912)
         {
            this.var_2680 = param1.readInteger();
            this.var_441 = param1.readBoolean();
         }
         else
         {
            this.var_1216 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
