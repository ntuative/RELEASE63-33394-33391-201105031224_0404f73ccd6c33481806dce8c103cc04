package com.sulake.habbo.friendbar.view.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class Icon implements IDisposable
   {
      
      protected static const const_2114:int = 0;
      
      protected static const const_650:int = 1;
      
      protected static const const_1844:int = 2;
      
      protected static const const_1843:int = 3;
      
      protected static const const_129:int = 4;
      
      protected static const const_649:int = 8;
      
      protected static const const_248:int = 18;
      
      protected static const const_1842:int = 18;
       
      
      private var _disposed:Boolean = false;
      
      private var var_1840:Boolean = false;
      
      protected var var_46:BitmapDataAsset;
      
      protected var var_86:IBitmapWrapperWindow;
      
      private var var_1190:uint;
      
      protected var var_209:Timer;
      
      protected var _frame:int = 0;
      
      private var var_635:Point;
      
      protected var var_870:Boolean = false;
      
      protected var _hover:Boolean = false;
      
      public function Icon()
      {
         this.var_1190 = const_650 | const_649;
         this.var_635 = new Point();
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get disabled() : Boolean
      {
         return this.var_1840;
      }
      
      protected function set image(param1:BitmapDataAsset) : void
      {
         this.var_46 = param1;
         this.redraw();
      }
      
      protected function get image() : BitmapDataAsset
      {
         return this.var_46;
      }
      
      protected function set canvas(param1:IBitmapWrapperWindow) : void
      {
         this.var_86 = param1;
         this.redraw();
      }
      
      protected function get canvas() : IBitmapWrapperWindow
      {
         return this.var_86;
      }
      
      protected function set alignment(param1:uint) : void
      {
         this.var_1190 = param1;
         this.redraw();
      }
      
      protected function get alignment() : uint
      {
         return this.var_1190;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.toggleTimer(false,0);
            this.image = null;
            this.canvas = null;
            this._disposed = true;
         }
      }
      
      public function notify(param1:Boolean) : void
      {
         this.var_870 = param1;
         if(this.var_870 && this.var_1840)
         {
            this.enable(true);
         }
      }
      
      public function hover(param1:Boolean) : void
      {
         this._hover = param1;
      }
      
      public function enable(param1:Boolean) : void
      {
         this.var_1840 = !param1;
      }
      
      protected function redraw() : void
      {
         var _loc1_:* = null;
         if(this.var_86 && !this.var_86.disposed)
         {
            if(!this.var_86.bitmap)
            {
               this.var_86.bitmap = new BitmapData(this.var_86.width,this.var_86.height,true,0);
            }
            else
            {
               this.var_86.bitmap.fillRect(this.var_86.bitmap.rect,0);
            }
            if(this.var_46 && !this.var_46.disposed)
            {
               this.var_635.x = this.var_635.y = 0;
               _loc1_ = this.var_46.content as BitmapData;
               switch(this.var_1190 & const_1843)
               {
                  case const_650:
                     this.var_635.x = this.var_86.bitmap.width / 2 - _loc1_.width / 2;
                     break;
                  case const_1844:
                     this.var_635.x = this.var_86.bitmap.width - _loc1_.width;
               }
               switch(this.var_1190 & const_1842)
               {
                  case const_649:
                     this.var_635.y = this.var_86.bitmap.height / 2 - _loc1_.height / 2;
                     break;
                  case const_248:
                     this.var_635.y = this.var_86.bitmap.height - _loc1_.height;
               }
               this.var_86.bitmap.copyPixels(_loc1_,_loc1_.rect,this.var_635);
               this.var_86.invalidate();
            }
         }
      }
      
      protected function toggleTimer(param1:Boolean, param2:int) : void
      {
         if(param1)
         {
            if(!this.var_209)
            {
               this.var_209 = new Timer(param2,0);
               this.var_209.addEventListener(TimerEvent.TIMER,this.onTimerEvent);
               this.var_209.start();
               this.onTimerEvent(null);
            }
            this.var_209.delay = param2;
         }
         else
         {
            this._frame = 0;
            if(this.var_209)
            {
               this.var_209.reset();
               this.var_209.removeEventListener(TimerEvent.TIMER,this.onTimerEvent);
               this.var_209 = null;
            }
         }
      }
      
      protected function onTimerEvent(param1:TimerEvent) : void
      {
      }
   }
}
