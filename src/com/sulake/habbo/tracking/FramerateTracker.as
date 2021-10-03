package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1795:int;
      
      private var var_2490:int;
      
      private var var_858:int;
      
      private var var_567:Number;
      
      private var var_2491:Boolean;
      
      private var var_2489:int;
      
      private var var_1796:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_567);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2490 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2489 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2491 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_858;
         if(this.var_858 == 1)
         {
            this.var_567 = param1;
            this.var_1795 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_858);
            this.var_567 = this.var_567 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2491 && param3 - this.var_1795 >= this.var_2490)
         {
            this.var_858 = 0;
            if(this.var_1796 < this.var_2489)
            {
               param2.track("performance","averageFramerate",this.frameRate);
               ++this.var_1796;
               this.var_1795 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
