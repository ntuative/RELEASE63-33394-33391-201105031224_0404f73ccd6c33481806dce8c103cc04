package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_798:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1266:String = "inventory_effects";
      
      public static const const_1267:String = "inventory_badges";
      
      public static const const_1689:String = "inventory_clothes";
      
      public static const const_1608:String = "inventory_furniture";
       
      
      private var var_2432:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_798);
         this.var_2432 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2432;
      }
   }
}
