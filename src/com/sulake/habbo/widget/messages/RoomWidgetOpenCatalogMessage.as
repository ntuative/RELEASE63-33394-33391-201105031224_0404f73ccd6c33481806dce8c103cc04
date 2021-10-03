package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_441:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1099:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1107:String = "RWOCM_PIXELS";
      
      public static const const_1217:String = "RWOCM_CREDITS";
       
      
      private var var_2711:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_441);
         this.var_2711 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2711;
      }
   }
}
