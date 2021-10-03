package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPetPackageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_509:String = "RWOPPUE_OPEN_PET_PACKAGE_REQUESTED";
      
      public static const const_594:String = "RWOPPUE_OPEN_PET_PACKAGE_RESULT";
      
      public static const const_375:String = "RWOPPUE_OPEN_PET_PACKAGE_UPDATE_PET_IMAGE";
       
      
      private var var_196:int = -1;
      
      private var var_46:BitmapData = null;
      
      private var var_1764:int = 0;
      
      private var var_1765:String = null;
      
      public function RoomWidgetPetPackageUpdateEvent(param1:String, param2:int, param3:BitmapData, param4:int, param5:String, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_196 = param2;
         this.var_46 = param3;
         this.var_1764 = param4;
         this.var_1765 = param5;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1764;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1765;
      }
      
      public function get image() : BitmapData
      {
         return this.var_46;
      }
      
      public function get objectId() : int
      {
         return this.var_196;
      }
   }
}
