package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1110:int = 1;
      
      public static const const_859:int = 2;
      
      public static const const_984:int = 3;
      
      public static const const_1544:int = 4;
       
      
      private var _index:int;
      
      private var var_2456:String;
      
      private var var_2457:String;
      
      private var var_2455:Boolean;
      
      private var var_2458:String;
      
      private var var_896:String;
      
      private var var_2454:int;
      
      private var var_2373:int;
      
      private var _type:int;
      
      private var var_2277:String;
      
      private var var_928:GuestRoomData;
      
      private var var_929:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2456 = param1.readString();
         this.var_2457 = param1.readString();
         this.var_2455 = param1.readInteger() == 1;
         this.var_2458 = param1.readString();
         this.var_896 = param1.readString();
         this.var_2454 = param1.readInteger();
         this.var_2373 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1110)
         {
            this.var_2277 = param1.readString();
         }
         else if(this._type == const_984)
         {
            this.var_929 = new PublicRoomData(param1);
         }
         else if(this._type == const_859)
         {
            this.var_928 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_928 != null)
         {
            this.var_928.dispose();
            this.var_928 = null;
         }
         if(this.var_929 != null)
         {
            this.var_929.dispose();
            this.var_929 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2456;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2457;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2455;
      }
      
      public function get picText() : String
      {
         return this.var_2458;
      }
      
      public function get picRef() : String
      {
         return this.var_896;
      }
      
      public function get folderId() : int
      {
         return this.var_2454;
      }
      
      public function get tag() : String
      {
         return this.var_2277;
      }
      
      public function get userCount() : int
      {
         return this.var_2373;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_928;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_929;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function method_15() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1110)
         {
            return 0;
         }
         if(this.type == const_859)
         {
            return this.var_928.maxUserCount;
         }
         if(this.type == const_984)
         {
            return this.var_929.maxUsers;
         }
         return 0;
      }
   }
}
