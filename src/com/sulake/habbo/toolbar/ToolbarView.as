package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ToolbarView implements IToolbarView
   {
       
      
      private var _window:IWindowContainer;
      
      private var _events:IEventDispatcher;
      
      private var var_288:ToolbarBarMenuAnimator;
      
      private var var_274:Array;
      
      private var var_681:Array;
      
      private var var_234:IWindowContainer;
      
      private var var_1574:Boolean = false;
      
      private var var_552:String = "LEFT";
      
      private var var_172:Number = 50;
      
      private var var_1302:Boolean = true;
      
      private var var_1301:Number = 1;
      
      private var _toolbarMarginBottom:Number = 0;
      
      private var _toolbarMinGroupMargin:Number = 15;
      
      private var var_2049:Number = 5;
      
      private var _config:IHabboConfigurationManager;
      
      private var _disposed:Boolean;
      
      public function ToolbarView(param1:HabboToolbar, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IConnection, param5:IEventDispatcher, param6:IHabboConfigurationManager)
      {
         var _loc8_:* = null;
         this.var_274 = new Array();
         this.var_681 = new Array();
         super();
         this._events = param5;
         this._config = param6;
         var _loc7_:XmlAsset = param3.getAssetByName("toolbar_window_xml") as XmlAsset;
         this._window = param2.buildFromXML(_loc7_.content as XML,2) as IWindowContainer;
         if(this._window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         this._window.tags.push("habbo_toolbar");
         this.var_172 = this._window.width;
         this.var_234 = param2.createWindow("extrabar_container_window","",HabboWindowType.const_73,HabboWindowStyle.const_1233,0 | 0,new Rectangle(0,0,1,1),null,0,0) as IWindowContainer;
         this._window.tags.push("habbo_extrabar");
         if(param6.getKey("friendbar.enabled") == "true")
         {
            _loc8_ = param3.getAssetByName("toolbar_hack_xml") as XmlAsset;
         }
         else
         {
            _loc8_ = param3.getAssetByName("toolbar_xml") as XmlAsset;
         }
         if(_loc8_ == null)
         {
            return;
         }
         var _loc9_:XML = _loc8_.content as XML;
         this.var_1302 = String(_loc9_.relocate_by_drag.@state) == "true";
         if(this.var_1302)
         {
            this._window.addEventListener(WindowMouseEvent.const_42,this.onToolbarMouseDown);
            this._window.context.getDesktopWindow().getDisplayObject().stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
            this._window.context.getDesktopWindow().getDisplayObject().stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         }
         this._window.context.getDesktopWindow().addEventListener(WindowEvent.const_39,this.onRoomViewResized);
         this.var_1301 = _loc9_.toolbar.@margin_top;
         this._toolbarMarginBottom = _loc9_.toolbar.@margin_bottom;
         this._toolbarMinGroupMargin = _loc9_.toolbar.@min_group_margin;
         this.var_2049 = _loc9_.toolbar.@margin_to_extrabar;
         this.var_288 = new ToolbarBarMenuAnimator(param2,this);
         var _loc10_:XMLList = XMLList(_loc9_.toolbar).children();
         var _loc11_:XMLList = XMLList(_loc9_.extras).children();
         this.createGroupsFromXmlList(_loc10_,this.var_274,param2,param3,param4,this._window,this.var_288);
         this.createGroupsFromXmlList(_loc11_,this.var_681,param2,param3,param4,this.var_234,this.var_288);
         this.alignWindows();
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      private function createGroupsFromXmlList(param1:XMLList, param2:Array, param3:IHabboWindowManager, param4:IAssetLibrary, param5:IConnection, param6:IWindowContainer, param7:ToolbarBarMenuAnimator) : void
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         while(_loc11_ < param1.length())
         {
            _loc8_ = param1[_loc11_];
            _loc9_ = _loc8_.children();
            _loc10_ = new ToolbarIconGroup(param3,param4,param5,_loc11_,this._events,param6,param7,this.var_172,this._config);
            _loc10_.defaultIconSize = _loc8_.@icon_size;
            _loc10_.iconSize = _loc10_.defaultIconSize;
            _loc10_.orientation = _loc8_.@default_orientation;
            _loc10_.windowMargin = _loc8_.@window_margin;
            _loc10_.windowBottomMargin = _loc8_.@window_bottom_margin;
            if(_loc10_.addContentIndexFromXmlList(_loc8_))
            {
               param2.push(_loc10_);
            }
            _loc11_++;
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         while(this.var_274.length > 0)
         {
            _loc1_ = this.var_274.shift();
            _loc1_.dispose();
            _loc1_ = null;
         }
         while(this.var_681.length > 0)
         {
            _loc1_ = this.var_681.shift();
            _loc1_.dispose();
            _loc1_ = null;
         }
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_234 != null)
         {
            this.var_234.dispose();
            this.var_234 = null;
         }
         this._config = null;
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get barSize() : Number
      {
         return this.var_172;
      }
      
      public function get orientation() : String
      {
         return this.var_552;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Point = null) : void
      {
         var _loc4_:ToolbarIcon = this.getIconByMenuId(param1);
         if(_loc4_ != null)
         {
            _loc4_.animateWindowIn(param1,param2,this.var_172,this.var_552,param3);
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer) : void
      {
         var _loc3_:ToolbarIcon = this.getIconByMenuId(param1);
         if(_loc3_ != null)
         {
            _loc3_.animateWindowOut(param1,param2,this.var_552);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer) : void
      {
         this.alignWindows();
         var _loc3_:ToolbarIcon = this.getIconByMenuId(param1);
         if(_loc3_ != null)
         {
            _loc3_.positionWindow(param1,param2,this.var_172,this.var_552);
         }
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer) : void
      {
         this.alignWindows();
         var _loc3_:ToolbarIcon = this.getIconByMenuId(param1);
         if(_loc3_ != null)
         {
            _loc3_.hideWindow(param1,param2,this.var_172,this.var_552);
         }
      }
      
      public function setIcon(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:ToolbarIconGroup = this.getGroupForIcon(param1);
         if(_loc3_ != null)
         {
            _loc3_.setIcon(param1,param2);
            this.alignWindows();
         }
      }
      
      public function setIconBitmap(param1:String, param2:BitmapData) : void
      {
         var _loc3_:ToolbarIconGroup = this.getGroupForIcon(param1);
         if(_loc3_ != null)
         {
            _loc3_.setContent(param1,param2);
            this.alignWindows();
         }
      }
      
      public function setIconState(param1:String, param2:String) : void
      {
         var _loc3_:ToolbarIcon = this.getIconById(param1);
         if(_loc3_ != null)
         {
            _loc3_.state = param2;
            this.alignWindows();
         }
      }
      
      public function removeIcon(param1:String) : void
      {
         var _loc2_:ToolbarIconGroup = this.getGroupForIcon(param1);
         if(_loc2_ != null)
         {
            _loc2_.removeContent(param1);
            this.alignWindows();
         }
      }
      
      public function getIconLoc(param1:String) : Point
      {
         var _loc2_:ToolbarIcon = this.getIconById(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         return new Point(_loc2_.x,_loc2_.y);
      }
      
      private function onRoomViewResized(param1:WindowEvent) : void
      {
         this.alignWindows();
         var _loc2_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_785);
         this._events.dispatchEvent(_loc2_);
      }
      
      private function getGroupForIcon(param1:String) : ToolbarIconGroup
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < this.var_274.length)
         {
            _loc2_ = this.var_274[_loc3_];
            if(_loc2_.acceptsIcon(param1))
            {
               return _loc2_;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this.var_681.length)
         {
            _loc2_ = this.var_681[_loc3_];
            if(_loc2_.acceptsIcon(param1))
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      private function getIconById(param1:String) : ToolbarIcon
      {
         var _loc2_:ToolbarIconGroup = this.getGroupForIcon(param1);
         if(_loc2_ != null)
         {
            return _loc2_.getIconById(param1);
         }
         return null;
      }
      
      public function getIconByMenuId(param1:String) : ToolbarIcon
      {
         var _loc2_:ToolbarIconGroup = this.getGroupForIcon(param1);
         if(_loc2_ != null)
         {
            return _loc2_.getIconByMenuId(param1);
         }
         return null;
      }
      
      private function alignWindows() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         if(this._window == null || this.var_234 == null)
         {
            return;
         }
         var _loc1_:IDesktopWindow = this._window.context.getDesktopWindow();
         if(_loc1_ == null)
         {
            return;
         }
         this._window.visible = true;
         switch(this.orientation)
         {
            case "LEFT":
               this._window.height = _loc1_.height;
               this._window.x = 0;
               this._window.y = 0;
               this.var_234.x = this.var_172 + this.var_2049;
               this.var_234.y = 0;
               _loc4_ = this._window.height;
               break;
            case "RIGHT":
               this._window.width = this.var_172;
               this._window.height = _loc1_.height;
               this._window.x = _loc1_.width - this.var_172;
               this._window.y = 0;
               this.var_234.x = 0;
               this.var_234.y = 0;
               _loc4_ = this._window.height;
               break;
            case "TOP":
               this._window.width = _loc1_.width;
               this._window.height = this.var_172;
               this._window.x = 0;
               this._window.y = 0;
               this.var_234.x = 0;
               this.var_234.y = this.var_172 + this.var_2049;
               _loc4_ = this._window.width;
               break;
            case "BOTTOM":
               this._window.width = _loc1_.width;
               this._window.height = this.var_172;
               this._window.x = 0;
               this._window.y = _loc1_.height - this.var_172;
               this.var_234.x = 0;
               this.var_234.y = 0;
               _loc4_ = this._window.width;
         }
         _loc4_ -= this._toolbarMarginBottom;
         _loc4_ -= this.var_1301;
         var _loc5_:* = 0;
         _loc2_ = 0;
         while(_loc2_ < this.var_274.length)
         {
            _loc3_ = this.var_274[_loc2_];
            _loc5_ += _loc3_.iconCount * _loc3_.defaultIconSize;
            _loc2_++;
         }
         var _loc6_:* = 0;
         var _loc7_:Number = this.var_1301;
         var _loc8_:* = 1;
         if(_loc5_ > _loc4_)
         {
            _loc8_ = Number(_loc4_ / _loc5_);
         }
         else
         {
            _loc8_ = Number(Math.max(1,_loc4_ / (_loc5_ / 0.7)));
            if(this.var_274.length > 1)
            {
               if(this.orientation == "LEFT" || this.orientation == "RIGHT")
               {
                  _loc6_ = Number(Math.max(this._toolbarMinGroupMargin,(this._window.height - _loc5_ * _loc8_ - this.var_1301 - this._toolbarMarginBottom) / (this.var_274.length - 1)));
               }
               else
               {
                  _loc6_ = Number(Math.max(this._toolbarMinGroupMargin,(this._window.width - _loc5_ * _loc8_ - this.var_1301 - this._toolbarMarginBottom) / (this.var_274.length - 1)));
               }
            }
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_274.length)
         {
            _loc3_ = this.var_274[_loc2_];
            if(_loc3_ != null)
            {
               _loc3_.orientation = this.var_552;
               _loc3_.iconSize = _loc3_.defaultIconSize * _loc8_;
               _loc3_.position = _loc7_;
               _loc7_ += _loc3_.size + _loc6_;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_681.length)
         {
            _loc3_ = this.var_681[_loc2_];
            if(_loc3_ != null)
            {
               _loc3_.position = _loc2_;
            }
            _loc2_++;
         }
         if(this.var_288 != null)
         {
            this.var_288.refresh();
         }
      }
      
      private function onToolbarMouseDown(param1:WindowEvent) : void
      {
         if(this.var_1302)
         {
            this.var_1574 = true;
         }
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.var_1302 && this.var_1574)
         {
            _loc2_ = this.getTargetOrientationFromXY(param1.stageX,param1.stageY);
            if(_loc2_ != null && _loc2_ != this.var_552)
            {
               this.var_552 = _loc2_;
               this.alignWindows();
               if(this._events != null)
               {
                  _loc3_ = new HabboToolbarEvent(HabboToolbarEvent.const_632);
                  _loc3_.orientation = this.var_552;
                  this._events.dispatchEvent(_loc3_);
               }
            }
         }
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         if(this.var_1302 && this.var_1574)
         {
            this.var_1574 = false;
         }
      }
      
      private function getTargetOrientationFromXY(param1:Number, param2:Number) : String
      {
         var _loc3_:IDesktopWindow = this._window.context.getDesktopWindow();
         if(_loc3_ == null)
         {
            return null;
         }
         if(param1 <= this.var_172)
         {
            return "LEFT";
         }
         if(param1 >= _loc3_.width - this.var_172)
         {
            return "RIGHT";
         }
         if(param2 <= this.var_172)
         {
            return "TOP";
         }
         if(param2 >= _loc3_.height - this.var_172)
         {
            return "BOTTOM";
         }
         return null;
      }
      
      public function setNewItemCount(param1:String, param2:int) : void
      {
      }
   }
}
