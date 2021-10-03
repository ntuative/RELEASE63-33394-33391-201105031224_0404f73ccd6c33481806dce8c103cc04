package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_2004:int;
      
      private var var_2313:String;
      
      private var var_1021:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2004 = param1.readInteger();
         this.var_2313 = param1.readString();
         this.var_1021 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_2004;
      }
      
      public function get figureString() : String
      {
         return this.var_2313;
      }
      
      public function get gender() : String
      {
         return this.var_1021;
      }
   }
}
