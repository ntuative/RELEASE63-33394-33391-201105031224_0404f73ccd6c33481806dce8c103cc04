package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_196:int;
      
      private var var_2516:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_196 = param1;
         this.var_2516 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_196,this.var_2516];
      }
      
      public function dispose() : void
      {
      }
   }
}
