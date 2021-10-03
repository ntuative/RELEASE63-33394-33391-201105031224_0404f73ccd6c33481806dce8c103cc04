package com.sulake.habbo.toolbar
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public interface IToolbarView extends IDisposable
   {
       
      
      function animateWindowIn(param1:String, param2:IWindowContainer, param3:Point = null) : void;
      
      function animateWindowOut(param1:String, param2:IWindowContainer) : void;
      
      function positionWindow(param1:String, param2:IWindowContainer) : void;
      
      function hideWindow(param1:String, param2:IWindowContainer) : void;
      
      function setIcon(param1:String, param2:Boolean = true) : void;
      
      function setIconBitmap(param1:String, param2:BitmapData) : void;
      
      function setIconState(param1:String, param2:String) : void;
      
      function removeIcon(param1:String) : void;
      
      function getIconLoc(param1:String) : Point;
      
      function getIconByMenuId(param1:String) : ToolbarIcon;
      
      function get orientation() : String;
      
      function get barSize() : Number;
      
      function setNewItemCount(param1:String, param2:int) : void;
   }
}
