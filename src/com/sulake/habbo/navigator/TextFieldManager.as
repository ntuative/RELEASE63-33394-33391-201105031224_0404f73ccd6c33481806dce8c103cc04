package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class TextFieldManager
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var var_73:ITextFieldWindow;
      
      private var var_584:Boolean;
      
      private var var_1537:String = "";
      
      private var var_1647:int;
      
      private var var_1648:Function;
      
      private var var_2200:String = "";
      
      private var var_130:IWindowContainer;
      
      private var var_2202:Boolean;
      
      private var _orgTextBackgroundColor:uint;
      
      private var var_2201:uint;
      
      public function TextFieldManager(param1:HabboNavigator, param2:ITextFieldWindow, param3:int = 1000, param4:Function = null, param5:String = null)
      {
         super();
         this._navigator = param1;
         this.var_73 = param2;
         this.var_1647 = param3;
         this.var_1648 = param4;
         if(param5 != null)
         {
            this.var_584 = true;
            this.var_1537 = param5;
            this.var_73.text = param5;
         }
         Util.setProcDirectly(this.var_73,this.onInputClick);
         this.var_73.addEventListener(WindowKeyboardEvent.const_181,this.checkEnterPress);
         this.var_73.addEventListener(WindowEvent.const_107,this.checkMaxLen);
         this.var_2202 = this.var_73.textBackground;
         this._orgTextBackgroundColor = this.var_73.textBackgroundColor;
         this.var_2201 = this.var_73.textColor;
      }
      
      public function checkMandatory(param1:String) : Boolean
      {
         if(!this.isInputValid())
         {
            this.displayError(param1);
            return false;
         }
         this.restoreBackground();
         return true;
      }
      
      public function restoreBackground() : void
      {
         this.var_73.textBackground = this.var_2202;
         this.var_73.textBackgroundColor = this._orgTextBackgroundColor;
         this.var_73.textColor = this.var_2201;
      }
      
      public function displayError(param1:String) : void
      {
         this.var_73.textBackground = true;
         this.var_73.textBackgroundColor = 4294021019;
         this.var_73.textColor = 4278190080;
         if(this.var_130 == null)
         {
            this.var_130 = IWindowContainer(this._navigator.getXmlWindow("nav_error_popup"));
            this._navigator.refreshButton(this.var_130,"popup_arrow_down",true,null,0);
            IWindowContainer(this.var_73.parent).addChild(this.var_130);
         }
         var _loc2_:ITextWindow = ITextWindow(this.var_130.findChildByName("error_text"));
         _loc2_.text = param1;
         _loc2_.width = _loc2_.textWidth + 5;
         this.var_130.findChildByName("border").width = _loc2_.width + 15;
         this.var_130.width = _loc2_.width + 15;
         var _loc3_:Point = new Point();
         this.var_73.getLocalPosition(_loc3_);
         this.var_130.x = _loc3_.x;
         this.var_130.y = _loc3_.y - this.var_130.height + 3;
         var _loc4_:IWindow = this.var_130.findChildByName("popup_arrow_down");
         _loc4_.x = this.var_130.width / 2 - _loc4_.width / 2;
         this.var_130.x += (this.var_73.width - this.var_130.width) / 2;
         this.var_130.visible = true;
      }
      
      public function goBackToInitialState() : void
      {
         this.clearErrors();
         if(this.var_1537 != null)
         {
            this.var_73.text = this.var_1537;
            this.var_584 = true;
         }
         else
         {
            this.var_73.text = "";
            this.var_584 = false;
         }
      }
      
      public function getText() : String
      {
         if(this.var_584)
         {
            return this.var_2200;
         }
         return this.var_73.text;
      }
      
      public function setText(param1:String) : void
      {
         this.var_584 = false;
         this.var_73.text = param1;
      }
      
      public function clearErrors() : void
      {
         this.restoreBackground();
         if(this.var_130 != null)
         {
            this.var_130.visible = false;
         }
      }
      
      public function get input() : ITextFieldWindow
      {
         return this.var_73;
      }
      
      private function isInputValid() : Boolean
      {
         return !this.var_584 && Util.trim(this.getText()).length > 2;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_360)
         {
            return;
         }
         if(!this.var_584)
         {
            return;
         }
         this.var_73.text = this.var_2200;
         this.var_584 = false;
         this.restoreBackground();
      }
      
      private function checkEnterPress(param1:WindowKeyboardEvent) : void
      {
         if(param1.charCode == Keyboard.ENTER)
         {
            if(this.var_1648 != null)
            {
               this.var_1648();
            }
         }
      }
      
      private function checkMaxLen(param1:WindowEvent) : void
      {
         var _loc2_:String = this.var_73.text;
         if(_loc2_.length > this.var_1647)
         {
            this.var_73.text = _loc2_.substring(0,this.var_1647);
         }
      }
   }
}
