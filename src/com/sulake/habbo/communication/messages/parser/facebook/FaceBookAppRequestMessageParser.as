package com.sulake.habbo.communication.messages.parser.facebook
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FaceBookAppRequestMessageParser implements IMessageParser
   {
       
      
      private var var_1837:String;
      
      private var _data:String;
      
      private var var_1836:String;
      
      private var var_2553:int;
      
      public function FaceBookAppRequestMessageParser()
      {
         super();
      }
      
      public function get authToken() : String
      {
         return this.var_1837;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get userFilter() : String
      {
         return this.var_1836;
      }
      
      public function get senderReference() : int
      {
         return this.var_2553;
      }
      
      public function flush() : Boolean
      {
         var _loc1_:* = null;
         this.var_1836 = null;
         this.var_1837 = this._data = _loc1_;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1837 = param1.readString();
         this._data = param1.readString();
         this.var_1836 = param1.readString();
         this.var_2553 = param1.readInteger();
         return true;
      }
   }
}
