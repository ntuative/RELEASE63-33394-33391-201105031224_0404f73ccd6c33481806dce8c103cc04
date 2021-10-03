package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_374:int;
      
      private var var_832:Boolean;
      
      private var var_950:String;
      
      private var _ownerName:String;
      
      private var var_2639:int;
      
      private var var_2373:int;
      
      private var var_2638:int;
      
      private var var_1646:String;
      
      private var var_2636:int;
      
      private var var_2635:Boolean;
      
      private var var_846:int;
      
      private var var_1525:int;
      
      private var var_2634:String;
      
      private var var_877:Array;
      
      private var var_2633:RoomThumbnailData;
      
      private var var_2640:Boolean;
      
      private var var_2637:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_877 = new Array();
         super();
         this.var_374 = param1.readInteger();
         this.var_832 = param1.readBoolean();
         this.var_950 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2639 = param1.readInteger();
         this.var_2373 = param1.readInteger();
         this.var_2638 = param1.readInteger();
         this.var_1646 = param1.readString();
         this.var_2636 = param1.readInteger();
         this.var_2635 = param1.readBoolean();
         this.var_846 = param1.readInteger();
         this.var_1525 = param1.readInteger();
         this.var_2634 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_877.push(_loc4_);
            _loc3_++;
         }
         this.var_2633 = new RoomThumbnailData(param1);
         this.var_2640 = param1.readBoolean();
         this.var_2637 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_877 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_374;
      }
      
      public function get event() : Boolean
      {
         return this.var_832;
      }
      
      public function get roomName() : String
      {
         return this.var_950;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2639;
      }
      
      public function get userCount() : int
      {
         return this.var_2373;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2638;
      }
      
      public function get description() : String
      {
         return this.var_1646;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2636;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2635;
      }
      
      public function get score() : int
      {
         return this.var_846;
      }
      
      public function get categoryId() : int
      {
         return this.var_1525;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2634;
      }
      
      public function get tags() : Array
      {
         return this.var_877;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2633;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2640;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2637;
      }
   }
}
