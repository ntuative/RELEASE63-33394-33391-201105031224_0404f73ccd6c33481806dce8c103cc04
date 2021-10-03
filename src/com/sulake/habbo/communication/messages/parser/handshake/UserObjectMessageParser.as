package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_672:String;
      
      private var var_965:String;
      
      private var var_2742:String;
      
      private var var_1762:String;
      
      private var var_2746:int;
      
      private var var_2743:String;
      
      private var var_2745:int;
      
      private var var_2744:int;
      
      private var var_2657:int;
      
      private var _respectLeft:int;
      
      private var var_827:int;
      
      private var var_2747:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_672 = param1.readString();
         this.var_965 = param1.readString();
         this.var_2742 = param1.readString();
         this.var_1762 = param1.readString();
         this.var_2746 = param1.readInteger();
         this.var_2743 = param1.readString();
         this.var_2745 = param1.readInteger();
         this.var_2744 = param1.readInteger();
         this.var_2657 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_827 = param1.readInteger();
         this.var_2747 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_672;
      }
      
      public function get sex() : String
      {
         return this.var_965;
      }
      
      public function get customData() : String
      {
         return this.var_2742;
      }
      
      public function get realName() : String
      {
         return this.var_1762;
      }
      
      public function get tickets() : int
      {
         return this.var_2746;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2743;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2745;
      }
      
      public function get directMail() : int
      {
         return this.var_2744;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2657;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_827;
      }
      
      public function get identityId() : int
      {
         return this.var_2747;
      }
   }
}
