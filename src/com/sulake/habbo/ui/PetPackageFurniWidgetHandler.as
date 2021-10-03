package com.sulake.habbo.ui
{
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IPetImageListener;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.pets.IPetData;
   import com.sulake.habbo.avatar.pets.IPetDataListener;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.events.RoomSessionPetPackageEvent;
   import com.sulake.habbo.widget.enums.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetPetPackageUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenPetPackageMessage;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class PetPackageFurniWidgetHandler implements IRoomWidgetHandler, IPetImageListener, IPetDataListener, IGetImageListener
   {
       
      
      private var var_1080:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_196:int = -1;
      
      private var var_1152:int = -1;
      
      private var var_1735:int = -1;
      
      private var _color:String = "";
      
      public function PetPackageFurniWidgetHandler()
      {
         super();
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_602;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         this._container = param1;
      }
      
      public function getWidgetMessages() : Array
      {
         return [RoomWidgetOpenPetPackageMessage.const_703];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         switch(param1.type)
         {
            case RoomWidgetOpenPetPackageMessage.const_703:
               _loc2_ = param1 as RoomWidgetOpenPetPackageMessage;
               if(this._container != null && this._container.roomSession != null)
               {
                  this._container.roomSession.sendOpenPetPackageMessage(_loc2_.objectId,_loc2_.name);
               }
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return [RoomSessionPetPackageEvent.const_600,RoomSessionPetPackageEvent.const_620];
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(this._container != null && this._container.events != null && param1 != null)
         {
            switch(param1.type)
            {
               case RoomSessionPetPackageEvent.const_600:
                  _loc2_ = param1 as RoomSessionPetPackageEvent;
                  this.var_196 = _loc2_.objectId;
                  this.var_1152 = _loc2_.petType;
                  this.var_1735 = _loc2_.breed;
                  this._color = _loc2_.color;
                  _loc4_ = this._container.avatarRenderManager.petDataManager.getPetData(this.var_1152,this);
                  _loc5_ = this.getPetImage();
                  _loc3_ = new RoomWidgetPetPackageUpdateEvent(RoomWidgetPetPackageUpdateEvent.const_509,this.var_196,_loc5_,-1,null);
                  this._container.events.dispatchEvent(_loc3_);
                  break;
               case RoomSessionPetPackageEvent.const_620:
                  _loc2_ = param1 as RoomSessionPetPackageEvent;
                  this.var_196 = _loc2_.objectId;
                  _loc6_ = _loc2_.nameValidationStatus;
                  _loc7_ = _loc2_.nameValidationInfo;
                  _loc3_ = new RoomWidgetPetPackageUpdateEvent(RoomWidgetPetPackageUpdateEvent.const_594,this.var_196,null,_loc6_,_loc7_);
                  this._container.events.dispatchEvent(_loc3_);
            }
         }
      }
      
      public function update() : void
      {
      }
      
      public function dispose() : void
      {
         this.var_1080 = true;
         this._container = null;
         this.var_196 = -1;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1080;
      }
      
      public function petImageReady(param1:String) : void
      {
         var _loc2_:BitmapData = this.getPetImage();
         var _loc3_:RoomWidgetPetPackageUpdateEvent = new RoomWidgetPetPackageUpdateEvent(RoomWidgetPetPackageUpdateEvent.const_375,this.var_196,_loc2_,-1,null);
         this._container.events.dispatchEvent(_loc3_);
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var _loc3_:RoomWidgetPetPackageUpdateEvent = new RoomWidgetPetPackageUpdateEvent(RoomWidgetPetPackageUpdateEvent.const_375,this.var_196,param2,-1,null);
         this._container.events.dispatchEvent(_loc3_);
      }
      
      public function petDataReady() : void
      {
         this.petImageReady("");
      }
      
      private function getPetImage() : BitmapData
      {
         var _loc1_:* = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         if(this.var_1152 < 8)
         {
            _loc1_ = uint(parseInt(this._color,16));
            _loc2_ = this._container.avatarRenderManager.createPetImage(this.var_1152,this.var_1735,_loc1_,AvatarScaleType.const_55,this);
            if(_loc2_ != null)
            {
               return _loc2_.getCroppedImage(AvatarSetType.const_35);
            }
         }
         else
         {
            _loc3_ = 0;
            _loc4_ = this._container.roomEngine.getPetImage(this.var_1152,this.var_1735,new Vector3d(90),64,this,_loc3_);
            if(_loc4_ != null)
            {
               return _loc4_.data;
            }
         }
         return null;
      }
   }
}
