package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_994:int = 10;
      
      private static const const_654:int = 20;
      
      private static const const_1327:int = 31;
      
      private static const const_1328:int = 32;
       
      
      private var var_291:Array;
      
      private var var_735:Boolean = false;
      
      public function FurnitureHabboWheelVisualization()
      {
         this.var_291 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_735)
            {
               this.var_735 = true;
               this.var_291 = new Array();
               this.var_291.push(const_1327);
               this.var_291.push(const_1328);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_994)
         {
            if(this.var_735)
            {
               this.var_735 = false;
               this.var_291 = new Array();
               this.var_291.push(const_994 + param1);
               this.var_291.push(const_654 + param1);
               this.var_291.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
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
