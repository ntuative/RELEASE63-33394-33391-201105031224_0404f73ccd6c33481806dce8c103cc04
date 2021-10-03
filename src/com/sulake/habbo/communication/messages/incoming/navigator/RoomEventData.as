package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1095:Boolean;
      
      private var var_2832:int;
      
      private var var_2828:String;
      
      private var var_374:int;
      
      private var var_2830:int;
      
      private var var_2732:String;
      
      private var var_2829:String;
      
      private var var_2831:String;
      
      private var var_877:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_877 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1095 = false;
            return;
         }
         this.var_1095 = true;
         this.var_2832 = int(_loc2_);
         this.var_2828 = param1.readString();
         this.var_374 = int(param1.readString());
         this.var_2830 = param1.readInteger();
         this.var_2732 = param1.readString();
         this.var_2829 = param1.readString();
         this.var_2831 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_877.push(_loc5_);
            _loc4_++;
         }
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
      
      public function get ownerAvatarId() : int
      {
         return this.var_2832;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2828;
      }
      
      public function get flatId() : int
      {
         return this.var_374;
      }
      
      public function get eventType() : int
      {
         return this.var_2830;
      }
      
      public function get eventName() : String
      {
         return this.var_2732;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2829;
      }
      
      public function get creationTime() : String
      {
         return this.var_2831;
      }
      
      public function get tags() : Array
      {
         return this.var_877;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1095;
      }
   }
}
