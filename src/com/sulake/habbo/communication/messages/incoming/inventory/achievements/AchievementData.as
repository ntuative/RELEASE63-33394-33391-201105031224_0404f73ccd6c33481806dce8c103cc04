package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1371:int;
      
      private var var_296:String;
      
      private var var_2774:int;
      
      private var var_2234:int;
      
      private var var_1658:int;
      
      private var var_2775:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1371 = param1.readInteger();
         this.var_296 = param1.readString();
         this.var_2774 = param1.readInteger();
         this.var_2234 = param1.readInteger();
         this.var_1658 = param1.readInteger();
         this.var_2775 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_296;
      }
      
      public function get level() : int
      {
         return this.var_1371;
      }
      
      public function get method_8() : int
      {
         return this.var_2774;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2234;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1658;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2775;
      }
   }
}
