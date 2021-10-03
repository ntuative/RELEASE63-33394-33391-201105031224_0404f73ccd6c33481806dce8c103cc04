package com.sulake.habbo.room.events
{
   public class RoomEngineObjectEvent extends RoomEngineEvent
   {
      
      public static const const_693:String = "REOE_OBJECT_SELECTED";
      
      public static const const_533:String = "REOE_OBJECT_DESELECTED";
      
      public static const const_402:String = "REOB_OBJECT_ADDED";
      
      public static const ROOM_OBJECT_REMOVED:String = "REOE_OBJECT_REMOVED";
      
      public static const const_174:String = "REOB_OBJECT_PLACED";
      
      public static const const_862:String = "REOB_OBJECT_REQUEST_MOVE";
      
      public static const const_178:String = "REOB_OBJECT_MOUSE_ENTER";
      
      public static const const_189:String = "REOB_OBJECT_MOUSE_LEAVE";
      
      public static const const_157:String = "REOE_WIDGET_REQUEST_PLACEHOLDER";
      
      public static const ROOM_OBJECT_WIDGET_REQUEST_CREDITFURNI:String = "REOE_WIDGET_REQUEST_CREDITFURNI";
      
      public static const const_153:String = "REOE_WIDGET_REQUEST_STICKIE";
      
      public static const const_165:String = "REOE_WIDGET_REQUEST_PRESENT";
      
      public static const const_149:String = "REOE_WIDGET_REQUEST_TROPHY";
      
      public static const const_164:String = "REOE_WIDGET_REQUEST_TEASER";
      
      public static const const_143:String = "REOE_WIDGET_REQUEST_ECOTRONBOX";
      
      public static const const_141:String = "REOE_WIDGET_REQUEST_DIMMER";
      
      public static const const_113:String = "REOR_REMOVE_DIMMER";
      
      public static const const_139:String = "REOR_REQUEST_CLOTHING_CHANGE";
      
      public static const const_148:String = "REOR_WIDGET_REQUEST_PLAYLIST_EDITOR";
      
      public static const const_605:String = "REOE_ROOM_AD_FURNI_CLICK";
      
      public static const const_627:String = "REOE_ROOM_AD_FURNI_DOUBLE_CLICK";
      
      public static const const_515:String = "REOE_ROOM_AD_TOOLTIP_SHOW";
      
      public static const const_534:String = "REOE_ROOM_AD_TOOLTIP_HIDE";
       
      
      private var var_196:int;
      
      private var _category:int;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      public function RoomEngineObjectEvent(param1:String, param2:int, param3:int, param4:int, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param2,param3,param6,param7);
         this.var_196 = param4;
         this._category = param5;
      }
      
      public function get objectId() : int
      {
         return this.var_196;
      }
      
      public function get category() : int
      {
         return this._category;
      }
   }
}
