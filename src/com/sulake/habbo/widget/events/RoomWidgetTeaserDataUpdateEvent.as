package com.sulake.habbo.widget.events
{
   public class RoomWidgetTeaserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_497:String = "RWTDUE_TEASER_DATA";
      
      public static const const_882:String = "RWTDUE_GIFT_DATA";
      
      public static const const_764:String = "RWTDUE_GIFT_RECEIVED";
       
      
      private var var_196:int;
      
      private var _data:String;
      
      private var var_401:int;
      
      private var var_182:String;
      
      private var var_2326:String;
      
      private var var_2325:Boolean;
      
      private var var_1473:int = 0;
      
      private var var_2886:String;
      
      public function RoomWidgetTeaserDataUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get objectId() : int
      {
         return this.var_196;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this.var_401;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2326;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2325;
      }
      
      public function get ownRealName() : String
      {
         return this.var_2886;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1473;
      }
      
      public function set status(param1:int) : void
      {
         this.var_401 = param1;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2326 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2325 = param1;
      }
      
      public function set ownRealName(param1:String) : void
      {
         this.var_2886 = param1;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_196 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_182;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_182 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1473 = param1;
      }
   }
}
