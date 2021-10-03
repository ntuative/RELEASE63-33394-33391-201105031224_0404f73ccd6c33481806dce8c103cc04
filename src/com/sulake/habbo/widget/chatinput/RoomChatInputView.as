package com.sulake.habbo.widget.chatinput
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChatMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetChatTypingMessage;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.Stage;
   import flash.events.KeyboardEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   
   public class RoomChatInputView
   {
       
      
      private var _widget:RoomChatInputWidget;
      
      private var _window:IWindowContainer;
      
      private var var_24:ITextFieldWindow;
      
      private var var_1930:IWindow;
      
      private var _button:IWindow;
      
      private var var_1929:IWindow;
      
      private var var_1516:IWindow;
      
      private var _chatModeIdShout:String;
      
      private var var_1130:String;
      
      private var var_2344:String;
      
      private var var_1517:Boolean = false;
      
      private var var_614:Boolean = false;
      
      private var var_1408:Boolean = false;
      
      private var var_346:Timer;
      
      private var var_418:Timer;
      
      private var var_499:String = "";
      
      private const const_2160:int = 250;
      
      private const const_2158:int = 0;
      
      private const const_2159:String = "${widgets.chatinput.say}";
      
      public function RoomChatInputView(param1:RoomChatInputWidget)
      {
         super();
         this._widget = param1;
         this.var_1130 = param1.localizations.getKey("widgets.chatinput.mode.whisper",":tell");
         this._chatModeIdShout = param1.localizations.getKey("widgets.chatinput.mode.shout",":shout");
         this.var_2344 = param1.localizations.getKey("widgets.chatinput.mode.speak",":speak");
         this.var_346 = new Timer(1000,1);
         this.var_346.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTypingTimerComplete);
         this.var_418 = new Timer(10000,1);
         this.var_418.addEventListener(TimerEvent.TIMER_COMPLETE,this.onIdleTimerComplete);
         this.createWindow();
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      public function dispose() : void
      {
         this._widget = null;
         this.var_24 = null;
         this.var_1930 = null;
         this._button = null;
         this.var_1929 = null;
         this.var_1516 = null;
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_346 != null)
         {
            this.var_346.reset();
            this.var_346.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTypingTimerComplete);
            this.var_346 = null;
         }
         if(this.var_418 != null)
         {
            this.var_418.reset();
            this.var_418.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onIdleTimerComplete);
            this.var_418 = null;
         }
      }
      
      private function createWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         var _loc1_:XmlAsset = this._widget.assets.getAssetByName("chatinput_window") as XmlAsset;
         if(_loc1_ == null || _loc1_.content == null)
         {
            return;
         }
         this._window = this._widget.windowManager.buildFromXML(_loc1_.content as XML,0) as IWindowContainer;
         this._window.x = (this._window.desktop.width - this._window.width) / 2;
         var _loc2_:int = this._widget.config.getKey("friendbar.enabled") == "true" ? 55 : 5;
         this._window.y = this._window.desktop.height - this._window.height - _loc2_;
         this._window.tags.push("room_widget_chatinput");
         this.var_24 = this._window.findChildByName("chat_input") as ITextFieldWindow;
         this.var_1930 = this._window.findChildByName("input_border");
         this._button = this._window.findChildByName("send_button");
         this.var_1929 = this._window.findChildByName("send_button_text");
         this.var_1516 = this._window.findChildByName("block_text");
         this.var_1929.caption = this.const_2159;
         this.var_24.setParamFlag(HabboWindowParam.const_41,true);
         this.var_24.addEventListener(WindowMouseEvent.const_42,this.windowMouseEventProcessor);
         this.var_24.addEventListener(WindowKeyboardEvent.const_181,this.windowKeyEventProcessor);
         this.var_24.addEventListener(WindowKeyboardEvent.const_316,this.keyUpHandler);
         this.var_24.addEventListener(WindowEvent.const_107,this.onInputChanged);
         this._window.findChildByName("send_button").addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onSend);
         this.var_1517 = true;
         this.var_499 = "";
         this._window.addEventListener(WindowEvent.const_908,this.updatePosition);
         this._window.addEventListener(WindowEvent.const_591,this.updatePosition);
      }
      
      private function updatePosition(param1:WindowEvent = null) : void
      {
         var _loc2_:Point = new Point();
         this._window.getGlobalPosition(_loc2_);
         var _loc3_:int = _loc2_.x - this._window.x;
         var _loc4_:int = (this._window.desktop.width - this.var_1930.width) / 2 - _loc3_;
         var _loc5_:int = this._window.desktop.width - this._window.width - this.const_2160 - _loc3_;
         this._window.x = Math.max(Math.min(_loc4_,_loc5_),this.const_2158);
      }
      
      private function onSend(param1:WindowMouseEvent) : void
      {
         if(!this.var_1517)
         {
            this.sendChatFromInputField();
         }
      }
      
      public function hideFloodBlocking() : void
      {
         this.var_24.visible = true;
         this.var_1516.visible = false;
         if(this._button != null)
         {
            this._button.enable();
         }
      }
      
      public function showFloodBlocking() : void
      {
         this.var_24.visible = false;
         this.var_1516.visible = true;
         if(this._button != null)
         {
            this._button.disable();
         }
      }
      
      public function updateBlockText(param1:int) : void
      {
         this._widget.localizations.registerParameter("chat.input.alert.flood","time",param1.toString());
      }
      
      public function displaySpecialChatMessage(param1:String, param2:String = "") : void
      {
         if(this._window == null || this.var_24 == null)
         {
            return;
         }
         this.var_24.enable();
         this.var_24.selectable = true;
         this.var_24.text = "";
         this.setInputFieldFocus();
         this.var_24.text += param1 + " ";
         if(param2.length > 0)
         {
            this.var_24.text += param2 + " ";
         }
         this.var_24.setSelection(this.var_24.text.length,this.var_24.text.length);
         this.var_499 = this.var_24.text;
      }
      
      private function windowMouseEventProcessor(param1:WindowEvent = null, param2:IWindow = null) : void
      {
         this.setInputFieldFocus();
      }
      
      private function windowKeyEventProcessor(param1:WindowEvent = null, param2:IWindow = null) : void
      {
         var _loc3_:* = 0;
         var _loc4_:Boolean = false;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(this._window == null || this._widget == null || this._widget.floodBlocked)
         {
            return;
         }
         if(this.anotherFieldHasFocus())
         {
            return;
         }
         this.setInputFieldFocus();
         if(param1 is WindowKeyboardEvent)
         {
            _loc5_ = param1 as WindowKeyboardEvent;
            _loc3_ = uint(_loc5_.charCode);
            _loc4_ = _loc5_.shiftKey;
         }
         if(param1 is KeyboardEvent)
         {
            _loc6_ = param1 as KeyboardEvent;
            _loc3_ = uint(_loc6_.charCode);
            _loc4_ = _loc6_.shiftKey;
         }
         if(_loc6_ == null && _loc5_ == null)
         {
            return;
         }
         if(_loc3_ == Keyboard.SPACE)
         {
            this.checkSpecialKeywordForInput();
         }
         if(_loc3_ == Keyboard.ENTER)
         {
            this.sendChatFromInputField(_loc4_);
            this.setButtonPressedState(true);
         }
         if(_loc3_ == Keyboard.BACKSPACE)
         {
            if(this.var_24 != null)
            {
               _loc7_ = this.var_24.text;
               _loc8_ = _loc7_.split(" ");
               if(_loc8_[0] == this.var_1130 && _loc8_.length == 3 && _loc8_[2] == "")
               {
                  this.var_24.text = "";
                  this.var_499 = "";
               }
            }
         }
      }
      
      private function keyUpHandler(param1:WindowKeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.setButtonPressedState(false);
         }
      }
      
      private function setButtonPressedState(param1:Boolean) : void
      {
         if(this._button)
         {
            this._button.setStateFlag(WindowState.const_98,param1);
         }
      }
      
      private function onInputChanged(param1:WindowEvent) : void
      {
         var _loc2_:ITextFieldWindow = param1.window as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         this.var_418.reset();
         var _loc3_:* = _loc2_.text.length == 0;
         if(_loc3_)
         {
            this.var_614 = false;
            this.var_346.start();
         }
         else
         {
            if(_loc2_.text.length > this.var_499.length + 1)
            {
               if(this._widget.allowPaste)
               {
                  this._widget.setLastPasteTime();
               }
               else
               {
                  _loc2_.text = "";
               }
            }
            this.var_499 = _loc2_.text;
            if(!this.var_614)
            {
               this.var_614 = true;
               this.var_346.reset();
               this.var_346.start();
            }
            this.var_418.start();
         }
      }
      
      private function checkSpecialKeywordForInput() : void
      {
         if(this.var_24 == null || this.var_24.text == "")
         {
            return;
         }
         var _loc1_:String = this.var_24.text;
         var _loc2_:String = this._widget.selectedUserName;
         if(_loc1_ == this.var_1130)
         {
            if(_loc2_.length > 0)
            {
               this.var_24.text += " " + this._widget.selectedUserName;
               this.var_24.setSelection(this.var_24.text.length,this.var_24.text.length);
               this.var_499 = this.var_24.text;
            }
         }
      }
      
      private function onIdleTimerComplete(param1:TimerEvent) : void
      {
         if(this.var_614)
         {
            this.var_1408 = false;
         }
         this.var_614 = false;
         this.sendTypingMessage();
      }
      
      private function onTypingTimerComplete(param1:TimerEvent) : void
      {
         if(this.var_614)
         {
            this.var_1408 = true;
         }
         this.sendTypingMessage();
      }
      
      private function sendTypingMessage() : void
      {
         if(this._widget == null)
         {
            return;
         }
         if(this._widget.floodBlocked)
         {
            return;
         }
         var _loc1_:RoomWidgetChatTypingMessage = new RoomWidgetChatTypingMessage(this.var_614);
         this._widget.messageListener.processWidgetMessage(_loc1_);
      }
      
      private function setInputFieldFocus() : void
      {
         if(this.var_24 == null)
         {
            return;
         }
         if(this.var_1517)
         {
            this.var_24.text = "";
            this.var_24.textColor = 0;
            this.var_24.italic = false;
            this.var_1517 = false;
            this.var_499 = "";
         }
         this.var_24.focus();
      }
      
      private function sendChatFromInputField(param1:Boolean = false) : void
      {
         if(this.var_24 == null || this.var_24.text == "")
         {
            return;
         }
         var _loc2_:int = !!param1 ? 0 : int(RoomWidgetChatMessage.const_111);
         var _loc3_:String = this.var_24.text;
         var _loc4_:Array = _loc3_.split(" ");
         var _loc5_:String = "";
         var _loc6_:* = "";
         switch(_loc4_[0])
         {
            case this.var_1130:
               _loc2_ = 0;
               _loc5_ = _loc4_[1];
               _loc6_ = this.var_1130 + " " + _loc5_ + " ";
               _loc4_.shift();
               _loc4_.shift();
               break;
            case this._chatModeIdShout:
               _loc2_ = 0;
               _loc4_.shift();
               break;
            case this.var_2344:
               _loc2_ = 0;
               _loc4_.shift();
         }
         _loc3_ = _loc4_.join(" ");
         if(this._widget != null)
         {
            if(this.var_346.running)
            {
               this.var_346.reset();
            }
            if(this.var_418.running)
            {
               this.var_418.reset();
            }
            this._widget.sendChat(_loc3_,_loc2_,_loc5_);
            this.var_614 = false;
            if(this.var_1408)
            {
               this.sendTypingMessage();
            }
            this.var_1408 = false;
         }
         this.var_24.text = _loc6_;
         this.var_499 = _loc6_;
      }
      
      private function anotherFieldHasFocus() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.var_24 != null)
         {
            if(this.var_24.focused)
            {
               return false;
            }
         }
         var _loc1_:DisplayObject = this._window.context.getDesktopWindow().getDisplayObject();
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.stage;
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.focus;
               if(_loc3_ == null)
               {
                  return false;
               }
               if(_loc3_ is TextField)
               {
                  return true;
               }
            }
         }
         return false;
      }
   }
}
