package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_178:IWindowContainer;
      
      private var var_2966:int;
      
      private var var_375:RoomEventViewCtrl;
      
      private var var_269:Timer;
      
      private var var_189:RoomSettingsCtrl;
      
      private var var_270:RoomThumbnailCtrl;
      
      private var var_1116:TagRenderer;
      
      private var var_315:IWindowContainer;
      
      private var var_442:IWindowContainer;
      
      private var var_817:IWindowContainer;
      
      private var var_2731:IWindowContainer;
      
      private var var_2730:IWindowContainer;
      
      private var var_1527:IWindowContainer;
      
      private var var_950:ITextWindow;
      
      private var var_1244:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_997:ITextWindow;
      
      private var var_1531:ITextWindow;
      
      private var var_1247:ITextWindow;
      
      private var var_998:ITextWindow;
      
      private var var_1949:ITextWindow;
      
      private var var_271:IWindowContainer;
      
      private var var_996:IWindowContainer;
      
      private var var_1945:IWindowContainer;
      
      private var var_2732:ITextWindow;
      
      private var var_818:ITextWindow;
      
      private var var_2727:IWindow;
      
      private var var_1529:IContainerButtonWindow;
      
      private var var_1528:IContainerButtonWindow;
      
      private var var_1533:IContainerButtonWindow;
      
      private var var_1526:IContainerButtonWindow;
      
      private var var_1530:IContainerButtonWindow;
      
      private var var_1946:IButtonWindow;
      
      private var var_1947:IButtonWindow;
      
      private var var_1948:IButtonWindow;
      
      private var var_999:IWindowContainer;
      
      private var var_1532:ITextWindow;
      
      private var var_1246:ITextFieldWindow;
      
      private var _buttons:IWindowContainer;
      
      private var var_1245:IButtonWindow;
      
      private var var_995:IButtonWindow;
      
      private var var_2729:String;
      
      private var var_2728:String;
      
      private var var_443:Boolean = true;
      
      private const const_537:int = 75;
      
      private const const_618:int = 3;
      
      private const const_482:int = 45;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_375 = new RoomEventViewCtrl(this._navigator);
         this.var_189 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_270 = new RoomThumbnailCtrl(this._navigator);
         this.var_1116 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_189);
         this.var_269 = new Timer(6000,1);
         this.var_269.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.removeEventListener(HabboToolbarSetIconEvent.const_104,this.onToolbarIconState);
         }
         if(this.var_269)
         {
            this.var_269.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_269.reset();
            this.var_269 = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_269.reset();
         this.var_375.active = true;
         this.var_189.active = false;
         this.var_270.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_269.reset();
         this.var_189.load(param1);
         this.var_189.active = true;
         this.var_375.active = false;
         this.var_270.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_189.active = true;
         this.var_375.active = false;
         this.var_270.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_269.reset();
         this.var_189.active = false;
         this.var_375.active = false;
         this.var_270.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         if(this.var_443)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_1157,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_269.reset();
         this.var_375.active = false;
         this.var_189.active = false;
         this.var_270.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(this._navigator.data.enteredGuestRoom.flatId);
         }
         this.refresh();
         this._window.visible = true;
         if(this.var_443)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_59,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
         this._window.parent.activate();
         this._window.activate();
         if(!param1)
         {
            this.var_269.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_269.reset();
         this.var_375.active = false;
         this.var_189.active = false;
         this.var_270.active = false;
         this.refresh();
         if(this.var_443)
         {
            if(!this._window.visible)
            {
               this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_59,HabboToolbarIconEnum.ROOMINFO,this._window,false));
               this._window.parent.activate();
            }
            else
            {
               this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_546,HabboToolbarIconEnum.ROOMINFO,this._window,false));
            }
         }
         else
         {
            this._window.visible = !this._window.visible;
            this._window.x = this._window.desktop.width - this._window.width - this.const_618;
            this._window.y = this.const_537;
            if(this._window.visible)
            {
               this._window.activate();
            }
         }
      }
      
      private function refresh() : void
      {
         var _loc1_:int = 0;
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         if(this.var_443)
         {
            Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info","buttons_container"],0,2);
            this._window.height = Util.getLowestPoint(this._window);
            this._window.y = this._window.desktop.height - this._window.height - 5;
            Logger.log("MAIN: " + this.var_315.rectangle + ", " + this.var_271.rectangle + ", " + this._window.rectangle);
         }
         else
         {
            Util.moveChildrenToColumn(this.var_178,["room_info","event_info","embed_info","buttons_container"],0,2);
            this.var_178.height = Util.getLowestPoint(this.var_178);
            _loc1_ = this._window.desktop.height - this._window.height - this.const_482;
            if(this._window.y > _loc1_)
            {
               this._window.y = _loc1_ < 0 ? 0 : int(_loc1_);
            }
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_315);
         if(this.var_443)
         {
            this.var_315.findChildByName("close").visible = true;
         }
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_189.refresh(this.var_315);
         this.var_270.refresh(this.var_315);
         Util.moveChildrenToColumn(this.var_315,["room_details","room_buttons"],0,2);
         this.var_315.height = Util.getLowestPoint(this.var_315);
         this.var_315.visible = true;
         Logger.log("XORP: " + this.var_442.visible + ", " + this.var_1527.visible + ", " + this.var_817.visible + ", " + this.var_817.rectangle + ", " + this.var_315.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_271);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_375.refresh(this.var_271);
         if(Util.hasVisibleChildren(this.var_271) && !(this.var_189.active || this.var_270.active))
         {
            Util.moveChildrenToColumn(this.var_271,["event_details","event_buttons"],0,2);
            this.var_271.height = Util.getLowestPoint(this.var_271);
            this.var_271.visible = true;
         }
         else
         {
            this.var_271.visible = false;
         }
         Logger.log("EVENT: " + this.var_271.visible + ", " + this.var_271.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","HabboRoomObjectVisualizationLib_manifest") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_189.active && !this.var_270.active && !this.var_375.active)
         {
            this.var_999.visible = true;
            this.var_1246.text = this.getEmbedData();
         }
         else
         {
            this.var_999.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this._buttons)
         {
            return;
         }
         if(this.var_189.active)
         {
            this._buttons.visible = false;
            return;
         }
         this._buttons.visible = true;
         if(this.var_1245)
         {
            if(this.var_2729 == "exit_homeroom")
            {
               this.var_1245.caption = "${navigator.homeroom}";
            }
            else
            {
               this.var_1245.caption = "${navigator.hotelview}";
            }
         }
         if(this.var_995)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_995.visible = _loc1_;
            if(this.var_2728 == "0")
            {
               this.var_995.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_995.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_189.active || this.var_270.active)
         {
            return;
         }
         this.var_950.text = param1.roomName;
         this.var_950.height = this.var_950.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_997.text = param1.description;
         this.var_1116.refreshTags(this.var_442,param1.tags);
         this.var_997.visible = false;
         if(param1.description != "")
         {
            this.var_997.height = this.var_997.textHeight + 5;
            this.var_997.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1528,"facebook_logo_small",_loc3_,null,0);
         this.var_1528.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1529,"thumb_up",_loc4_,null,0);
         this.var_1529.visible = _loc4_;
         this.var_998.visible = !_loc4_;
         this.var_1949.visible = !_loc4_;
         this.var_1949.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_442,"home",param2,null,0);
         this._navigator.refreshButton(this.var_442,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_442,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_950.y,0);
         this.var_442.visible = true;
         this.var_442.height = Util.getLowestPoint(this.var_442);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_442.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_189.active || this.var_270.active)
         {
            return;
         }
         this.var_1244.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1244.height = this.var_1244.textHeight + 5;
         this.var_1531.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1531.height = this.var_1531.textHeight + 5;
         Util.moveChildrenToColumn(this.var_817,["public_space_name","public_space_desc"],this.var_1244.y,0);
         this.var_817.visible = true;
         this.var_817.height = Math.max(86,Util.getLowestPoint(this.var_817));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_375.active)
         {
            return;
         }
         this.var_2732.text = param1.eventName;
         this.var_818.text = param1.eventDescription;
         this.var_1116.refreshTags(this.var_996,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_818.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_818.height = this.var_818.textHeight + 5;
            this.var_818.y = Util.getLowestPoint(this.var_996) + 2;
            this.var_818.visible = true;
         }
         this.var_996.visible = true;
         this.var_996.height = Util.getLowestPoint(this.var_996);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_189.active || this.var_270.active)
         {
            return;
         }
         this.var_1946.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1533.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this.var_1526.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1530.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1527.visible = Util.hasVisibleChildren(this.var_1527);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_375.active)
         {
            return;
         }
         this.var_1947.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1948.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1945.visible = Util.hasVisibleChildren(this.var_1945);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         if(this.var_443)
         {
            this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details"));
            this._window.setParamFlag(HabboWindowParam.const_63,false);
            this._window.setParamFlag(HabboWindowParam.const_1827,true);
         }
         else
         {
            this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details_framed"));
            this.var_178 = this._window.findChildByName("content") as IWindowContainer;
         }
         this._window.visible = false;
         this.var_315 = IWindowContainer(this.find("room_info"));
         this.var_442 = IWindowContainer(this.find("room_details"));
         this.var_817 = IWindowContainer(this.find("public_space_details"));
         this.var_2731 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2730 = IWindowContainer(this.find("rating_cont"));
         this.var_1527 = IWindowContainer(this.find("room_buttons"));
         this.var_950 = ITextWindow(this.find("room_name"));
         this.var_1244 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_997 = ITextWindow(this.find("room_desc"));
         this.var_1531 = ITextWindow(this.find("public_space_desc"));
         this.var_1247 = ITextWindow(this.find("owner_caption"));
         this.var_998 = ITextWindow(this.find("rating_caption"));
         this.var_1949 = ITextWindow(this.find("rating_txt"));
         this.var_271 = IWindowContainer(this.find("event_info"));
         this.var_996 = IWindowContainer(this.find("event_details"));
         this.var_1945 = IWindowContainer(this.find("event_buttons"));
         this.var_2732 = ITextWindow(this.find("event_name"));
         this.var_818 = ITextWindow(this.find("event_desc"));
         this.var_1528 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1529 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_2727 = this.find("staff_pick_button");
         this.var_1533 = IContainerButtonWindow(this.find("add_favourite_button"));
         this.var_1526 = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1530 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1946 = IButtonWindow(this.find("room_settings_button"));
         this.var_1947 = IButtonWindow(this.find("create_event_button"));
         this.var_1948 = IButtonWindow(this.find("edit_event_button"));
         this.var_999 = IWindowContainer(this.find("embed_info"));
         this.var_1532 = ITextWindow(this.find("embed_info_txt"));
         this.var_1246 = ITextFieldWindow(this.find("embed_src_txt"));
         this._buttons = IWindowContainer(this.find("buttons_container"));
         this.var_1245 = IButtonWindow(this.find("exit_room_button"));
         this.var_995 = IButtonWindow(this.find("zoom_button"));
         Util.setProcDirectly(this.var_1533,this.onAddFavouriteClick);
         Util.setProcDirectly(this.var_1526,this.onRemoveFavouriteClick);
         Util.setProcDirectly(this.var_1946,this.onRoomSettingsClick);
         Util.setProcDirectly(this.var_1530,this.onMakeHomeClick);
         Util.setProcDirectly(this.var_1947,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1948,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1246,this.onEmbedSrcClick);
         Util.setProcDirectly(this.var_1529,this.onThumbUp);
         Util.setProcDirectly(this.var_2727,this.onStaffPick);
         Util.setProcDirectly(this.var_1528,this.onFacebookLike);
         Util.setProcDirectly(this.var_995,this.onZoomClick);
         Util.setProcDirectly(this.var_1245,this.onExitRoomClick);
         this._navigator.refreshButton(this.var_1533,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1526,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1530,"home",true,null,0);
         if(this.var_443)
         {
            this._window.findChildByName("close").procedure = this.onCloseButtonClick;
         }
         else
         {
            this._window.findChildByTag("close").procedure = this.onCloseButtonClick;
         }
         Util.setProcDirectly(this.var_315,this.onHover);
         Util.setProcDirectly(this.var_271,this.onHover);
         this.var_1247.width = this.var_1247.textWidth;
         Util.moveChildrenToRow(this.var_2731,["owner_caption","owner_name"],this.var_1247.x,this.var_1247.y,3);
         this.var_998.width = this.var_998.textWidth;
         Util.moveChildrenToRow(this.var_2730,["rating_caption","rating_txt"],this.var_998.x,this.var_998.y,3);
         this.var_1532.height = this.var_1532.textHeight + 5;
         Util.moveChildrenToColumn(this.var_999,["embed_info_txt","embed_src_txt"],this.var_1532.y,2);
         this.var_999.height = Util.getLowestPoint(this.var_999) + 5;
         this.var_2966 = this._window.y + this._window.height;
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!this._navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function onFacebookLike(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_1246.setSelection(0,this.var_1246.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_37);
         _loc3_.iconId = HabboToolbarIconEnum.ZOOM;
         _loc3_.iconName = "ZOOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onExitRoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_37);
         _loc3_.iconId = HabboToolbarIconEnum.EXITROOM;
         _loc3_.iconName = "EXITROOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onToolbarIconState(param1:HabboToolbarSetIconEvent) : void
      {
         if(param1.type != HabboToolbarSetIconEvent.const_104)
         {
            return;
         }
         switch(param1.iconId)
         {
            case HabboToolbarIconEnum.ZOOM:
               this.var_2728 = param1.iconState;
               this.refreshButtons();
               break;
            case HabboToolbarIconEnum.EXITROOM:
               this.var_2729 = param1.iconState;
               this.refreshButtons();
         }
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         this.var_269.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         if(this.var_443)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_546,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
         else
         {
            this._window.visible = false;
         }
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
      
      public function registerToolbarEvents() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.addEventListener(HabboToolbarSetIconEvent.const_104,this.onToolbarIconState);
         }
      }
      
      public function handleToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type != HabboToolbarEvent.const_37)
         {
            return;
         }
         switch(param1.iconId)
         {
            case HabboToolbarIconEnum.MEMENU:
               if(this.useToolbar)
               {
                  this.close();
               }
               break;
            case HabboToolbarIconEnum.ROOMINFO:
               this.toggle();
         }
      }
      
      public function configure() : void
      {
         if(this._navigator.configuration)
         {
            this.var_443 = this._navigator.configuration.getKey("roominfo.widget.enabled") != "1";
         }
      }
      
      public function get useToolbar() : Boolean
      {
         return this.var_443;
      }
   }
}
