package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import flash.display.BitmapData;
   
   public class TutorialCallGuideBotView implements ITutorialUIView
   {
       
      
      private var var_33:TutorialUI;
      
      private var var_732:IWindowContainer;
      
      public function TutorialCallGuideBotView(param1:IItemListWindow, param2:TutorialUI)
      {
         super();
         this.var_33 = param2;
         var _loc3_:IWindowContainer = param2.buildXmlWindow("tutorial_call_guidebot") as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.procedure = this.windowProcedure;
         param1.addListItem(_loc3_ as IWindow);
         this.setToolbarIconHighlight(true);
         this.var_33.prepareForTutorial();
         this.var_33.help.toolbar.events.addEventListener(HabboToolbarShowMenuEvent.const_59,this.onShowMenuEvent);
      }
      
      public function get view() : IWindowContainer
      {
         return null;
      }
      
      public function get id() : String
      {
         return TutorialUI.const_521;
      }
      
      public function dispose() : void
      {
         this.setToolbarIconHighlight(false);
         this.var_33.help.toolbar.events.removeEventListener(HabboToolbarShowMenuEvent.const_59,this.onShowMenuEvent);
      }
      
      private function onShowMenuEvent(param1:HabboToolbarShowMenuEvent) : void
      {
         if(param1.menuId == HabboToolbarIconEnum.HELP && param1.type == HabboToolbarShowMenuEvent.const_59)
         {
            this.setToolbarIconHighlight(false);
            this.hideToolbarIconHighlightArrow();
         }
      }
      
      public function setToolbarIconHighlight(param1:Boolean) : void
      {
         var _loc2_:HabboToolbarSetIconEvent = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_104,HabboToolbarIconEnum.HELP);
         if(param1)
         {
            _loc2_.iconState = "highlight_blue";
            this.showToolbarIconHighlightArrow();
         }
         else
         {
            _loc2_.iconState = "0";
            this.hideToolbarIconHighlightArrow();
         }
         this.var_33.help.toolbar.events.dispatchEvent(_loc2_);
      }
      
      private function showToolbarIconHighlightArrow() : void
      {
         var _loc2_:* = null;
         if(this.var_732 != null)
         {
            return;
         }
         this.var_732 = this.var_33.buildXmlWindow("tutorial_arrow") as IWindowContainer;
         var _loc1_:IBitmapWrapperWindow = this.var_732.findChildByName("arrow") as IBitmapWrapperWindow;
         if(_loc1_ != null)
         {
            _loc2_ = BitmapDataAsset(this.var_33.assets.getAssetByName("tutorial_highlight_blue_arrow"));
            _loc1_.bitmap = (_loc2_.content as BitmapData).clone();
         }
         this.var_33.help.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_59,HabboToolbarIconEnum.HELP_ARROW,this.var_732));
      }
      
      private function hideToolbarIconHighlightArrow() : void
      {
         if(this.var_732 != null)
         {
            this.var_732.dispose();
            this.var_732 = null;
         }
      }
      
      private function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param2.name)
         {
            case "button_cancel":
               if(param1.type == WindowMouseEvent.const_42)
               {
                  this.var_33.showView(TutorialUI.const_97);
               }
         }
      }
   }
}
