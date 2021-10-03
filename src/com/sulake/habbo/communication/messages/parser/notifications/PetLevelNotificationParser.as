package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1654:int;
      
      private var var_2516:String;
      
      private var var_1371:int;
      
      private var var_1152:int;
      
      private var var_1735:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1654 = param1.readInteger();
         this.var_2516 = param1.readString();
         this.var_1371 = param1.readInteger();
         this.var_1152 = param1.readInteger();
         this.var_1735 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1654;
      }
      
      public function get petName() : String
      {
         return this.var_2516;
      }
      
      public function get level() : int
      {
         return this.var_1371;
      }
      
      public function get petType() : int
      {
         return this.var_1152;
      }
      
      public function get breed() : int
      {
         return this.var_1735;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
