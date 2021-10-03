package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2999:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         if(param2.length == 0)
         {
            return;
         }
         var_81 = param1.desktop;
         var_62 = param1.var_1323 as WindowController;
         var_174 = param1.var_1324 as WindowController;
         var_161 = param1.renderer;
         var_869 = param1.var_1327;
         param2.begin();
         param2.end();
         param1.desktop = var_81;
         param1.var_1323 = var_62;
         param1.var_1324 = var_174;
         param1.renderer = var_161;
         param1.var_1327 = var_869;
      }
   }
}
