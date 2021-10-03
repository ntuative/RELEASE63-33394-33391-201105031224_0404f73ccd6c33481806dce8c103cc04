package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_2071:int = 1;
      
      public static const const_1996:int = 2;
      
      public static const const_1956:int = 3;
      
      public static const const_1911:int = 4;
      
      public static const const_1659:int = 5;
      
      public static const const_1966:int = 6;
      
      public static const const_1831:int = 7;
      
      public static const const_1701:int = 8;
      
      public static const const_1983:int = 9;
      
      public static const const_1823:int = 10;
      
      public static const const_1609:int = 11;
      
      public static const const_1707:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1704:int;
      
      private var var_1468:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1704 = param1.readInteger();
         this.var_1468 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1704;
      }
      
      public function get info() : String
      {
         return this.var_1468;
      }
   }
}
