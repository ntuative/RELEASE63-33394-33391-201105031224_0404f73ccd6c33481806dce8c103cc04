package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1156:String = "M";
      
      public static const const_1830:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_153:Number = 0;
      
      private var var_152:Number = 0;
      
      private var var_455:int = 0;
      
      private var _name:String = "";
      
      private var var_1618:int = 0;
      
      private var var_965:String = "";
      
      private var var_672:String = "";
      
      private var var_2333:String = "";
      
      private var var_2328:int;
      
      private var var_2329:int = 0;
      
      private var var_2331:String = "";
      
      private var var_2332:int = 0;
      
      private var var_2330:int = 0;
      
      private var var_2327:String = "";
      
      private var var_180:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_180 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_180)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_153;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_180)
         {
            this.var_153 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_152;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_180)
         {
            this.var_152 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_455;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_180)
         {
            this.var_455 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_180)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_1618;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_180)
         {
            this.var_1618 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_965;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_180)
         {
            this.var_965 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_672;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_180)
         {
            this.var_672 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2333;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_180)
         {
            this.var_2333 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2328;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_180)
         {
            this.var_2328 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2329;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_180)
         {
            this.var_2329 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2331;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_180)
         {
            this.var_2331 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2332;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_180)
         {
            this.var_2332 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2330;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_180)
         {
            this.var_2330 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2327;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_180)
         {
            this.var_2327 = param1;
         }
      }
   }
}
