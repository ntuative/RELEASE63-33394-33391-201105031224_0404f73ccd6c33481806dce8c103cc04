package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1267:String;
      
      private var var_1477:Array;
      
      private var var_1207:Array;
      
      private var var_2026:int;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1267;
      }
      
      public function get choices() : Array
      {
         return this.var_1477.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1207.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_2026;
      }
      
      public function flush() : Boolean
      {
         this.var_1267 = "";
         this.var_1477 = [];
         this.var_1207 = [];
         this.var_2026 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1267 = param1.readString();
         this.var_1477 = [];
         this.var_1207 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1477.push(param1.readString());
            this.var_1207.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2026 = param1.readInteger();
         return true;
      }
   }
}
