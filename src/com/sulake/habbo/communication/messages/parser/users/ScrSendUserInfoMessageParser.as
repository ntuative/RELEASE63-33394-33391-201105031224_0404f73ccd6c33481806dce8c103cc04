package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1976:int = 1;
      
      public static const const_1668:int = 2;
       
      
      private var var_964:String;
      
      private var var_2514:int;
      
      private var var_2506:int;
      
      private var var_2510:int;
      
      private var var_2511:int;
      
      private var var_2509:Boolean;
      
      private var var_2355:Boolean;
      
      private var var_2505:int;
      
      private var var_2508:int;
      
      private var var_2513:Boolean;
      
      private var var_2507:int;
      
      private var var_2512:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_964 = param1.readString();
         this.var_2514 = param1.readInteger();
         this.var_2506 = param1.readInteger();
         this.var_2510 = param1.readInteger();
         this.var_2511 = param1.readInteger();
         this.var_2509 = param1.readBoolean();
         this.var_2355 = param1.readBoolean();
         this.var_2505 = param1.readInteger();
         this.var_2508 = param1.readInteger();
         this.var_2513 = param1.readBoolean();
         this.var_2507 = param1.readInteger();
         this.var_2512 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_964;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2514;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2506;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2510;
      }
      
      public function get responseType() : int
      {
         return this.var_2511;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2509;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2355;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2505;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2508;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2513;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2507;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2512;
      }
   }
}
