package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureScoreBoardVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1469:String = "ones_sprite";
      
      private static const const_1470:String = "tens_sprite";
      
      private static const const_1468:String = "hundreds_sprite";
      
      private static const const_1467:String = "thousands_sprite";
       
      
      public function FurnitureScoreBoardVisualization()
      {
         super();
      }
      
      override public function get animationId() : int
      {
         return 0;
      }
      
      override protected function getFrameNumber(param1:int, param2:int) : int
      {
         var _loc3_:String = getSpriteTag(param1,direction,param2);
         var _loc4_:int = super.animationId;
         switch(_loc3_)
         {
            case const_1469:
               return _loc4_ % 10;
            case const_1470:
               return _loc4_ / 10 % 10;
            case const_1468:
               return _loc4_ / 100 % 10;
            case const_1467:
               return _loc4_ / 1000 % 10;
            default:
               return super.getFrameNumber(param1,param2);
         }
      }
   }
}
