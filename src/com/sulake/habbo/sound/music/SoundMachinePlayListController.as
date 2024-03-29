package com.sulake.habbo.sound.music
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.sound.PlayListEntry;
   import com.sulake.habbo.communication.messages.incoming.sound.PlayListMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.sound.PlayListSongAddedMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.sound.GetSoundMachinePlayListMessageComposer;
   import com.sulake.habbo.communication.messages.parser.sound.PlayListMessageParser;
   import com.sulake.habbo.communication.messages.parser.sound.PlayListSongAddedMessageParser;
   import com.sulake.habbo.room.events.RoomEngineSoundMachineEvent;
   import com.sulake.habbo.sound.HabboMusicPrioritiesEnum;
   import com.sulake.habbo.sound.HabboSoundManagerFlash10;
   import com.sulake.habbo.sound.IPlayListController;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.events.PlayListStatusEvent;
   import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
   import com.sulake.habbo.sound.events.SoundCompleteEvent;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class SoundMachinePlayListController implements IPlayListController
   {
       
      
      private var _soundManager:HabboSoundManagerFlash10;
      
      private var var_223:HabboMusicController;
      
      private var _connection:IConnection;
      
      private var _events:IEventDispatcher;
      
      private var var_78:IEventDispatcher;
      
      private var var_415:int = -1;
      
      private var _playListEntries:Array;
      
      private var var_596:Boolean;
      
      private var _disposed:Boolean = false;
      
      private var var_716:Array;
      
      public function SoundMachinePlayListController(param1:HabboSoundManagerFlash10, param2:HabboMusicController, param3:IEventDispatcher, param4:IEventDispatcher, param5:IConnection)
      {
         var _loc6_:* = null;
         this._playListEntries = new Array();
         super();
         this._soundManager = param1;
         this._events = param3;
         this.var_78 = param4;
         this._connection = param5;
         this.var_223 = param2;
         this.var_716 = [];
         this.var_716.push(new PlayListMessageEvent(this.onPlayListMessage));
         this.var_716.push(new PlayListSongAddedMessageEvent(this.onPlayListSongAddedMessage));
         for each(_loc6_ in this.var_716)
         {
            this._connection.addMessageEvent(_loc6_);
         }
         this._events.addEventListener(SoundCompleteEvent.TRAX_SONG_COMPLETE,this.onSongFinishedPlayingEvent);
         this._events.addEventListener(SongInfoReceivedEvent.const_91,this.onSongInfoReceivedEvent);
         this.var_78.addEventListener(RoomEngineSoundMachineEvent.const_799,this.onSoundMachinePlayEvent);
         this.var_78.addEventListener(RoomEngineSoundMachineEvent.const_786,this.onSoundMachineStopEvent);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get priority() : int
      {
         return HabboMusicPrioritiesEnum.const_134;
      }
      
      public function get length() : int
      {
         if(this._playListEntries == null)
         {
            return 0;
         }
         return this._playListEntries.length;
      }
      
      public function get playPosition() : int
      {
         return -1;
      }
      
      public function get nowPlayingSongId() : int
      {
         return this.var_415;
      }
      
      public function get isPlaying() : Boolean
      {
         return this.var_596;
      }
      
      public function set playPosition(param1:int) : void
      {
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(!this._disposed)
         {
            if(this.var_596)
            {
               this.stopPlaying();
            }
            this._soundManager = null;
            if(this._connection)
            {
               for each(_loc1_ in this.var_716)
               {
                  this._connection.removeMessageEvent(_loc1_);
                  _loc1_.dispose();
               }
               this.var_716 = null;
               this._connection = null;
            }
            this._playListEntries = null;
            this.var_223 = null;
            if(this._events)
            {
               this._events.removeEventListener(SoundCompleteEvent.TRAX_SONG_COMPLETE,this.onSongFinishedPlayingEvent);
               this._events = null;
            }
            if(this.var_78)
            {
               this.var_78.removeEventListener(RoomEngineSoundMachineEvent.const_799,this.onSoundMachinePlayEvent);
               this.var_78.removeEventListener(RoomEngineSoundMachineEvent.const_786,this.onSoundMachineStopEvent);
               this.var_78 = null;
            }
            this._disposed = true;
         }
      }
      
      private function onSoundMachinePlayEvent(param1:Event) : void
      {
         this.startPlaying();
      }
      
      private function onSoundMachineStopEvent(param1:Event) : void
      {
         this.stopPlaying();
      }
      
      public function startPlaying() : void
      {
         if(this.var_596)
         {
            return;
         }
         if(this._playListEntries == null || this._playListEntries.length == 0)
         {
            this.requestPlayList();
            this.var_596 = true;
            return;
         }
         this.stopPlaying();
         this.var_415 = -1;
         this.var_596 = true;
         this.playNextSong();
      }
      
      public function checkSongPlayState(param1:int) : void
      {
         var _loc2_:* = null;
         if(this.var_415 == param1)
         {
            this.playCurrentSongAndNotify(this.var_415);
            _loc2_ = this.getNextEntry();
            if(_loc2_ != null)
            {
               this.var_223.addSongInfoRequest(_loc2_.id);
            }
         }
      }
      
      public function stopPlaying() : void
      {
         this.var_415 = -1;
         this.var_596 = false;
         this.var_223.stop(HabboMusicPrioritiesEnum.const_134);
      }
      
      public function updateVolume(param1:Number) : void
      {
      }
      
      public function addItem(param1:ISongInfo, param2:int = 0) : int
      {
         return -1;
      }
      
      public function moveItem(param1:int, param2:int) : void
      {
      }
      
      public function removeItem(param1:int) : void
      {
      }
      
      private function onSongFinishedPlayingEvent(param1:SoundCompleteEvent) : void
      {
         if(param1.id == this.var_415)
         {
            this.playNextSong();
         }
      }
      
      private function onSongInfoReceivedEvent(param1:SongInfoReceivedEvent) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         if(this._playListEntries == null || this._playListEntries.length == 0)
         {
            return;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this._playListEntries.length)
         {
            _loc2_ = this._playListEntries[_loc3_];
            if(_loc2_.id == param1.id)
            {
               _loc4_ = this.var_223.getSongInfo(param1.id) as SongDataEntry;
               if(_loc4_ != null)
               {
                  this._playListEntries[_loc3_] = _loc4_;
               }
               return;
            }
            _loc3_++;
         }
      }
      
      private function playNextSong() : void
      {
         var _loc1_:SongDataEntry = this.getNextEntry();
         if(_loc1_ != null)
         {
            this.var_415 = _loc1_.id;
            this.playCurrentSongAndNotify(this.var_415);
         }
      }
      
      private function playCurrentSongAndNotify(param1:int) : void
      {
         var _loc2_:SongDataEntry = this.getEntryWithId(param1) as SongDataEntry;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:Number = _loc2_.startPlayHeadPos;
         _loc2_.startPlayHeadPos = 0;
         if(this.var_223.playSong(param1,HabboMusicPrioritiesEnum.const_134,_loc3_,0,0,0))
         {
            Logger.log("Trax song started by playlist: " + _loc2_.name + " by " + _loc2_.creator);
         }
      }
      
      private function getNextEntry() : SongDataEntry
      {
         var _loc2_:* = null;
         if(this._playListEntries == null || this._playListEntries.length == 0)
         {
            return null;
         }
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this._playListEntries.length)
         {
            _loc2_ = this._playListEntries[_loc3_];
            if(_loc2_.id == this.var_415)
            {
               _loc1_ = _loc3_ + 1;
            }
            _loc3_++;
         }
         if(_loc1_ >= this._playListEntries.length)
         {
            _loc1_ = 0;
         }
         return this._playListEntries[_loc1_];
      }
      
      public function getEntry(param1:int) : ISongInfo
      {
         if(this._playListEntries == null || param1 < 0 || param1 >= this._playListEntries.length)
         {
            return null;
         }
         return this._playListEntries[param1];
      }
      
      public function getEntryWithId(param1:int) : ISongInfo
      {
         var _loc2_:* = null;
         if(this._playListEntries == null || this._playListEntries.length == 0)
         {
            return null;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this._playListEntries.length)
         {
            _loc2_ = this._playListEntries[_loc3_];
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function requestPlayList() : void
      {
         if(this._connection == null)
         {
            return;
         }
         this._connection.send(new GetSoundMachinePlayListMessageComposer());
      }
      
      private function convertParserPlayList(param1:Array) : Array
      {
         var _loc3_:* = null;
         var _loc2_:Array = new Array();
         for each(_loc3_ in param1)
         {
            _loc2_.push(new SongDataEntry(_loc3_.id,_loc3_.length,_loc3_.name,_loc3_.creator,null));
         }
         return _loc2_;
      }
      
      private function onPlayListMessage(param1:IMessageEvent) : void
      {
         var _loc6_:* = null;
         var _loc8_:int = 0;
         var _loc2_:PlayListMessageEvent = param1 as PlayListMessageEvent;
         var _loc3_:PlayListMessageParser = _loc2_.getParser() as PlayListMessageParser;
         var _loc4_:int = _loc3_.synchronizationCount;
         var _loc5_:Array = this.convertParserPlayList(_loc3_.playList);
         if(_loc5_ == null || _loc5_.length == 0)
         {
            return;
         }
         this._playListEntries = _loc5_;
         var _loc7_:int = 0;
         _loc8_ = 0;
         while(_loc8_ < _loc5_.length)
         {
            _loc6_ = this._playListEntries[_loc8_];
            _loc7_ += _loc6_.length;
            _loc8_++;
         }
         if(_loc4_ < 0)
         {
            _loc4_ = 0;
         }
         _loc4_ %= _loc7_;
         _loc8_ = 0;
         while(_loc8_ < _loc5_.length)
         {
            _loc6_ = this._playListEntries[_loc8_];
            if(_loc4_ <= _loc6_.length)
            {
               this.var_415 = _loc6_.id;
               _loc6_.startPlayHeadPos = Number(_loc4_) / 1000;
            }
            _loc4_ -= _loc6_.length;
            _loc8_++;
         }
         this._events.dispatchEvent(new PlayListStatusEvent(PlayListStatusEvent.const_105));
         if(_loc6_ != null && this.var_596)
         {
            this.playCurrentSongAndNotify(_loc6_.id);
         }
      }
      
      private function onPlayListSongAddedMessage(param1:IMessageEvent) : void
      {
         var _loc2_:PlayListSongAddedMessageEvent = param1 as PlayListSongAddedMessageEvent;
         var _loc3_:PlayListSongAddedMessageParser = _loc2_.getParser() as PlayListSongAddedMessageParser;
         var _loc4_:SongDataEntry = new SongDataEntry(_loc3_.entry.id,_loc3_.entry.length,_loc3_.entry.name,_loc3_.entry.creator,null);
         if(_loc4_ == null)
         {
            return;
         }
         this._playListEntries.push(_loc4_);
         this._events.dispatchEvent(new PlayListStatusEvent(PlayListStatusEvent.const_105));
         if(!this.var_596)
         {
            return;
         }
         if(this._playListEntries.length == 1)
         {
            this.playCurrentSongAndNotify(_loc4_.id);
         }
         else
         {
            this.checkSongPlayState(_loc4_.id);
         }
      }
   }
}
