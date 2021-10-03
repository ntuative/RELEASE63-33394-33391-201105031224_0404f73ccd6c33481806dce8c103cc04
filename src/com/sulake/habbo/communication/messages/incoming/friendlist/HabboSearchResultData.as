package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2403:int;
      
      private var var_1889:String;
      
      private var var_2643:String;
      
      private var var_2784:Boolean;
      
      private var var_2786:Boolean;
      
      private var var_2783:int;
      
      private var var_2644:String;
      
      private var var_2785:String;
      
      private var var_1762:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2403 = param1.readInteger();
         this.var_1889 = param1.readString();
         this.var_2643 = param1.readString();
         this.var_2784 = param1.readBoolean();
         this.var_2786 = param1.readBoolean();
         param1.readString();
         this.var_2783 = param1.readInteger();
         this.var_2644 = param1.readString();
         this.var_2785 = param1.readString();
         this.var_1762 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2403;
      }
      
      public function get avatarName() : String
      {
         return this.var_1889;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2643;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2784;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2786;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2783;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2644;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2785;
      }
      
      public function get realName() : String
      {
         return this.var_1762;
      }
   }
}
