package com.sulake.habbo.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.enum.WindowState;
   import flash.geom.Rectangle;
   
   public class WindowToggle implements IDisposable
   {
       
      
      private var _window:IWindow;
      
      private var var_798:IDesktopWindow;
      
      private var _disposed:Boolean;
      
      public function WindowToggle(param1:IWindow, param2:IDesktopWindow)
      {
         super();
         this._window = param1;
         this.var_798 = param2;
      }
      
      private static function isOverlapping(param1:IWindow, param2:IDesktopWindow) : Boolean
      {
         var _loc7_:* = null;
         var _loc3_:int = param2.numChildren;
         var _loc4_:int = param2.getChildIndex(param1);
         if(_loc4_ < 0)
         {
            throw new Error("Window must be contained by the desktop!");
         }
         var _loc5_:Rectangle = new Rectangle();
         param1.getGlobalRectangle(_loc5_);
         var _loc6_:Rectangle = new Rectangle();
         var _loc8_:int = _loc4_ + 1;
         while(_loc8_ < _loc3_)
         {
            _loc7_ = param2.getChildAt(_loc8_);
            if(_loc7_.visible)
            {
               _loc7_.getGlobalRectangle(_loc6_);
               if(_loc5_.intersects(_loc6_))
               {
                  return true;
               }
            }
            _loc8_++;
         }
         return false;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get visible() : Boolean
      {
         return this._window && this._window.visible && this._window.parent;
      }
      
      public function get active() : Boolean
      {
         return this.visible && this._window.getStateFlag(WindowState.const_92);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this._window)
            {
               this._window.dispose();
               this._window = null;
            }
            this.var_798 = null;
            this._disposed = true;
         }
      }
      
      public function show() : void
      {
         if(!this._window.disposed)
         {
            if(this._window.parent != this.var_798)
            {
               this.var_798.addChild(this._window);
            }
            if(!this._window.visible)
            {
               this._window.visible = true;
            }
            this._window.activate();
         }
      }
      
      public function hide() : void
      {
         if(!this._window.disposed)
         {
            if(this._window.parent == this.var_798)
            {
               this.var_798.removeChild(this._window);
            }
            if(this._window.visible)
            {
               this._window.visible = false;
            }
            this._window.deactivate();
         }
      }
      
      public function toggle() : void
      {
         if(this.visible)
         {
            if(this.active)
            {
               this.hide();
            }
            else if(isOverlapping(this._window,this.var_798))
            {
               this._window.activate();
            }
            else
            {
               this.hide();
            }
         }
         else
         {
            this.show();
         }
      }
   }
}
