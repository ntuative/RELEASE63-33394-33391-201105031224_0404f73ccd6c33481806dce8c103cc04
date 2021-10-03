package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2417:int;
      
      private var var_2815:int;
      
      private var var_1266:int;
      
      private var var_1265:int;
      
      private var var_1997:int;
      
      private var var_2816:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2417 = param1.readInteger();
         this.var_2815 = param1.readInteger();
         this.var_1266 = param1.readInteger();
         this.var_1265 = param1.readInteger();
         this.var_1997 = param1.readInteger();
         this.var_2816 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2417;
      }
      
      public function get charges() : int
      {
         return this.var_2815;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1266;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1265;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2816;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1997;
      }
   }
}
