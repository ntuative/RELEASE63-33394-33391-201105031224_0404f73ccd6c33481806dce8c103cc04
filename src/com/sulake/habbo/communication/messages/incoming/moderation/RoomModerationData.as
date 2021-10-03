package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_374:int;
      
      private var var_2373:int;
      
      private var var_2800:Boolean;
      
      private var var_2199:int;
      
      private var _ownerName:String;
      
      private var var_117:RoomData;
      
      private var var_832:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_374 = param1.readInteger();
         this.var_2373 = param1.readInteger();
         this.var_2800 = param1.readBoolean();
         this.var_2199 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_117 = new RoomData(param1);
         this.var_832 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_117 != null)
         {
            this.var_117.dispose();
            this.var_117 = null;
         }
         if(this.var_832 != null)
         {
            this.var_832.dispose();
            this.var_832 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_374;
      }
      
      public function get userCount() : int
      {
         return this.var_2373;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2800;
      }
      
      public function get ownerId() : int
      {
         return this.var_2199;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_117;
      }
      
      public function get event() : RoomData
      {
         return this.var_832;
      }
   }
}
