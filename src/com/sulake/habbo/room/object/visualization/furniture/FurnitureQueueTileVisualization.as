package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1328:int = 3;
      
      private static const const_1370:int = 2;
      
      private static const const_1371:int = 1;
      
      private static const const_1369:int = 15;
       
      
      private var var_291:Array;
      
      private var var_1144:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_291 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1370)
         {
            this.var_291 = new Array();
            this.var_291.push(const_1371);
            this.var_1144 = const_1369;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1144 > 0)
         {
            --this.var_1144;
         }
         if(this.var_1144 == 0)
         {
            if(this.var_291.length > 0)
            {
               super.setAnimation(this.var_291.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
