package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionViralFurniStatusEvent extends RoomSessionEvent
   {
      
      public static const const_508:String = "RSVFS_STATUS";
      
      public static const const_645:String = "RSVFS_RECEIVED";
       
      
      private var var_182:String;
      
      private var var_196:int;
      
      private var var_401:int = -1;
      
      private var _shareId:String;
      
      private var var_2326:String;
      
      private var var_2325:Boolean;
      
      private var var_1473:int = 0;
      
      public function RoomSessionViralFurniStatusEvent(param1:String, param2:IRoomSession, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param2,param3,param4);
         this.var_401 = this.status;
         this._shareId = this.shareId;
      }
      
      public function get objectId() : int
      {
         return this.var_196;
      }
      
      public function get status() : int
      {
         return this.var_401;
      }
      
      public function get shareId() : String
      {
         return this._shareId;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2326;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2325;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1473;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_196 = param1;
      }
      
      public function set status(param1:int) : void
      {
         this.var_401 = param1;
      }
      
      public function set shareId(param1:String) : void
      {
         this._shareId = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2326 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2325 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1473 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_182;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_182 = param1;
      }
   }
}
