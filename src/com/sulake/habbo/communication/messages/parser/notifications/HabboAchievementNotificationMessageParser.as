package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1371:int;
      
      private var var_1981:int;
      
      private var var_2234:int;
      
      private var var_1658:int;
      
      private var var_1372:int;
      
      private var var_2369:String = "";
      
      private var var_2859:String = "";
      
      private var var_2860:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1371 = param1.readInteger();
         this.var_2369 = param1.readString();
         this.var_1981 = param1.readInteger();
         this.var_2234 = param1.readInteger();
         this.var_1658 = param1.readInteger();
         this.var_1372 = param1.readInteger();
         this.var_2860 = param1.readInteger();
         this.var_2859 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1371;
      }
      
      public function get points() : int
      {
         return this.var_1981;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2234;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1658;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1372;
      }
      
      public function get badgeID() : String
      {
         return this.var_2369;
      }
      
      public function get achievementID() : int
      {
         return this.var_2860;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2859;
      }
   }
}
