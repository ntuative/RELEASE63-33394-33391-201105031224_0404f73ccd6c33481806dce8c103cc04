package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1883:IID;
      
      private var var_1080:Boolean;
      
      private var var_1205:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1883 = param1;
         this.var_1205 = new Array();
         this.var_1080 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1883;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1080;
      }
      
      public function get receivers() : Array
      {
         return this.var_1205;
      }
      
      public function dispose() : void
      {
         if(!this.var_1080)
         {
            this.var_1080 = true;
            this.var_1883 = null;
            while(this.var_1205.length > 0)
            {
               this.var_1205.pop();
            }
            this.var_1205 = null;
         }
      }
   }
}
