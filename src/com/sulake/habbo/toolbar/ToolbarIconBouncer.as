package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2552:Number;
      
      private var var_1877:Number;
      
      private var var_957:Number;
      
      private var var_454:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2552 = param1;
         this.var_1877 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_957 = param1;
         this.var_454 = 0;
      }
      
      public function update() : void
      {
         this.var_957 += this.var_1877;
         this.var_454 += this.var_957;
         if(this.var_454 > 0)
         {
            this.var_454 = 0;
            this.var_957 = this.var_2552 * -1 * this.var_957;
         }
      }
      
      public function get location() : Number
      {
         return this.var_454;
      }
   }
}
