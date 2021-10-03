package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1643:String = "WE_DESTROY";
      
      public static const const_310:String = "WE_DESTROYED";
      
      public static const const_1722:String = "WE_OPEN";
      
      public static const const_1744:String = "WE_OPENED";
      
      public static const const_1586:String = "WE_CLOSE";
      
      public static const const_1794:String = "WE_CLOSED";
      
      public static const const_1743:String = "WE_FOCUS";
      
      public static const const_360:String = "WE_FOCUSED";
      
      public static const const_1770:String = "WE_UNFOCUS";
      
      public static const const_1825:String = "WE_UNFOCUSED";
      
      public static const const_1672:String = "WE_ACTIVATE";
      
      public static const const_625:String = "WE_ACTIVATED";
      
      public static const const_1725:String = "WE_DEACTIVATE";
      
      public static const const_611:String = "WE_DEACTIVATED";
      
      public static const const_312:String = "WE_SELECT";
      
      public static const const_57:String = "WE_SELECTED";
      
      public static const const_470:String = "WE_UNSELECT";
      
      public static const const_595:String = "WE_UNSELECTED";
      
      public static const const_1813:String = "WE_LOCK";
      
      public static const const_1613:String = "WE_LOCKED";
      
      public static const const_1635:String = "WE_UNLOCK";
      
      public static const const_1824:String = "WE_UNLOCKED";
      
      public static const const_765:String = "WE_ENABLE";
      
      public static const const_244:String = "WE_ENABLED";
      
      public static const const_887:String = "WE_DISABLE";
      
      public static const const_201:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_269:String = "WE_RELOCATED";
      
      public static const const_1141:String = "WE_RESIZE";
      
      public static const const_39:String = "WE_RESIZED";
      
      public static const const_1595:String = "WE_MINIMIZE";
      
      public static const const_1603:String = "WE_MINIMIZED";
      
      public static const const_1705:String = "WE_MAXIMIZE";
      
      public static const const_1687:String = "WE_MAXIMIZED";
      
      public static const const_1700:String = "WE_RESTORE";
      
      public static const const_1796:String = "WE_RESTORED";
      
      public static const const_597:String = "WE_CHILD_ADDED";
      
      public static const const_393:String = "WE_CHILD_REMOVED";
      
      public static const const_216:String = "WE_CHILD_RELOCATED";
      
      public static const const_162:String = "WE_CHILD_RESIZED";
      
      public static const const_315:String = "WE_CHILD_ACTIVATED";
      
      public static const const_591:String = "WE_PARENT_ADDED";
      
      public static const const_1708:String = "WE_PARENT_REMOVED";
      
      public static const const_1681:String = "WE_PARENT_RELOCATED";
      
      public static const const_908:String = "WE_PARENT_RESIZED";
      
      public static const const_1193:String = "WE_PARENT_ACTIVATED";
      
      public static const const_185:String = "WE_OK";
      
      public static const const_547:String = "WE_CANCEL";
      
      public static const const_107:String = "WE_CHANGE";
      
      public static const const_596:String = "WE_SCROLL";
      
      public static const const_179:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_704:IWindow;
      
      protected var var_1082:Boolean;
      
      protected var var_474:Boolean;
      
      protected var var_476:Boolean;
      
      protected var var_703:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_704 = param3;
         _loc5_.var_474 = param4;
         _loc5_.var_476 = false;
         _loc5_.var_703 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_704;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_474;
      }
      
      public function recycle() : void
      {
         if(this.var_476)
         {
            throw new Error("Event already recycled!");
         }
         this.var_704 = null;
         this._window = null;
         this.var_476 = true;
         this.var_1082 = false;
         this.var_703.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1082;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1082 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1082;
      }
      
      public function stopPropagation() : void
      {
         this.var_1082 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1082 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_474 + " window: " + this._window + " }";
      }
   }
}
