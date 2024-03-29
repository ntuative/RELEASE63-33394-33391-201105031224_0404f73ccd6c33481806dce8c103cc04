package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomReadyMessageParser implements IMessageParser
   {
       
      
      private var var_1715:String = "";
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function RoomReadyMessageParser()
      {
         super();
      }
      
      public function get roomType() : String
      {
         return this.var_1715;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function flush() : Boolean
      {
         this.var_1715 = "";
         this._roomId = 0;
         this._roomCategory = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1715 = param1.readString();
         this._roomId = param1.readInteger();
         return true;
      }
   }
}
