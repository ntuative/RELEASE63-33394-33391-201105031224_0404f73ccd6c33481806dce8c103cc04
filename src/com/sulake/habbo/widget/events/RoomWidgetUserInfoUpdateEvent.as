package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_130:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_115:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_816:int = 2;
      
      public static const const_777:int = 3;
      
      public static const const_1590:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1760:String = "";
      
      private var var_2328:int;
      
      private var var_2329:int = 0;
      
      private var var_2330:int = 0;
      
      private var var_672:String = "";
      
      private var var_46:BitmapData = null;
      
      private var var_277:Array;
      
      private var var_1419:int = 0;
      
      private var var_2588:String = "";
      
      private var var_2586:int = 0;
      
      private var var_2585:int = 0;
      
      private var var_1910:Boolean = false;
      
      private var var_1762:String = "";
      
      private var var_2590:Boolean = false;
      
      private var var_2589:Boolean = true;
      
      private var _respectLeft:int = 0;
      
      private var var_2583:Boolean = false;
      
      private var var_2584:Boolean = false;
      
      private var var_2587:Boolean = false;
      
      private var var_2592:Boolean = false;
      
      private var var_2591:Boolean = false;
      
      private var var_2581:Boolean = false;
      
      private var var_2582:int = 0;
      
      private var var_1908:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_277 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1760 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1760;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2328 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2328;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2329 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2329;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2330 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2330;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_672 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_672;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_46 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_46;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_277 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_277;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1419 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1419;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2588 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2588;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2590 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2590;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2583 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2583;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2584 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2584;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2587 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2587;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2592 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2592;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2591 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2591;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2581 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2581;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2582 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2582;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2589 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2589;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1908 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1908;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2586 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2586;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2585 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2585;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1910 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1910;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1762 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1762;
      }
   }
}
