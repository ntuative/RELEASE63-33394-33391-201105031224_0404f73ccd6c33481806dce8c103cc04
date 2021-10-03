package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_672:String;
      
      private var var_2196:String;
      
      private var var_1021:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_672 = param1;
         this.var_1021 = param2;
         this.var_2196 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_672;
      }
      
      public function get race() : String
      {
         return this.var_2196;
      }
      
      public function get gender() : String
      {
         return this.var_1021;
      }
   }
}
