package com.sulake.habbo.friendbar.data
{
   public class FriendEntity implements IFriendEntity
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_1021:int;
      
      private var var_792:Boolean;
      
      private var var_1761:Boolean;
      
      private var var_672:String;
      
      private var var_1525:int;
      
      private var var_1760:String;
      
      private var var_1763:String;
      
      private var var_1762:String;
      
      public function FriendEntity(param1:int, param2:String, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:String)
      {
         super();
         this._id = param1;
         this._name = param2;
         this.var_1762 = param3;
         this.var_1760 = param4;
         this.var_1021 = param5;
         this.var_792 = param6;
         this.var_1761 = param7;
         this.var_672 = param8;
         this.var_1525 = param9;
         this.var_1763 = param10;
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
      
      public function get allowFollow() : Boolean
      {
         return this.var_1761;
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
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_1021 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_792 = param1;
      }
      
      public function set allowFollow(param1:Boolean) : void
      {
         this.var_1761 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_672 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1525 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1760 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1763 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1762 = param1;
      }
   }
}
