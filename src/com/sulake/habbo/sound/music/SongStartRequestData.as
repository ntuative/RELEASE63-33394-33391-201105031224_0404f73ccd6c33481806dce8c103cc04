package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1730:int;
      
      private var var_1737:Number;
      
      private var var_2383:Number;
      
      private var var_2385:int;
      
      private var var_2384:Number;
      
      private var var_2382:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1730 = param1;
         this.var_1737 = param2;
         this.var_2383 = param3;
         this.var_2384 = param4;
         this.var_2382 = param5;
         this.var_2385 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1730;
      }
      
      public function get startPos() : Number
      {
         if(this.var_1737 < 0)
         {
            return 0;
         }
         return this.var_1737 + (getTimer() - this.var_2385) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2383;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2384;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2382;
      }
   }
}
