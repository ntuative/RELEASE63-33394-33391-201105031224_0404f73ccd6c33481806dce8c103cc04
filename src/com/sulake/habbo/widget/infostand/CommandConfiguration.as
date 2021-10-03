package com.sulake.habbo.widget.infostand
{
   import flash.utils.Dictionary;
   
   public class CommandConfiguration
   {
       
      
      private var var_2255:Array;
      
      private var var_1132:Dictionary;
      
      public function CommandConfiguration(param1:Array, param2:Array)
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.var_1132 = new Dictionary();
         super();
         this.var_2255 = param1;
         while(_loc3_ < param2.length)
         {
            _loc4_ = param2[_loc3_];
            this.var_1132[_loc4_] = true;
            _loc3_++;
         }
      }
      
      public function get allCommandIds() : Array
      {
         return this.var_2255;
      }
      
      public function isEnabled(param1:int) : Boolean
      {
         return this.var_1132[param1] != null;
      }
   }
}
