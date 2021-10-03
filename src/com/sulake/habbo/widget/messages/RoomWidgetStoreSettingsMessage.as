package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStoreSettingsMessage extends RoomWidgetMessage
   {
      
      public static const const_1675:String = "RWSSM_STORE_SETTINGS";
      
      public static const const_935:String = "RWSSM_STORE_SOUND";
      
      public static const const_830:String = "RWSSM_PREVIEW_SOUND";
       
      
      private var var_531:Number;
      
      public function RoomWidgetStoreSettingsMessage(param1:String)
      {
         super(param1);
      }
      
      public function get volume() : Number
      {
         return this.var_531;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_531 = param1;
      }
   }
}
