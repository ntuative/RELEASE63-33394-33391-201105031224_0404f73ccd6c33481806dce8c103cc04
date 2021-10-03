package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_721:int = 1;
      
      public static const const_938:int = 2;
      
      public static const const_965:int = 3;
      
      public static const const_1132:int = 4;
      
      public static const const_740:int = 5;
      
      public static const const_1293:int = 6;
       
      
      private var _type:int;
      
      private var var_1179:int;
      
      private var var_2279:String;
      
      private var var_2771:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1179 = param2;
         this.var_2279 = param3;
         this.var_2771 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2279;
      }
      
      public function get time() : String
      {
         return this.var_2771;
      }
      
      public function get senderId() : int
      {
         return this.var_1179;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
