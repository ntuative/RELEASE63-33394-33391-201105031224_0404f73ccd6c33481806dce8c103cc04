package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetInitPurchaseEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2799:XML;
      
      private var var_2797:XML;
      
      private var var_2798:XML;
      
      private var var_1028:IWindowContainer;
      
      private var var_677:IButtonWindow;
      
      private var var_3002:IButtonWindow;
      
      private var var_2019:ITextWindow;
      
      private var var_2017:ITextWindow;
      
      private var var_2018:ITextWindow;
      
      private var var_2971:ITextWindow;
      
      private var var_94:Offer;
      
      private var var_2016:String = "";
      
      private var var_1556:Function;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         events.removeEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.removeEventListener(WidgetEvent.const_756,this.onSetParameter);
         events.removeEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            this.var_2799 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            this.var_2797 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            this.var_2798 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.addEventListener(WidgetEvent.const_756,this.onSetParameter);
         events.addEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
         events.addEventListener(WidgetEvent.CWE_INIT_PURCHASE,this.initPurchase);
         return true;
      }
      
      private function onPurchaseOverride(param1:CatalogWidgetPurchaseOverrideEvent) : void
      {
         this.var_1556 = param1.callback;
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_920:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2799) as IWindowContainer;
               break;
            case Offer.const_1234:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2797) as IWindowContainer;
               break;
            case Offer.const_1239:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2798) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach..." + this.var_94.priceType);
         }
         if(_loc2_ != null)
         {
            if(this.var_1028 != null)
            {
               _window.removeChild(this.var_1028);
               this.var_1028.dispose();
            }
            this.var_1028 = _loc2_;
            _window.addChild(_loc2_);
            this.var_1028.x = 0;
            this.var_1028.y = 0;
         }
         this.var_2019 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         this.var_2017 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         this.var_2018 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         this.var_2971 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         this.var_677 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(this.var_677 != null)
         {
            if(this.var_1556 != null)
            {
               this.var_677.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1556);
            }
            else
            {
               this.var_677.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1556);
               this.var_677.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPurchase);
            }
            this.var_677.disable();
         }
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         this.var_94 = param1.offer;
         this.attachStub(this.var_94.priceType);
         if(this.var_2019 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(this.var_94.priceInCredits));
            this.var_2019.caption = "${catalog.purchase.price.credits}";
         }
         var _loc3_:String = this.var_94.activityPointType == Purse.const_220 ? "pixels" : "activitypoints";
         if(this.var_2017 != null)
         {
            _loc4_ = "catalog.purchase.price.activitypoints." + this.var_94.activityPointType;
            _loc2_.registerParameter(_loc4_,_loc3_,this.var_94.priceInActivityPoints.toString());
            this.var_2017.caption = _loc2_.getKey(_loc4_);
         }
         if(this.var_2018 != null)
         {
            _loc4_ = "catalog.purchase.price.credits+activitypoints." + this.var_94.activityPointType;
            _loc2_.registerParameter(_loc4_,"credits",String(this.var_94.priceInCredits));
            _loc2_.registerParameter(_loc4_,_loc3_,String(this.var_94.priceInActivityPoints));
            this.var_2018.caption = _loc2_.getKey(_loc4_);
         }
         var _loc5_:IWindow = _window.findChildByName("activity_points_bg");
         if(_loc5_ != null)
         {
            _loc5_.color = this.var_94.activityPointType == 0 ? 6737151 : uint(13421772);
         }
         if(this.var_677 != null)
         {
            this.var_677.enable();
         }
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         this.var_2016 = param1.parameter;
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(this.var_94 != null)
         {
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this.var_94,page.pageId,this.var_2016);
         }
      }
      
      private function initPurchase(param1:CatalogWidgetInitPurchaseEvent) : void
      {
         if(this.var_94 != null)
         {
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this.var_94,page.pageId,this.var_2016,param1.enableBuyAsGift);
         }
      }
   }
}
