package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1980:int = 0;
      
      public static const const_1688:int = 1;
      
      public static const const_1565:int = 2;
      
      public static const const_2110:int = 3;
      
      public static const const_1999:int = 4;
      
      public static const const_1904:int = 5;
      
      public static const const_1697:int = 10;
      
      public static const const_1991:int = 11;
      
      public static const const_1915:int = 12;
      
      public static const const_1986:int = 13;
      
      public static const const_1942:int = 16;
      
      public static const const_1978:int = 17;
      
      public static const const_2039:int = 18;
      
      public static const const_1985:int = 19;
      
      public static const const_1925:int = 20;
      
      public static const const_2043:int = 22;
      
      public static const const_2049:int = 23;
      
      public static const const_2033:int = 24;
      
      public static const const_1932:int = 25;
      
      public static const const_2087:int = 26;
      
      public static const const_2034:int = 27;
      
      public static const const_1969:int = 28;
      
      public static const const_2014:int = 29;
      
      public static const const_1929:int = 100;
      
      public static const const_1959:int = 101;
      
      public static const const_2007:int = 102;
      
      public static const const_1954:int = 103;
      
      public static const const_2045:int = 104;
      
      public static const const_2023:int = 105;
      
      public static const const_2006:int = 106;
      
      public static const const_2069:int = 107;
      
      public static const const_2093:int = 108;
      
      public static const const_2100:int = 109;
      
      public static const const_2067:int = 110;
      
      public static const const_2028:int = 111;
      
      public static const const_1916:int = 112;
      
      public static const const_2079:int = 113;
      
      public static const const_2022:int = 114;
      
      public static const const_2074:int = 115;
      
      public static const const_2062:int = 116;
      
      public static const const_2102:int = 117;
      
      public static const const_2037:int = 118;
      
      public static const const_2057:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1688:
            case const_1697:
               return "banned";
            case const_1565:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
