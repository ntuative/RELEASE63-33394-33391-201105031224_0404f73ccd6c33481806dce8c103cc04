package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1902:int;
      
      private var _currentPosition:int;
      
      private var var_1904:int;
      
      private var var_1905:int;
      
      private var var_1903:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1902;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1904;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1905;
      }
      
      public function get syncCount() : int
      {
         return this.var_1903;
      }
      
      public function flush() : Boolean
      {
         this.var_1902 = -1;
         this._currentPosition = -1;
         this.var_1904 = -1;
         this.var_1905 = -1;
         this.var_1903 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1902 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1904 = param1.readInteger();
         this.var_1905 = param1.readInteger();
         this.var_1903 = param1.readInteger();
         return true;
      }
   }
}
