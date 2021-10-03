package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.catalog.viewer.BundleProductContainer;
   import com.sulake.habbo.catalog.viewer.IDragAndDropDoneReceiver;
   import com.sulake.habbo.catalog.viewer.IGridItem;
   import com.sulake.habbo.catalog.viewer.IItemGrid;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.ProductContainer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetInitPurchaseEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ItemGridCatalogWidget extends CatalogWidget implements ICatalogWidget, IItemGrid, IDragAndDropDoneReceiver
   {
       
      
      protected var var_575:IItemGridWindow;
      
      protected var var_1751:XML;
      
      protected var var_369:IGridItem;
      
      private var var_1972:int = 0;
      
      protected var var_209:Timer;
      
      protected var var_201:Boolean = true;
      
      private var var_825:int = 0;
      
      private var _scrollBar:IScrollbarWindow;
      
      public function ItemGridCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
         this._scrollBar = _window.findChildByName("itemGridScrollbar") as IScrollbarWindow;
         if(this._scrollBar != null)
         {
            this._scrollBar.visible = false;
            this._scrollBar.addEventListener(WindowEvent.const_765,this.activateScrollbar);
            this._scrollBar.addEventListener(WindowEvent.const_244,this.activateScrollbar);
            this._scrollBar.addEventListener(WindowEvent.const_887,this.deActivateScrollbar);
            this._scrollBar.addEventListener(WindowEvent.const_201,this.deActivateScrollbar);
         }
      }
      
      override public function dispose() : void
      {
         if(this.var_209 != null)
         {
            this.var_209.stop();
            this.var_209.removeEventListener(TimerEvent.TIMER,this.populateItemGrid);
            this.var_209 = null;
         }
         if(this.var_575 != null)
         {
            this.var_575.destroyGridItems();
            this.var_575 = null;
         }
         this.var_1751 = null;
         this.var_369 = null;
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         this.var_575 = _window.findChildByName("itemGrid") as IItemGridWindow;
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("gridItem") as XmlAsset;
         this.var_1751 = _loc1_.content as XML;
         this.populateItemGrid();
         this.loadItemGridGraphics();
         if(this.var_201)
         {
            this.var_209 = new Timer(25);
            this.var_209.addEventListener(TimerEvent.TIMER,this.loadItemGridGraphics);
            this.var_209.start();
         }
         return true;
      }
      
      public function select(param1:IGridItem) : void
      {
         if(this.var_369 != null)
         {
            this.var_369.deActivate();
         }
         this.var_369 = param1;
         param1.activate();
         var _loc2_:Offer = (param1 as ProductContainer).offer;
         if(_loc2_ != null)
         {
            events.dispatchEvent(new SelectProductEvent(_loc2_));
            if(_loc2_.productContainer.firstProduct.productType == ProductTypeEnum.const_65)
            {
               events.dispatchEvent(new SetExtraPurchaseParameterEvent(_loc2_.productContainer.firstProduct.extraParam));
            }
         }
      }
      
      public function startDragAndDrop(param1:IGridItem) : Boolean
      {
         var _loc2_:Offer = (param1 as ProductContainer).offer;
         if(_loc2_ != null)
         {
            (page.viewer.catalog as HabboCatalog).requestSelectedItemToMover(this,_loc2_);
         }
         return true;
      }
      
      public function onDragAndDropDone(param1:Boolean) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1)
         {
            events.dispatchEvent(new CatalogWidgetInitPurchaseEvent(false));
         }
      }
      
      public function stopDragAndDrop() : void
      {
      }
      
      protected function populateItemGrid() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in page.offers)
         {
            this.createGridItem(_loc1_);
            _loc1_.productContainer.grid = this;
         }
      }
      
      protected function resetTimer() : void
      {
         if(this.var_209)
         {
            this.var_209.removeEventListener(TimerEvent.TIMER,this.populateItemGrid);
            this.var_209.reset();
         }
         this.var_825 = 0;
      }
      
      protected function loadItemGridGraphics(param1:TimerEvent = null) : void
      {
         var _loc3_:* = null;
         if(param1 != null)
         {
         }
         var _loc2_:int = 0;
         while(_loc2_ < 3)
         {
            if(this.var_825 >= 0 && this.var_825 < page.offers.length)
            {
               _loc3_ = page.offers[this.var_825];
               this.loadGraphics(_loc3_);
               _loc3_.productContainer.grid = this;
            }
            ++this.var_825;
            if(this.var_825 >= page.offers.length)
            {
               this.resetTimer();
               break;
            }
            _loc2_++;
         }
      }
      
      private function activateScrollbar(param1:WindowEvent) : void
      {
         (param1.target as IWindow).visible = true;
      }
      
      private function deActivateScrollbar(param1:WindowEvent) : void
      {
         (param1.target as IWindow).visible = false;
      }
      
      protected function createGridItem(param1:Offer) : void
      {
         var _loc2_:IWindowContainer = page.viewer.catalog.windowManager.buildFromXML(this.var_1751) as IWindowContainer;
         this.var_575.addGridItem(_loc2_);
         param1.productContainer.view = _loc2_;
         if((page.viewer.catalog as HabboCatalog).isDraggable(param1))
         {
            (param1.productContainer as IGridItem).setDraggable(true);
         }
         if(param1.pricingModel == Offer.const_644)
         {
            ++this.var_1972;
            (param1.productContainer as BundleProductContainer).setBundleCounter(this.var_1972);
         }
      }
      
      protected function loadGraphics(param1:Offer) : void
      {
         param1.productContainer.initProductIcon(page.viewer.roomEngine);
      }
   }
}
