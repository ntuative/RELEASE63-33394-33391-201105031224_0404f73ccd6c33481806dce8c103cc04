package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.club.ClubGiftController;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.Product;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.communication.messages.incoming.catalog.ClubGiftData;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ClubGiftWidget extends CatalogWidget implements ICatalogWidget, IGetImageListener
   {
       
      
      private var _controller:ClubGiftController;
      
      private var _itemList:IItemListWindow;
      
      private var _offers:Map;
      
      private var var_229:IWindowContainer;
      
      private const const_235:int = 31;
      
      public function ClubGiftWidget(param1:IWindowContainer, param2:ClubGiftController)
      {
         super(param1);
         this._controller = param2;
         this._offers = new Map();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this._controller = null;
         if(this.var_229)
         {
            this.var_229.dispose();
            this.var_229 = null;
         }
      }
      
      override public function init() : Boolean
      {
         if(!window)
         {
            return false;
         }
         if(!super.init())
         {
            return false;
         }
         this._controller.widget = this;
         var _loc1_:IWindowContainer = window.findChildByName("widget_main_container") as IWindowContainer;
         if(!_loc1_)
         {
            _loc1_ = this.createWindow("clubGiftWidget") as IWindowContainer;
            if(!_loc1_)
            {
               return false;
            }
            window.addChild(_loc1_);
            this._itemList = _loc1_.findChildByName("gift_list") as IItemListWindow;
         }
         this.update();
         return true;
      }
      
      public function update() : void
      {
         this.updateInfo();
         this.updateList();
      }
      
      private function updateInfo() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         if(!this._controller || !window)
         {
            return;
         }
         var _loc1_:ITextWindow = window.findChildByName("info_text") as ITextWindow;
         if(!_loc1_)
         {
            return;
         }
         if(this._controller.giftsAvailable > 0)
         {
            _loc2_ = "catalog.club_gift.available";
            this._controller.localization.registerParameter(_loc2_,"amount",this._controller.giftsAvailable.toString());
         }
         else if(this._controller.daysUntilNextGift > 0)
         {
            _loc2_ = "catalog.club_gift.days_until_next";
            this._controller.localization.registerParameter(_loc2_,"days",this._controller.daysUntilNextGift.toString());
         }
         else if(this._controller.hasClub)
         {
            _loc2_ = "catalog.club_gift.not_available";
         }
         else
         {
            _loc2_ = "catalog.club_gift.no_club";
         }
         _loc1_.text = this._controller.localization.getKey(_loc2_);
         if(!this._controller.purse)
         {
            return;
         }
         var _loc5_:ITextWindow = window.findChildByName("past_club_days") as ITextWindow;
         if(_loc5_)
         {
            _loc7_ = this._controller.purse.pastClubDays + this._controller.purse.pastVipDays;
            _loc2_ = _loc7_ >= this.const_235 ? "catalog.club_gift.past_club.long" : "catalog.club_gift.past_club";
            _loc3_ = _loc7_ % this.const_235;
            _loc4_ = _loc7_ / this.const_235;
            this._controller.localization.registerParameter(_loc2_,"days",_loc3_.toString());
            this._controller.localization.registerParameter(_loc2_,"months",_loc4_.toString());
            _loc5_.text = this._controller.localization.getKey(_loc2_);
         }
         var _loc6_:ITextWindow = window.findChildByName("past_vip_days") as ITextWindow;
         if(_loc6_)
         {
            _loc2_ = this._controller.purse.pastVipDays >= this.const_235 ? "catalog.club_gift.past_vip.long" : "catalog.club_gift.past_vip";
            _loc3_ = this._controller.purse.pastVipDays % this.const_235;
            _loc4_ = this._controller.purse.pastVipDays / this.const_235;
            this._controller.localization.registerParameter(_loc2_,"days",_loc3_.toString());
            this._controller.localization.registerParameter(_loc2_,"months",_loc4_.toString());
            _loc6_.text = this._controller.localization.getKey(_loc2_);
         }
      }
      
      private function updateList() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         if(!this._controller || !window || !page)
         {
            return;
         }
         for each(_loc1_ in this._offers)
         {
            _loc1_.dispose();
         }
         this._offers.reset();
         _loc2_ = this._controller.getOffers();
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Map = this._controller.getGiftData();
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:IItemListWindow = window.findChildByName("gift_list") as IItemListWindow;
         if(!_loc4_)
         {
            return;
         }
         _loc4_.destroyListItems();
         for each(_loc6_ in _loc2_)
         {
            _loc7_ = new Array();
            _loc8_ = this._controller.catalog.getProductData(_loc6_.localizationId);
            for each(_loc9_ in _loc6_.products)
            {
               _loc11_ = this._controller.catalog.getFurnitureData(_loc9_.furniClassId,_loc9_.productType);
               _loc12_ = new Product(_loc9_.productType,_loc9_.furniClassId,_loc9_.extraParam,_loc9_.productCount,_loc9_.expiration,_loc8_,_loc11_);
               _loc7_.push(_loc12_);
            }
            _loc1_ = new Offer(_loc6_.offerId,_loc6_.localizationId,_loc6_.priceInCredits,_loc6_.priceInActivityPoints,_loc6_.activityPointType,_loc7_,page);
            _loc10_ = _loc3_.getValue(_loc1_.offerId) as ClubGiftData;
            _loc5_ = this.createListItem(_loc1_,_loc10_);
            if(_loc5_)
            {
               _loc4_.addListItem(_loc5_);
               this._offers.add(_loc1_.offerId,_loc1_);
            }
         }
      }
      
      private function createListItem(param1:Offer, param2:ClubGiftData) : IWindow
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         if(!param1 || !param1.productContainer || !param1.productContainer.firstProduct || !param2)
         {
            return null;
         }
         var _loc3_:IWindowContainer = this.createWindow("club_gift_list_item") as IWindowContainer;
         if(!_loc3_)
         {
            return null;
         }
         _loc3_.procedure = this.clickHandler;
         var _loc4_:IProduct = param1.productContainer.firstProduct;
         if(!_loc4_)
         {
            return null;
         }
         var _loc5_:IProductData = _loc4_.productData;
         if(!_loc5_)
         {
            return null;
         }
         this.setText(_loc3_.findChildByName("gift_name"),_loc5_.name);
         this.setText(_loc3_.findChildByName("gift_desc"),_loc5_.description);
         if(param2.isVip)
         {
            _loc6_ = param2.daysRequired - this._controller.purse.pastVipDays;
         }
         else
         {
            _loc6_ = param2.daysRequired - (this._controller.purse.pastClubDays + this._controller.purse.pastVipDays);
         }
         if(!param2.isSelectable && _loc6_ > 0)
         {
            if(param2.isVip)
            {
               _loc7_ = "catalog.club_gift.vip_missing";
            }
            else
            {
               _loc7_ = "catalog.club_gift.club_missing";
            }
            if(_loc6_ >= this.const_235)
            {
               _loc7_ += ".long";
            }
            _loc12_ = _loc6_ % this.const_235;
            _loc13_ = _loc6_ / this.const_235;
            this._controller.localization.registerParameter(_loc7_,"days",_loc12_.toString());
            this._controller.localization.registerParameter(_loc7_,"months",_loc13_.toString());
         }
         else if(this._controller.giftsAvailable > 0)
         {
            _loc7_ = "catalog.club_gift.selectable";
         }
         else
         {
            _loc7_ = "";
         }
         this.setText(_loc3_.findChildByName("months_required"),_loc7_.length > 0 ? this._controller.localization.getKey(_loc7_) : "");
         var _loc8_:IIconWindow = _loc3_.findChildByName("vip_icon") as IIconWindow;
         if(_loc8_)
         {
            _loc8_.visible = param2.isVip;
         }
         var _loc9_:IButtonWindow = _loc3_.findChildByName("select_button") as IButtonWindow;
         if(_loc9_)
         {
            if(param2.isSelectable && this._controller.giftsAvailable > 0)
            {
               _loc9_.enable();
            }
            else
            {
               _loc9_.disable();
            }
            _loc9_.id = param1.offerId;
         }
         var _loc10_:IProductContainer = param1.productContainer;
         if(!_loc10_)
         {
            return null;
         }
         if(!page || true || !page.viewer.roomEngine)
         {
            return null;
         }
         var _loc11_:IWindowContainer = _loc3_.findChildByName("image_container") as IWindowContainer;
         if(_loc11_)
         {
            _loc10_.view = _loc11_;
            _loc10_.initProductIcon(page.viewer.roomEngine);
            _loc11_.procedure = this.mouseOverHandler;
            _loc11_.id = param1.offerId;
         }
         return _loc3_;
      }
      
      private function setText(param1:IWindow, param2:String) : void
      {
         var _loc3_:ITextWindow = param1 as ITextWindow;
         if(!_loc3_)
         {
            return;
         }
         _loc3_.text = param2;
      }
      
      private function clickHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(!param1 || !param2 || !this._offers || !this._controller)
         {
            return;
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(param2.name != "select_button")
         {
            return;
         }
         var _loc3_:Offer = this._offers.getValue(param2.id) as Offer;
         if(!_loc3_)
         {
            return;
         }
         this._controller.selectGift(_loc3_);
      }
      
      private function mouseOverHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!param1 || !param2 || !this._offers)
         {
            return;
         }
         if(param2.name != "image_container")
         {
            return;
         }
         var _loc3_:Offer = this._offers.getValue(param2.id) as Offer;
         if(!_loc3_)
         {
            return;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            _loc4_ = new Rectangle();
            param2.getGlobalRectangle(_loc4_);
         }
         if(param1.type == WindowMouseEvent.const_25)
         {
            this.hidePreview();
         }
      }
      
      private function showPreview(param1:Offer, param2:Rectangle) : void
      {
         var _loc4_:* = null;
         if(!param1 || !param1.productContainer)
         {
            return;
         }
         if(!page || true || !page.viewer.roomEngine)
         {
            return;
         }
         var _loc3_:IProduct = param1.productContainer.firstProduct;
         if(!_loc3_)
         {
            return;
         }
         switch(_loc3_.productType)
         {
            case "s":
               _loc4_ = page.viewer.roomEngine.getFurnitureImage(_loc3_.productClassId,new Vector3d(90),64,this,0,_loc3_.extraParam);
               break;
            case "i":
               _loc4_ = page.viewer.roomEngine.getWallItemImage(_loc3_.productClassId,new Vector3d(90),64,this,0,_loc3_.extraParam);
               break;
            default:
               return;
         }
         if(!_loc4_ || !_loc4_.data)
         {
            return;
         }
         if(!this.var_229)
         {
            this.var_229 = this.createWindow("club_gift_preview") as IWindowContainer;
         }
         if(!this.var_229)
         {
            return;
         }
         var _loc5_:IBitmapWrapperWindow = this.var_229.findChildByName("image") as IBitmapWrapperWindow;
         if(!_loc5_)
         {
            return;
         }
         _loc5_.width = _loc4_.data.width;
         _loc5_.height = _loc4_.data.height;
         if(_loc5_.bitmap)
         {
            _loc5_.bitmap.dispose();
         }
         _loc5_.bitmap = new BitmapData(_loc5_.width,_loc5_.height);
         _loc5_.bitmap.draw(_loc4_.data);
         var _loc6_:Point = Point.interpolate(param2.topLeft,param2.bottomRight,0.5);
         this.var_229.setGlobalPosition(_loc6_.subtract(new Point(this.var_229.width / 2,this.var_229.height / 2)));
         this.var_229.visible = true;
         this.var_229.activate();
      }
      
      private function hidePreview() : void
      {
         if(this.var_229)
         {
            this.var_229.visible = false;
         }
      }
      
      private function createWindow(param1:String) : IWindow
      {
         if(!this._controller || !this._controller.assets || !this._controller.windowManager)
         {
            return null;
         }
         var _loc2_:XmlAsset = this._controller.assets.getAssetByName(param1) as XmlAsset;
         if(!_loc2_ || !_loc2_.content)
         {
            return null;
         }
         var _loc3_:XML = _loc2_.content as XML;
         if(!_loc3_)
         {
            return null;
         }
         return this._controller.windowManager.buildFromXML(_loc3_);
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
      }
   }
}
