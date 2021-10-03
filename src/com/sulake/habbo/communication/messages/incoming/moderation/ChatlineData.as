package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2377:int;
      
      private var var_2376:int;
      
      private var var_2375:int;
      
      private var var_2378:String;
      
      private var var_1851:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2377 = param1.readInteger();
         this.var_2376 = param1.readInteger();
         this.var_2375 = param1.readInteger();
         this.var_2378 = param1.readString();
         this.var_1851 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2377;
      }
      
      public function get minute() : int
      {
         return this.var_2376;
      }
      
      public function get chatterId() : int
      {
         return this.var_2375;
      }
      
      public function get chatterName() : String
      {
         return this.var_2378;
      }
      
      public function get msg() : String
      {
         return this.var_1851;
      }
   }
}
