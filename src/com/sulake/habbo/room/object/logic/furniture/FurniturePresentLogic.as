package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
   import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.events.MouseEvent;
   
   public class FurniturePresentLogic extends FurnitureLogic
   {
       
      
      public function FurniturePresentLogic()
      {
         super();
      }
      
      override public function getEventTypes() : Array
      {
         var _loc1_:Array = [RoomObjectWidgetRequestEvent.const_165];
         return getAllEventTypes(super.getEventTypes(),_loc1_);
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(object == null)
         {
            return;
         }
         switch(param1.type)
         {
            case MouseEvent.ROLL_OVER:
               _loc3_ = object.getId();
               _loc4_ = object.getType();
               eventDispatcher.dispatchEvent(new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_377,_loc3_,_loc4_));
               super.mouseEvent(param1,param2);
               break;
            case MouseEvent.ROLL_OUT:
               _loc3_ = object.getId();
               _loc4_ = object.getType();
               eventDispatcher.dispatchEvent(new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_579,_loc3_,_loc4_));
               super.mouseEvent(param1,param2);
               break;
            case MouseEvent.DOUBLE_CLICK:
               if(eventDispatcher != null)
               {
                  _loc3_ = object.getId();
                  _loc4_ = object.getType();
                  _loc5_ = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.const_165,_loc3_,_loc4_);
                  eventDispatcher.dispatchEvent(_loc5_);
               }
               break;
            default:
               super.mouseEvent(param1,param2);
         }
      }
   }
}
