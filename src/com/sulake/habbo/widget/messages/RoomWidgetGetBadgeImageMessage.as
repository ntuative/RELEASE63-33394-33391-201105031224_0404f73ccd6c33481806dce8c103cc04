package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage
   {
      
      public static const const_982:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";
       
      
      private var var_296:String = "";
      
      public function RoomWidgetGetBadgeImageMessage(param1:String)
      {
         super(const_982);
         this.var_296 = param1;
      }
      
      public function get badgeId() : String
      {
         return this.var_296;
      }
   }
}
