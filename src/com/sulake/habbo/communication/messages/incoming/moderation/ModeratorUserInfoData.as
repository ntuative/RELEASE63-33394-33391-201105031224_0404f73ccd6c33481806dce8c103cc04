package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2902:int;
      
      private var var_2900:int;
      
      private var var_792:Boolean;
      
      private var var_2903:int;
      
      private var var_2901:int;
      
      private var var_2899:int;
      
      private var var_2904:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2902 = param1.readInteger();
         this.var_2900 = param1.readInteger();
         this.var_792 = param1.readBoolean();
         this.var_2903 = param1.readInteger();
         this.var_2901 = param1.readInteger();
         this.var_2899 = param1.readInteger();
         this.var_2904 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2902;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2900;
      }
      
      public function get online() : Boolean
      {
         return this.var_792;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2903;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2901;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2899;
      }
      
      public function get banCount() : int
      {
         return this.var_2904;
      }
   }
}
