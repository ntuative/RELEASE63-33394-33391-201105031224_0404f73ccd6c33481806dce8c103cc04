package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_951:String = "RWFUAM_ROTATE";
      
      public static const const_261:String = "RWFAM_MOVE";
      
      public static const const_932:String = "RWFAM_PICKUP";
      
      public static const const_781:String = "RWFAM_OPEN_WELCOME_GIFT";
      
      public static const const_829:String = "RWFAM_SAVE_STUFF_DATA";
       
      
      private var _furniId:int = 0;
      
      private var var_2265:int = 0;
      
      private var var_2264:String;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int, param4:String = null)
      {
         super(param1);
         this._furniId = param2;
         this.var_2265 = param3;
         this.var_2264 = param4;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniCategory() : int
      {
         return this.var_2265;
      }
      
      public function get objectData() : String
      {
         return this.var_2264;
      }
   }
}
