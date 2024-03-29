package com.sulake.habbo.navigator.roomsettings
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CreateFlatMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.TextFieldManager;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.domain.RoomLayout;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class RoomCreateViewCtrl
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var var_178:IWindowContainer;
      
      private var _list:IItemListWindow;
      
      private var var_1126:TextFieldManager;
      
      private var var_45:Array;
      
      private var var_1125:RoomLayout;
      
      private var var_611:Timer;
      
      private var var_1707:Boolean = true;
      
      public function RoomCreateViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_611 = new Timer(100);
         this.var_611.addEventListener(TimerEvent.TIMER,this.updateArrowPos);
         this.var_45 = new Array();
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_56,104,"a"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_56,94,"b"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_56,36,"c"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_56,84,"d"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_56,80,"e"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_56,80,"f"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_56,416,"i"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_56,320,"j"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_56,448,"k"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_56,352,"l"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_56,384,"m"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_56,372,"n"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_45,80,"g"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_45,74,"h"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_45,416,"o"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_45,352,"p"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_45,304,"q"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_45,336,"r"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_45,748,"u"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_45,438,"v"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_47,540,"t"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_47,512,"w"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_47,396,"x"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_47,440,"y"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_47,456,"z"));
         this.var_45.push(new RoomLayout(HabboClubLevelEnum.const_47,208,"0"));
      }
      
      public function dispose() : void
      {
         if(this.var_611)
         {
            this.var_611.removeEventListener(TimerEvent.TIMER,this.updateArrowPos);
            this.var_611.reset();
            this.var_611 = null;
         }
      }
      
      private function updateArrowPos(param1:Event) : void
      {
         var _loc3_:IBitmapWrapperWindow = IBitmapWrapperWindow(this.var_1125.view.findChildByName("select_arrow"));
         var _loc6_:int = Math.abs(_loc3_.y - 0) < 2 || Math.abs(_loc3_.y - 15) < 2 ? 1 : 2;
         _loc3_.y += !!this.var_1707 ? _loc6_ : -_loc6_;
         if(_loc3_.y < 0)
         {
            this.var_1707 = true;
            _loc3_.y = 1;
         }
         else if(_loc3_.y > 15)
         {
            this.var_1707 = false;
            _loc3_.y = 14;
         }
      }
      
      public function show() : void
      {
         this.prepare();
         this.var_178.visible = true;
         this.refresh();
         this.var_178.activate();
         this.var_611.start();
      }
      
      private function addMouseClickListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.setParamFlag(HabboWindowParam.const_41,true);
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,param2);
         }
      }
      
      private function prepare() : void
      {
         if(this.var_178 != null)
         {
            return;
         }
         this.var_178 = IWindowContainer(this._navigator.getXmlWindow("roc_create_room"));
         this._list = IItemListWindow(this.var_178.findChildByName("item_list"));
         this.refreshRoomThumbnails();
         var _loc1_:IButtonWindow = this.getCreateButton();
         this.addMouseClickListener(_loc1_,this.onCreateButtonClick);
         var _loc2_:IButtonWindow = this.getCancelButton();
         this.addMouseClickListener(_loc2_,this.onCancelButtonClick);
         var _loc3_:IWindow = this.var_178.findChildByTag("close");
         this.addMouseClickListener(_loc3_,this.onCancelButtonClick);
         this.var_1126 = new TextFieldManager(this._navigator,ITextFieldWindow(this.var_178.findChildByName("room_name_input")),25,null,this._navigator.getText("navigator.createroom.roomnameinfo"));
         var _loc4_:Rectangle = Util.getLocationRelativeTo(this.var_178.desktop,this.var_178.width,this.var_178.height);
         this.var_178.x = _loc4_.x;
         this.var_178.y = _loc4_.y;
      }
      
      public function refresh() : void
      {
         this.var_1126.goBackToInitialState();
         this.var_1126.input.textBackgroundColor = 4294967295;
         this.var_1125 = this.var_45[0];
         this.refreshRoomThumbnails();
         this.refreshSelection();
      }
      
      private function refreshSelection() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = false;
         var _loc3_:* = null;
         for each(_loc1_ in this.var_45)
         {
            if(_loc1_.view != null)
            {
               _loc2_ = _loc1_ == this.var_1125;
               _loc1_.view.findChildByName("bg_sel").visible = _loc2_;
               _loc1_.view.findChildByName("bg_unsel").visible = !_loc2_;
               _loc3_ = ITextWindow(_loc1_.view.findChildByName("tile_size_txt"));
               _loc3_.textColor = !!_loc2_ ? 4294967295 : uint(4278190080);
               _loc3_.color = !!_loc2_ ? 4285432196 : uint(4291546059);
               this._navigator.refreshButton(_loc1_.view,"tile_icon_black",!_loc2_,null,0);
               this._navigator.refreshButton(_loc1_.view,"tile_icon_white",_loc2_,null,0);
               this._navigator.refreshButton(_loc1_.view,"select_arrow",_loc2_,null,0);
            }
         }
      }
      
      private function refreshRoomThumbnails() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         while(this._list.numListItems > 0)
         {
            _loc6_ = this._list.removeListItemAt(0);
            _loc6_.destroy();
         }
         for each(_loc1_ in this.var_45)
         {
            if(_loc1_.view != null)
            {
               _loc1_.view.destroy();
               _loc1_.view = null;
            }
         }
         _loc2_ = 0;
         _loc4_ = 0;
         while(_loc4_ < this.var_45.length)
         {
            _loc7_ = this.var_45[_loc4_];
            if(this.isAllowed(_loc7_))
            {
               if(_loc2_ == 0)
               {
                  _loc3_ = this.getRow();
                  this._list.addListItem(_loc3_);
               }
               this.addThumbnail(_loc3_,this.var_45[_loc4_],_loc2_ % 2 == 0);
               _loc2_ = _loc2_ == 0 ? 1 : 0;
            }
            _loc4_++;
         }
         this.refreshSelection();
         var _loc5_:* = "roc_hc_promo";
         if(this._navigator.sessionData.hasUserRight("fuse_use_special_room_layouts",HabboClubLevelEnum.const_45))
         {
            if(this._navigator.sessionData.hasUserRight("fuse_use_vip_room_layouts",HabboClubLevelEnum.const_47))
            {
               _loc5_ = null;
            }
            else
            {
               _loc5_ = "roc_vip_promo";
            }
         }
         if(_loc5_)
         {
            _loc8_ = IWindowContainer(this._navigator.getXmlWindow(_loc5_));
            if(_loc8_)
            {
               _loc9_ = _loc8_.findChildByName("link");
               this.addMouseClickListener(_loc9_,this.onHcMoreClick);
               this._list.addListItem(_loc8_);
            }
         }
      }
      
      private function addThumbnail(param1:IWindowContainer, param2:RoomLayout, param3:Boolean) : void
      {
         var _loc4_:IWindowContainer = IWindowContainer(this._navigator.getXmlWindow("roc_room_thumbnail"));
         _loc4_.tags.push(param2.name);
         if(!param3)
         {
            _loc4_.x = _loc4_.width;
         }
         this.addMouseClickListener(_loc4_,this.onContPicClick);
         var _loc5_:IWindowContainer = _loc4_.findChildByName("bg_pic") as IWindowContainer;
         var _loc6_:IBitmapWrapperWindow = this._navigator.getButton(param2.name,"model_" + param2.name,null,0,0,0);
         _loc6_.setParamFlag(HabboWindowParam.const_41,false);
         _loc5_.addChild(_loc6_);
         var _loc7_:Rectangle = Util.getLocationRelativeTo(_loc5_,_loc6_.width,_loc6_.height);
         _loc6_.x = _loc7_.x;
         _loc6_.y = _loc7_.y;
         param1.addChild(_loc4_);
         param1.width = 2 * _loc4_.width;
         param1.height = _loc4_.height;
         param2.view = _loc4_;
         ITextWindow(param2.view.findChildByName("tile_size_txt")).text = param2.tileSize + " " + this._navigator.getText("navigator.createroom.tilesize");
         var _loc8_:IIconWindow = _loc4_.findChildByName("club_icon") as IIconWindow;
         if(_loc8_)
         {
            switch(param2.requiredClubLevel)
            {
               case HabboClubLevelEnum.const_45:
                  _loc8_.style = 11;
                  break;
               case HabboClubLevelEnum.const_47:
                  _loc8_.style = 12;
                  break;
               default:
                  _loc8_.visible = false;
            }
         }
      }
      
      private function isAllowed(param1:RoomLayout) : Boolean
      {
         switch(param1.requiredClubLevel)
         {
            case HabboClubLevelEnum.const_56:
               return true;
            case HabboClubLevelEnum.const_45:
               return this._navigator.sessionData.hasUserRight("fuse_use_special_room_layouts",HabboClubLevelEnum.const_45);
            case HabboClubLevelEnum.const_47:
               return this._navigator.sessionData.hasUserRight("fuse_use_vip_room_layouts",HabboClubLevelEnum.const_47);
            default:
               return false;
         }
      }
      
      private function getRow() : IWindowContainer
      {
         return IWindowContainer(this._navigator.windowManager.createWindow("","",HabboWindowType.const_73,HabboWindowStyle.const_30,HabboWindowParam.const_63,new Rectangle(0,0,100,300)));
      }
      
      private function isMandatoryFieldsFilled() : Boolean
      {
         return Boolean(this.var_1126.checkMandatory(this._navigator.getText("navigator.createroom.nameerr")));
      }
      
      private function getCreateButton() : IButtonWindow
      {
         return IButtonWindow(this.var_178.findChildByName("create_button"));
      }
      
      private function getCancelButton() : IButtonWindow
      {
         return IButtonWindow(this.var_178.findChildByName("back_button"));
      }
      
      private function onChooseLayout(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:RoomLayout = this.getLayout(param2);
         if(this.isAllowed(_loc3_))
         {
            this.var_1125 = _loc3_;
            this.refreshSelection();
         }
      }
      
      private function getLayout(param1:IWindow) : RoomLayout
      {
         return this.findLayout(param1.tags[0]);
      }
      
      private function findLayout(param1:String) : RoomLayout
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_45)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return this.var_45[0];
      }
      
      private function onContPicClick(param1:WindowEvent) : void
      {
         var _loc2_:IWindowContainer = param1.target as IWindowContainer;
         this.onChooseLayout(param1,_loc2_);
      }
      
      private function onCancelButtonClick(param1:WindowEvent) : void
      {
         this.close();
      }
      
      private function onHcMoreClick(param1:WindowEvent) : void
      {
         this._navigator.openCatalogClubPage();
      }
      
      private function onCreateButtonClick(param1:WindowEvent) : void
      {
         var _loc2_:String = this.var_1126.getText();
         var _loc3_:String = "model_" + this.var_1125.name;
         if(!this.isMandatoryFieldsFilled())
         {
            return;
         }
         this._navigator.send(new CreateFlatMessageComposer(_loc2_,_loc3_));
         this.var_178.visible = false;
      }
      
      private function close() : void
      {
         this.var_178.visible = false;
         this.var_611.reset();
      }
   }
}
