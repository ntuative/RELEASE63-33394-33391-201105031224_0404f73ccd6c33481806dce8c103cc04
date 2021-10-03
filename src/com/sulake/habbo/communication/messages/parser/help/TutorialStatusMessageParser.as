package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1171:Boolean;
      
      private var var_1172:Boolean;
      
      private var var_1457:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1171;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1172;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1457;
      }
      
      public function flush() : Boolean
      {
         this.var_1171 = false;
         this.var_1172 = false;
         this.var_1457 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1171 = param1.readBoolean();
         this.var_1172 = param1.readBoolean();
         this.var_1457 = param1.readBoolean();
         return true;
      }
   }
}
