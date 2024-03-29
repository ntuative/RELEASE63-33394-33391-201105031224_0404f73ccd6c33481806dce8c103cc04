package com.sulake.habbo.avatar.torso
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.common.AvatarEditorGridView;
   import com.sulake.habbo.avatar.common.CategoryBaseView;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.utils.Dictionary;
   
   public class TorsoView extends CategoryBaseView implements IAvatarEditorCategoryView
   {
       
      
      public function TorsoView(param1:TorsoModel, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super(param2,param3,param1);
      }
      
      override public function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!_window)
         {
            _loc1_ = _assetLibrary.getAssetByName("avatareditor_torso_base") as XmlAsset;
            if(_loc1_)
            {
               _window = IWindowContainer(_windowManager.buildFromXML(_loc1_.content as XML));
               _window.visible = false;
               _window.procedure = this.windowEventProc;
            }
         }
         if(!var_39)
         {
            var_39 = new Dictionary();
            var_39["null"] = new AvatarEditorGridView(var_67,FigureData.const_288,_windowManager,_assetLibrary);
            var_39["null"] = new AvatarEditorGridView(var_67,FigureData.const_207,_windowManager,_assetLibrary);
            var_39["null"] = new AvatarEditorGridView(var_67,FigureData.CHEST_ACCESSORIES,_windowManager,_assetLibrary);
            var_39["null"] = new AvatarEditorGridView(var_67,FigureData.const_271,_windowManager,_assetLibrary);
         }
         else
         {
            for each(_loc2_ in var_39)
            {
               _loc2_.initFromList();
            }
         }
         var_195 = true;
         attachImages();
         if(var_67 && var_147 == "")
         {
            var_67.switchCategory(FigureData.const_207);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_67 = null;
      }
      
      public function switchCategory(param1:String) : void
      {
         if(_window == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         if(var_147 == param1)
         {
            return;
         }
         inactivateTab(var_48);
         switch(param1)
         {
            case FigureData.const_207:
               var_48 = "tab_shirt";
               break;
            case FigureData.const_288:
               var_48 = "tab_jacket";
               break;
            case FigureData.const_271:
               var_48 = "tab_prints";
               break;
            case FigureData.CHEST_ACCESSORIES:
               var_48 = "tab_accessories";
               break;
            default:
               throw new Error("[TorsoView] Unknown item category: \"" + param1 + "\"");
         }
         var_147 = param1;
         activateTab(var_48);
         if(!var_195)
         {
            this.init();
         }
         updateGridView();
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "tab_jacket":
                  this.switchCategory(FigureData.const_288);
                  break;
               case "tab_shirt":
                  this.switchCategory(FigureData.const_207);
                  break;
               case "tab_accessories":
                  this.switchCategory(FigureData.CHEST_ACCESSORIES);
                  break;
               case "tab_prints":
                  this.switchCategory(FigureData.const_271);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            switch(param2.name)
            {
               case "tab_jacket":
               case "tab_prints":
               case "tab_shirt":
               case "tab_accessories":
                  activateTab(param2.name);
            }
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            switch(param2.name)
            {
               case "tab_jacket":
               case "tab_prints":
               case "tab_shirt":
               case "tab_accessories":
                  if(var_48 != param2.name)
                  {
                     inactivateTab(param2.name);
                  }
            }
         }
      }
   }
}
