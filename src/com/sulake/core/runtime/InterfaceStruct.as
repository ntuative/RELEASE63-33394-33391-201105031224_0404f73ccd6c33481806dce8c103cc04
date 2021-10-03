package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1406:IID;
      
      private var var_1711:String;
      
      private var var_103:IUnknown;
      
      private var var_733:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1406 = param1;
         this.var_1711 = getQualifiedClassName(this.var_1406);
         this.var_103 = param2;
         this.var_733 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1406;
      }
      
      public function get iis() : String
      {
         return this.var_1711;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_103;
      }
      
      public function get references() : uint
      {
         return this.var_733;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_103 == null;
      }
      
      public function dispose() : void
      {
         this.var_1406 = null;
         this.var_1711 = null;
         this.var_103 = null;
         this.var_733 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_733;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_733) : uint(0);
      }
   }
}
