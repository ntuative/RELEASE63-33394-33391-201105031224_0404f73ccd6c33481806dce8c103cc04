package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_519:uint = 0;
      
      public static const const_1749:uint = 1;
      
      public static const const_2108:int = 0;
      
      public static const const_2032:int = 1;
      
      public static const const_2038:int = 2;
      
      public static const const_2026:int = 3;
      
      public static const const_1546:int = 4;
      
      public static const const_406:int = 5;
      
      public static var var_400:IEventQueue;
      
      private static var var_669:IEventProcessor;
      
      private static var var_1975:uint = const_519;
      
      private static var stage:Stage;
      
      private static var var_161:IWindowRenderer;
       
      
      private var var_2763:EventProcessorState;
      
      private var var_2762:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_128:DisplayObjectContainer;
      
      protected var var_2980:Boolean = true;
      
      protected var var_1337:Error;
      
      protected var var_2148:int = -1;
      
      protected var var_1342:IInternalWindowServices;
      
      protected var var_1616:IWindowParser;
      
      protected var var_2933:IWindowFactory;
      
      protected var var_81:IDesktopWindow;
      
      protected var var_1617:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_570:Boolean = false;
      
      private var var_2761:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_161 = param2;
         this._localization = param4;
         this.var_128 = param5;
         this.var_1342 = new ServiceManager(this,param5);
         this.var_2933 = param3;
         this.var_1616 = new WindowParser(this);
         this.var_2762 = param7;
         if(!stage)
         {
            if(this.var_128 is Stage)
            {
               stage = this.var_128 as Stage;
            }
            else if(this.var_128.stage)
            {
               stage = this.var_128.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_81 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_81.limits.maxWidth = param6.width;
         this.var_81.limits.maxHeight = param6.height;
         this.var_128.addChild(this.var_81.getDisplayObject());
         this.var_128.doubleClickEnabled = true;
         this.var_128.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this.var_2763 = new EventProcessorState(var_161,this.var_81,this.var_81,null,this.var_2762);
         inputMode = const_519;
         this.var_1617 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1975;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_400)
         {
            if(var_400 is IDisposable)
            {
               IDisposable(var_400).dispose();
            }
         }
         if(var_669)
         {
            if(var_669 is IDisposable)
            {
               IDisposable(var_669).dispose();
            }
         }
         switch(value)
         {
            case const_519:
               var_400 = new MouseEventQueue(stage);
               var_669 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1749:
               var_400 = new TabletEventQueue(stage);
               var_669 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_519;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_128.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_128.removeChild(IGraphicContextHost(this.var_81).getGraphicContext(true) as DisplayObject);
            this.var_81.destroy();
            this.var_81 = null;
            this.var_1617.destroy();
            this.var_1617 = null;
            if(this.var_1342 is IDisposable)
            {
               IDisposable(this.var_1342).dispose();
            }
            this.var_1342 = null;
            this.var_1616.dispose();
            this.var_1616 = null;
            var_161 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1337;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_2148;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1337 = param2;
         this.var_2148 = param1;
         if(this.var_2980)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1337 = null;
         this.var_2148 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1342;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1616;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2933;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_81;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_81.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1546,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1617;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_81,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_81)
         {
            this.var_81 = null;
         }
         if(param1.state != WindowState.const_569)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_161.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_570 = true;
         if(this.var_1337)
         {
            throw this.var_1337;
         }
         var_669.process(this.var_2763,var_400);
         this.var_570 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2761 = true;
         var_161.update(param1);
         this.var_2761 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_81 != null && !this.var_81.disposed)
         {
            if(this.var_128 is Stage)
            {
               this.var_81.limits.maxWidth = Stage(this.var_128).stageWidth;
               this.var_81.limits.maxHeight = Stage(this.var_128).stageHeight;
               this.var_81.width = Stage(this.var_128).stageWidth;
               this.var_81.height = Stage(this.var_128).stageHeight;
            }
            else
            {
               this.var_81.limits.maxWidth = this.var_128.width;
               this.var_81.limits.maxHeight = this.var_128.height;
               this.var_81.width = this.var_128.width;
               this.var_81.height = this.var_128.height;
            }
         }
      }
   }
}
