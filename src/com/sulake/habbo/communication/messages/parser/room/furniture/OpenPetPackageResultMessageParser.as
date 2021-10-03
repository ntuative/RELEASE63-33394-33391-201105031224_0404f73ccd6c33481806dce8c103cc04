package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_196:int = 0;
      
      private var var_1764:int = 0;
      
      private var var_1765:String = null;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_196;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1764;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1765;
      }
      
      public function flush() : Boolean
      {
         this.var_196 = 0;
         this.var_1764 = 0;
         this.var_1765 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_196 = param1.readInteger();
         this.var_1764 = param1.readInteger();
         this.var_1765 = param1.readString();
         return true;
      }
   }
}
