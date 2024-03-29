package com.sulake.habbo.roomevents.userdefinedroomevents.help
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.net.URLRequest;
   
   public class UserDefinedRoomEventsHelp
   {
       
      
      private var var_78:HabboUserDefinedRoomEvents;
      
      private var var_2005:IWindowContainer;
      
      private var _window:IFrameWindow;
      
      private var _view:IWindowContainer;
      
      private var var_273:int = 0;
      
      private var var_60:Array;
      
      private var var_1272:IContainerButtonWindow;
      
      private var var_1273:IContainerButtonWindow;
      
      public function UserDefinedRoomEventsHelp(param1:HabboUserDefinedRoomEvents)
      {
         super();
         this.var_78 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this.initLocalizations();
         this._window = IFrameWindow(this.var_78.getXmlWindow("ude_help"));
         this.var_2005 = IWindowContainer(this.find(this._window,"help_container"));
         this.var_1273 = this.var_2005.findChildByName("button_previous") as IContainerButtonWindow;
         if(this.var_1273)
         {
            this.var_1273.procedure = this.onButtonClick;
         }
         this.var_1272 = this.var_2005.findChildByName("button_next") as IContainerButtonWindow;
         if(this.var_1272)
         {
            this.var_1272.procedure = this.onButtonClick;
         }
         var _loc1_:IWindow = this._window.findChildByTag("close");
         _loc1_.procedure = this.onWindowClose;
         this._window.center();
      }
      
      public function open(param1:int = -1, param2:int = -1) : void
      {
         this.prepareWindow();
         this.openPage();
         this._window.visible = true;
         if(param1 >= 0)
         {
            this._window.x = param1;
         }
         if(param2 >= 0)
         {
            this._window.y = param2;
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.close();
         }
      }
      
      public function close() : void
      {
         if(this._window)
         {
            this._window.visible = false;
         }
      }
      
      private function find(param1:IWindowContainer, param2:String) : IWindow
      {
         var _loc3_:IWindow = param1.findChildByName(param2);
         if(_loc3_ == null)
         {
            throw new Error("Window element with name: " + param2 + " cannot be found!");
         }
         return _loc3_;
      }
      
      public function toggle() : void
      {
         this._window.visible = !this._window.visible;
      }
      
      private function openPage() : void
      {
         this.localize();
         this.checkButtons();
      }
      
      private function checkButtons() : void
      {
         if(this.var_273 >= this.var_60.length - 1)
         {
            this.var_1272.disable();
         }
         else
         {
            this.var_1272.enable();
         }
         if(this.var_273 <= 0)
         {
            this.var_1273.disable();
         }
         else
         {
            this.var_1273.enable();
         }
      }
      
      private function nextPage() : void
      {
         ++this.var_273;
         this.var_273 = Math.min(this.var_273,this.var_60.length - 1);
         this.openPage();
      }
      
      private function previousPage() : void
      {
         --this.var_273;
         this.var_273 = Math.max(this.var_273,0);
         this.openPage();
      }
      
      private function initLocalizations() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         this.var_60 = [];
         var _loc1_:int = 1;
         while(this.var_78.localization.getLocalization("wiredfurni.help." + _loc1_ + ".title"))
         {
            _loc2_ = this.var_78.localization.getLocalization("wiredfurni.help." + _loc1_ + ".title");
            _loc3_ = this.var_78.localization.getLocalization("wiredfurni.help." + _loc1_ + ".img");
            _loc4_ = this.var_78.localization.getLocalization("wiredfurni.help." + _loc1_ + ".text");
            this.var_60.push([_loc2_,_loc3_,_loc4_]);
            _loc1_++;
         }
      }
      
      private function onButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "button_previous":
                  this.previousPage();
                  break;
               case "button_next":
                  this.nextPage();
            }
         }
      }
      
      private function localize() : void
      {
         var _loc4_:* = null;
         var _loc1_:ITextWindow = this.find(this._window,"help_title") as ITextWindow;
         var _loc2_:ITextWindow = this.find(this._window,"help_text") as ITextWindow;
         var _loc3_:IBitmapWrapperWindow = this.find(this._window,"help_image") as IBitmapWrapperWindow;
         if(!this.var_60 || this.var_60.length == 0)
         {
            return;
         }
         if(_loc1_)
         {
            _loc1_.text = ILocalization(this.var_60[this.var_273][0]).value;
         }
         if(_loc2_)
         {
            _loc2_.text = ILocalization(this.var_60[this.var_273][2]).value;
         }
         if(_loc3_)
         {
            _loc4_ = ILocalization(this.var_60[this.var_273][1]).value;
            this.setPreviewFromAsset(_loc4_);
         }
      }
      
      private function setElementImage(param1:IBitmapWrapperWindow, param2:BitmapData) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param1.disposed)
         {
            return;
         }
         var _loc3_:int = (param1.width - param2.width) / 2;
         var _loc4_:int = (param1.height - param2.height) / 2;
         if(param1.bitmap == null)
         {
            param1.bitmap = new BitmapData(param1.width,param1.height,true,16777215);
         }
         param1.bitmap.fillRect(param1.bitmap.rect,16777215);
         param1.bitmap.copyPixels(param2,param2.rect,new Point(_loc3_,_loc4_),null,null,false);
         param1.invalidate();
      }
      
      private function setPreviewFromAsset(param1:String) : void
      {
         if(!param1 || !this.var_78 || !this.var_78.assets)
         {
            return;
         }
         var _loc2_:BitmapDataAsset = this.var_78.assets.getAssetByName(param1) as BitmapDataAsset;
         if(_loc2_ == null)
         {
            this.retrievePreviewAsset(param1);
            return;
         }
         var _loc3_:IBitmapWrapperWindow = this.find(this._window,"help_image") as IBitmapWrapperWindow;
         if(_loc3_)
         {
            this.setElementImage(_loc3_,_loc2_.content as BitmapData);
         }
      }
      
      private function retrievePreviewAsset(param1:String) : void
      {
         if(!param1 || !this.var_78 || !this.var_78.assets)
         {
            return;
         }
         var _loc2_:String = this.var_78.configuration.getKey("image.library.catalogue.url");
         var _loc3_:* = _loc2_ + param1 + ".gif";
         Logger.log("[ProductViewCatalogWidget] Retrieve Product Preview Asset: " + _loc3_);
         var _loc4_:URLRequest = new URLRequest(_loc3_);
         var _loc5_:AssetLoaderStruct = this.var_78.assets.loadAssetFromFile(param1,_loc4_,"image/gif");
         if(!_loc5_)
         {
            return;
         }
         _loc5_.addEventListener(AssetLoaderEvent.const_29,this.onPreviewImageReady);
      }
      
      private function onPreviewImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ != null)
         {
            this.setPreviewFromAsset(_loc2_.assetName);
         }
      }
   }
}
