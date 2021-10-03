package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1704:int;
      
      private var var_1756:int;
      
      private var var_1757:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1756 = param1.readInteger();
         this.var_1704 = param1.readInteger();
         this.var_1757 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1704 = 0;
         this.var_1756 = 0;
         this.var_1757 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1704;
      }
      
      public function get messageId() : int
      {
         return this.var_1756;
      }
      
      public function get timestamp() : String
      {
         return this.var_1757;
      }
   }
}
