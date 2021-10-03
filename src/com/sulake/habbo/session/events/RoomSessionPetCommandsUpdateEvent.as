package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPetCommandsUpdateEvent extends RoomSessionEvent
   {
      
      public static const PET_COMMANDS:String = "RSPIUE_ENABLED_PET_COMMANDS";
       
      
      private var var_1654:int;
      
      private var var_2255:Array;
      
      private var var_2446:Array;
      
      public function RoomSessionPetCommandsUpdateEvent(param1:IRoomSession, param2:int, param3:Array, param4:Array, param5:Boolean = false, param6:Boolean = false)
      {
         super(RoomSessionPetCommandsUpdateEvent.PET_COMMANDS,param1,param5,param6);
         this.var_1654 = param2;
         this.var_2255 = param3;
         this.var_2446 = param4;
      }
      
      public function get petId() : int
      {
         return this.var_1654;
      }
      
      public function get allCommands() : Array
      {
         return this.var_2255;
      }
      
      public function get enabledCommands() : Array
      {
         return this.var_2446;
      }
   }
}
