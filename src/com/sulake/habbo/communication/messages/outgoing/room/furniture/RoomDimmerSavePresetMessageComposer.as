package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2465:int;
      
      private var var_2466:int;
      
      private var var_2467:String;
      
      private var var_2468:int;
      
      private var var_2469:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2465 = param1;
         this.var_2466 = param2;
         this.var_2467 = param3;
         this.var_2468 = param4;
         this.var_2469 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2465,this.var_2466,this.var_2467,this.var_2468,int(this.var_2469)];
      }
      
      public function dispose() : void
      {
      }
   }
}
