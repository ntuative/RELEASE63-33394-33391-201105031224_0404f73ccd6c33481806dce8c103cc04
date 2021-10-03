package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeLevelMessageData
   {
       
      
      private var var_1470:int;
      
      private var var_2442:int;
      
      private var var_622:Array;
      
      public function PrizeLevelMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1470 = param1.readInteger();
         this.var_2442 = param1.readInteger();
         this.var_622 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_622.push(new PrizeMessageData(param1));
            _loc3_++;
         }
      }
      
      public function get prizeLevelId() : int
      {
         return this.var_1470;
      }
      
      public function get probabilityDenominator() : int
      {
         return this.var_2442;
      }
      
      public function get prizes() : Array
      {
         return this.var_622;
      }
   }
}
