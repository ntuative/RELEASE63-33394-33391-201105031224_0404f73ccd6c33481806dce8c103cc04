package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_1021:int;
      
      private var var_792:Boolean;
      
      private var var_2079:Boolean;
      
      private var var_672:String;
      
      private var var_1525:int;
      
      private var var_1760:String;
      
      private var var_1763:String;
      
      private var var_1762:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_1021 = param1.readInteger();
         this.var_792 = param1.readBoolean();
         this.var_2079 = param1.readBoolean();
         this.var_672 = param1.readString();
         this.var_1525 = param1.readInteger();
         this.var_1760 = param1.readString();
         this.var_1763 = param1.readString();
         this.var_1762 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_1021;
      }
      
      public function get online() : Boolean
      {
         return this.var_792;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_2079;
      }
      
      public function get figure() : String
      {
         return this.var_672;
      }
      
      public function get categoryId() : int
      {
         return this.var_1525;
      }
      
      public function get motto() : String
      {
         return this.var_1760;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1763;
      }
      
      public function get realName() : String
      {
         return this.var_1762;
      }
   }
}
