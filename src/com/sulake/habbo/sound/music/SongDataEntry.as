package com.sulake.habbo.sound.music
{
   import com.sulake.habbo.communication.messages.incoming.sound.PlayListEntry;
   import com.sulake.habbo.sound.IHabboSound;
   import com.sulake.habbo.sound.ISongInfo;
   
   public class SongDataEntry extends PlayListEntry implements ISongInfo
   {
       
      
      private var var_1213:IHabboSound = null;
      
      private var var_1936:String;
      
      private var var_2716:int = -1;
      
      public function SongDataEntry(param1:int, param2:int, param3:String, param4:String, param5:IHabboSound)
      {
         this.var_1213 = param5;
         this.var_1936 = "";
         super(param1,param2,param3,param4);
      }
      
      override public function get id() : int
      {
         return var_1730;
      }
      
      override public function get length() : int
      {
         return var_2147;
      }
      
      override public function get name() : String
      {
         return _songName;
      }
      
      override public function get creator() : String
      {
         return _songCreator;
      }
      
      public function get loaded() : Boolean
      {
         return this.var_1213 == null ? false : Boolean(this.var_1213.ready);
      }
      
      public function get soundObject() : IHabboSound
      {
         return this.var_1213;
      }
      
      public function get songData() : String
      {
         return this.var_1936;
      }
      
      public function get diskId() : int
      {
         return this.var_2716;
      }
      
      public function set soundObject(param1:IHabboSound) : void
      {
         this.var_1213 = param1;
      }
      
      public function set songData(param1:String) : void
      {
         this.var_1936 = param1;
      }
      
      public function set diskId(param1:int) : void
      {
         this.var_2716 = param1;
      }
   }
}
