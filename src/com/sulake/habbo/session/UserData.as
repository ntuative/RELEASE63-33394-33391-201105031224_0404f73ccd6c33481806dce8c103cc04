package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var _type:int = 0;
      
      private var var_965:String = "";
      
      private var var_672:String = "";
      
      private var var_2333:String = "";
      
      private var var_2328:int;
      
      private var var_2329:int = 0;
      
      private var var_2331:String = "";
      
      private var var_2332:int = 0;
      
      private var var_2330:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2328;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2328 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get sex() : String
      {
         return this.var_965;
      }
      
      public function set sex(param1:String) : void
      {
         this.var_965 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_672;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_672 = param1;
      }
      
      public function get custom() : String
      {
         return this.var_2333;
      }
      
      public function set custom(param1:String) : void
      {
         this.var_2333 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2329;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2329 = param1;
      }
      
      public function get groupID() : String
      {
         return this.var_2331;
      }
      
      public function set groupID(param1:String) : void
      {
         this.var_2331 = param1;
      }
      
      public function get groupStatus() : int
      {
         return this.var_2332;
      }
      
      public function set groupStatus(param1:int) : void
      {
         this.var_2332 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2330;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2330 = param1;
      }
   }
}
