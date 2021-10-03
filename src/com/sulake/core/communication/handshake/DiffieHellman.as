package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_919:BigInteger;
      
      private var var_2359:BigInteger;
      
      private var var_1725:BigInteger;
      
      private var var_2358:BigInteger;
      
      private var var_1413:BigInteger;
      
      private var var_1724:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1413 = param1;
         this.var_1724 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1413.toString() + ",generator: " + this.var_1724.toString() + ",secret: " + param1);
         this.var_919 = new BigInteger();
         this.var_919.fromRadix(param1,param2);
         this.var_2359 = this.var_1724.modPow(this.var_919,this.var_1413);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1725 = new BigInteger();
         this.var_1725.fromRadix(param1,param2);
         this.var_2358 = this.var_1725.modPow(this.var_919,this.var_1413);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2359.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2358.toRadix(param1);
      }
   }
}
