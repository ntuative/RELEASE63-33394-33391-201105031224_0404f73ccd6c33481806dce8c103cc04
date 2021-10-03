package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToWidth implements BinarySearchTest
   {
       
      
      private var var_186:String;
      
      private var _text:ITextWindow;
      
      private var var_293:int;
      
      public function CutToWidth()
      {
         super();
      }
      
      public function test(param1:int) : Boolean
      {
         this._text.text = this.var_186.substring(0,param1) + "...";
         return this._text.textWidth > this.var_293;
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         this.var_186 = param1;
         this._text = param2;
         this.var_293 = param3;
      }
   }
}
