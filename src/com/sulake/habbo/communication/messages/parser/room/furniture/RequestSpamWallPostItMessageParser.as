package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RequestSpamWallPostItMessageParser implements IMessageParser
   {
       
      
      private var var_1854:int;
      
      private var var_454:String;
      
      public function RequestSpamWallPostItMessageParser()
      {
         super();
      }
      
      public function get itemId() : int
      {
         return this.var_1854;
      }
      
      public function get location() : String
      {
         return this.var_454;
      }
      
      public function flush() : Boolean
      {
         this.var_1854 = -1;
         this.var_454 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1854 = param1.readInteger();
         this.var_454 = param1.readString();
         return true;
      }
   }
}
