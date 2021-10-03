package com.sulake.habbo.widget.messages
{
   public class RoomWidgetViralFurniMessage extends RoomWidgetMessage
   {
      
      public static const const_784:String = "RWVFM_VIRAL_FOUND";
      
      public static const const_182:String = "RWVFM_OPEN_PRESENT";
       
      
      private var var_196:int;
      
      public function RoomWidgetViralFurniMessage(param1:String)
      {
         super(param1);
      }
      
      public function get objectId() : int
      {
         return this.var_196;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_196 = param1;
      }
   }
}
