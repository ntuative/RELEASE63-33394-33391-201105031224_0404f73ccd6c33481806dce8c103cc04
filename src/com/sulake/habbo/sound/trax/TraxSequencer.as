package com.sulake.habbo.sound.trax
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.sound.IHabboSound;
   import com.sulake.habbo.sound.events.SoundCompleteEvent;
   import flash.events.IEventDispatcher;
   import flash.events.SampleDataEvent;
   import flash.events.TimerEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   
   public class TraxSequencer implements IHabboSound
   {
      
      private static const const_118:Number = 44100;
      
      private static const const_194:uint = 8192;
      
      private static const const_1500:uint = 88000;
      
      private static const const_1501:uint = 88000;
      
      private static const const_301:Vector.<int> = new Vector.<int>(const_194,true);
       
      
      private var _events:IEventDispatcher;
      
      private var var_531:Number;
      
      private var var_1580:Sound;
      
      private var var_461:SoundChannel;
      
      private var var_1578:TraxData;
      
      private var var_2059:Map;
      
      private var var_1075:Boolean;
      
      private var var_1730:int;
      
      private var var_1579:int = 0;
      
      private var var_214:uint;
      
      private var var_1045:Array;
      
      private var var_2057:Boolean;
      
      private var var_682:Boolean = true;
      
      private var var_390:uint;
      
      private var var_1577:uint;
      
      private var var_1044:Boolean;
      
      private var var_849:Boolean;
      
      private var var_848:int;
      
      private var var_462:int;
      
      private var var_1046:int;
      
      private var var_553:int;
      
      private var var_683:Timer;
      
      private var var_463:Timer;
      
      private var var_1303:int = 0;
      
      private var var_2058:int = 0;
      
      public function TraxSequencer(param1:int, param2:TraxData, param3:Map, param4:IEventDispatcher)
      {
         this.var_1577 = uint(30);
         super();
         this._events = param4;
         this.var_1730 = param1;
         this.var_531 = 1;
         this.var_1580 = new Sound();
         this.var_461 = null;
         this.var_2059 = param3;
         this.var_1578 = param2;
         this.var_2059 = param3;
         this.var_1075 = true;
         this.var_214 = 0;
         this.var_1045 = [];
         this.var_2057 = false;
         this.var_390 = 0;
         this.var_682 = false;
         this.var_1044 = false;
         this.var_849 = false;
         this.var_848 = 0;
         this.var_462 = 0;
         this.var_1046 = 0;
         this.var_553 = 0;
      }
      
      public function set position(param1:Number) : void
      {
         this.var_214 = uint(param1 * const_118);
      }
      
      public function get volume() : Number
      {
         return this.var_531;
      }
      
      public function get position() : Number
      {
         return this.var_214 / const_118;
      }
      
      public function get ready() : Boolean
      {
         return this.var_1075;
      }
      
      public function set ready(param1:Boolean) : void
      {
         this.var_1075 = param1;
      }
      
      public function get finished() : Boolean
      {
         return this.var_682;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_462 / const_118;
      }
      
      public function set fadeOutSeconds(param1:Number) : void
      {
         this.var_462 = int(param1 * const_118);
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_848 / const_118;
      }
      
      public function set fadeInSeconds(param1:Number) : void
      {
         this.var_848 = int(param1 * const_118);
      }
      
      public function get traxData() : TraxData
      {
         return this.var_1578;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_531 = param1;
         if(this.var_461 != null)
         {
            this.var_461.soundTransform = new SoundTransform(this.var_531);
         }
      }
      
      public function get length() : Number
      {
         return this.var_390 / const_118;
      }
      
      public function prepare() : Boolean
      {
         if(!this.var_1075)
         {
            Logger.log("Cannot start trax playback until samples ready!");
            return false;
         }
         if(!this.var_2057)
         {
            if(!this.prepareSequence())
            {
               Logger.log("Cannot start playback, prepare sequence failed!");
               return false;
            }
         }
         return true;
      }
      
      private function prepareSequence() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.var_1578.channels.length)
         {
            _loc2_ = new Map();
            _loc3_ = this.var_1578.channels[_loc1_] as TraxChannel;
            _loc4_ = 0;
            _loc5_ = 0;
            _loc6_ = 0;
            while(_loc6_ < _loc3_.itemCount)
            {
               _loc7_ = _loc3_.getItem(_loc6_).id;
               _loc8_ = this.var_2059.getValue(_loc7_) as TraxSample;
               if(_loc8_ == null)
               {
                  Logger.log("Error in prepareSequence(), sample was null!");
               }
               continue;
               _loc9_ = this.getSampleBars(_loc8_.length);
               _loc10_ = _loc3_.getItem(_loc6_).length / _loc9_;
               _loc11_ = 0;
               while(_loc11_ < _loc10_)
               {
                  if(_loc7_ != 0)
                  {
                     _loc2_.add(_loc4_,_loc8_);
                  }
                  _loc5_ += _loc9_;
                  _loc4_ = uint(_loc5_ * const_1501);
                  _loc11_++;
               }
               if(this.var_390 < _loc4_)
               {
                  this.var_390 = _loc4_;
               }
               _loc6_++;
               return false;
            }
            this.var_1045.push(_loc2_);
            _loc1_++;
         }
         this.var_2057 = true;
         return true;
      }
      
      public function play(param1:Number = 0.0) : Boolean
      {
         if(!this.prepare())
         {
            return false;
         }
         this.removeFadeoutStopTimer();
         if(this.var_461 != null)
         {
            this.stopImmediately();
         }
         if(this.var_848 > 0)
         {
            this.var_1044 = true;
            this.var_1046 = 0;
         }
         this.var_849 = false;
         this.var_553 = 0;
         this.var_682 = false;
         this.var_1580.addEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
         this.var_1579 = param1 * const_118;
         this.var_1303 = 0;
         this.var_2058 = 0;
         this.var_461 = this.var_1580.play();
         return true;
      }
      
      public function render(param1:SampleDataEvent) : Boolean
      {
         if(!this.prepare())
         {
            return false;
         }
         while(!this.var_682)
         {
            this.onSampleData(param1);
         }
         return true;
      }
      
      public function stop() : Boolean
      {
         if(this.var_462 > 0 && !this.var_682)
         {
            this.stopWithFadeout();
         }
         else
         {
            this.playingComplete();
         }
         return true;
      }
      
      private function stopImmediately() : void
      {
         this.removeStopTimer();
         if(this.var_461 != null)
         {
            this.var_461.stop();
            this.var_461 = null;
         }
         this.var_1580.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
      }
      
      private function stopWithFadeout() : void
      {
         if(this.var_683 == null)
         {
            this.var_849 = true;
            this.var_553 = 0;
            this.var_683 = new Timer(this.var_1577 + this.var_462 / (const_118 / 1000),1);
            this.var_683.start();
            this.var_683.addEventListener(TimerEvent.TIMER_COMPLETE,this.onFadeOutComplete);
         }
      }
      
      private function getSampleBars(param1:uint) : int
      {
         return Math.ceil(param1 / const_1500);
      }
      
      private function getChannelSequenceOffsets() : Array
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc1_:* = [];
         var _loc2_:int = this.var_1045.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.var_1045[_loc3_];
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length && _loc4_.getKey(_loc5_) < this.var_214)
            {
               _loc5_++;
            }
            _loc1_.push(_loc5_ - 1);
            _loc3_++;
         }
         return _loc1_;
      }
      
      private function mixChannelsIntoBuffer() : void
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc1_:Array = this.getChannelSequenceOffsets();
         var _loc2_:int = this.var_1045.length;
         var _loc3_:* = null;
         var _loc4_:int = _loc2_ - 1;
         while(_loc4_ >= 0)
         {
            _loc5_ = this.var_1045[_loc4_];
            _loc6_ = _loc1_[_loc4_];
            _loc7_ = _loc5_.getWithIndex(_loc6_);
            if(_loc7_ == null)
            {
               _loc3_ = null;
            }
            else
            {
               _loc10_ = _loc5_.getKey(_loc6_);
               _loc11_ = this.var_214 - _loc10_;
               if(_loc7_.id == 0 || _loc11_ < 0)
               {
                  _loc3_ = null;
               }
               else
               {
                  _loc3_ = new TraxChannelSample(_loc7_,_loc11_);
               }
            }
            _loc8_ = const_194;
            if(this.var_390 - this.var_214 < _loc8_)
            {
               _loc8_ = this.var_390 - this.var_214;
            }
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               _loc12_ = _loc8_;
               if(_loc6_ < _loc5_.length - 1)
               {
                  _loc13_ = _loc5_.getKey(_loc6_ + 1);
                  if(_loc8_ + this.var_214 >= _loc13_)
                  {
                     _loc12_ = _loc13_ - this.var_214;
                  }
               }
               if(_loc12_ > _loc8_ - _loc9_)
               {
                  _loc12_ = _loc8_ - _loc9_;
               }
               if(_loc4_ == _loc2_ - 1)
               {
                  if(_loc3_ != null)
                  {
                     _loc3_.setSample(const_301,_loc9_,_loc12_);
                     _loc9_ += _loc12_;
                  }
                  else
                  {
                     _loc14_ = 0;
                     while(_loc14_ < _loc12_)
                     {
                        var _loc15_:*;
                        const_301[_loc15_ = _loc9_++] = 0;
                        _loc14_++;
                     }
                  }
               }
               else
               {
                  if(_loc3_ != null)
                  {
                     _loc3_.addSample(const_301,_loc9_,_loc12_);
                  }
                  _loc9_ += _loc12_;
               }
               if(_loc9_ < _loc8_)
               {
                  _loc7_ = _loc5_.getWithIndex(++_loc6_);
                  if(_loc7_ == null || _loc7_.id == 0)
                  {
                     _loc3_ = null;
                  }
                  else
                  {
                     _loc3_ = new TraxChannelSample(_loc7_,0);
                  }
               }
            }
            _loc4_--;
         }
      }
      
      private function checkSongFinishing() : void
      {
         var _loc1_:int = this.var_390 < this.var_1579 ? int(this.var_390) : (this.var_1579 > 0 ? int(this.var_1579) : int(this.var_390));
         if(this.var_214 > _loc1_ + this.var_1577 * (const_118 / 1000) && !this.var_682)
         {
            this.var_682 = true;
            if(this.var_463 != null)
            {
               this.var_463.reset();
               this.var_463.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onPlayingComplete);
            }
            this.var_463 = new Timer(2,1);
            this.var_463.start();
            this.var_463.addEventListener(TimerEvent.TIMER_COMPLETE,this.onPlayingComplete);
         }
         else if(this.var_214 > _loc1_ - this.var_462 && !this.var_849)
         {
            this.var_1044 = false;
            this.var_849 = true;
            this.var_553 = 0;
         }
      }
      
      private function onSampleData(param1:SampleDataEvent) : void
      {
         if(param1.position > this.var_1303)
         {
            ++this.var_2058;
            Logger.log("Audio buffer under run...");
            this.var_1303 = param1.position;
         }
         if(this.volume > 0)
         {
            this.mixChannelsIntoBuffer();
         }
         var _loc2_:int = const_194;
         if(this.var_390 - this.var_214 < _loc2_)
         {
            _loc2_ = this.var_390 - this.var_214;
            if(_loc2_ < 0)
            {
               _loc2_ = 0;
            }
         }
         if(this.volume <= 0)
         {
            _loc2_ = 0;
         }
         this.writeAudioToOutputStream(param1.data,_loc2_);
         this.var_214 += const_194;
         this.var_1303 += const_194;
         if(this.var_461 != null)
         {
            this.var_1577 = param1.position / const_118 * 1000 - this.var_461.position;
         }
         this.checkSongFinishing();
      }
      
      private function writeAudioToOutputStream(param1:ByteArray, param2:int) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(param2 > 0)
         {
            if(!this.var_1044 && !this.var_849)
            {
               this.writeMixingBufferToOutputStream(param1,param2);
            }
            else
            {
               if(this.var_1044)
               {
                  _loc5_ = 1 / this.var_848;
                  _loc6_ = this.var_1046 / Number(this.var_848);
                  this.var_1046 += const_194;
                  if(this.var_1046 > this.var_848)
                  {
                     this.var_1044 = false;
                  }
               }
               else if(this.var_849)
               {
                  _loc5_ = -1 / this.var_462;
                  _loc6_ = 1 - this.var_553 / Number(this.var_462);
                  this.var_553 += const_194;
                  if(this.var_553 > this.var_462)
                  {
                     this.var_553 = this.var_462;
                  }
               }
               this.writeMixingBufferToOutputStreamWithFade(param1,param2,_loc6_,_loc5_);
            }
         }
         var _loc4_:int = param2;
         while(_loc4_ < const_194)
         {
            param1.writeFloat(0);
            param1.writeFloat(0);
            _loc4_++;
         }
      }
      
      private function writeMixingBufferToOutputStream(param1:ByteArray, param2:int) : void
      {
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         while(_loc4_ < param2)
         {
            _loc3_ = Number(Number(const_301[_loc4_]) * 0 * this.volume);
            param1.writeFloat(_loc3_);
            param1.writeFloat(_loc3_);
            _loc4_++;
         }
      }
      
      private function writeMixingBufferToOutputStreamWithFade(param1:ByteArray, param2:int, param3:Number, param4:Number) : void
      {
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < param2)
         {
            if(param3 < 0 || param3 > 1)
            {
               break;
            }
            _loc5_ = Number(Number(const_301[_loc6_]) * 0 * this.volume * param3);
            param3 += param4;
            param1.writeFloat(_loc5_);
            param1.writeFloat(_loc5_);
            _loc6_++;
         }
         if(param3 < 0)
         {
            while(_loc6_ < param2)
            {
               param1.writeFloat(0);
               param1.writeFloat(0);
               _loc6_++;
            }
         }
         else if(param3 > 1)
         {
            while(_loc6_ < param2)
            {
               _loc5_ = Number(Number(const_301[_loc6_]) * 0 * this.volume);
               param3 += param4;
               param1.writeFloat(_loc5_);
               param1.writeFloat(_loc5_);
               _loc6_++;
            }
         }
      }
      
      private function onPlayingComplete(param1:TimerEvent) : void
      {
         if(this.var_682)
         {
            this.playingComplete();
         }
      }
      
      private function onFadeOutComplete(param1:TimerEvent) : void
      {
         this.removeFadeoutStopTimer();
         this.playingComplete();
      }
      
      private function playingComplete() : void
      {
         this.stopImmediately();
         this._events.dispatchEvent(new SoundCompleteEvent(SoundCompleteEvent.TRAX_SONG_COMPLETE,this.var_1730));
      }
      
      private function removeFadeoutStopTimer() : void
      {
         if(this.var_683 != null)
         {
            this.var_683.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onFadeOutComplete);
            this.var_683.reset();
            this.var_683 = null;
         }
      }
      
      private function removeStopTimer() : void
      {
         if(this.var_463 != null)
         {
            this.var_463.reset();
            this.var_463.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onPlayingComplete);
            this.var_463 = null;
         }
      }
   }
}
