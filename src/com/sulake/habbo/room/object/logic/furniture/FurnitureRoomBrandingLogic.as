package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomAdUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.widget.enums.RoomWidgetInfostandExtraParamEnum;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class FurnitureRoomBrandingLogic extends FurnitureLogic
   {
      
      public static const const_1678:String = "state";
      
      public static const const_1277:String = "imageUrl";
      
      public static const const_1259:String = "clickUrl";
       
      
      protected var var_2915:Boolean;
      
      protected var var_1612:Boolean;
      
      public function FurnitureRoomBrandingLogic()
      {
         super();
         this.var_2915 = true;
         this.var_1612 = false;
      }
      
      override public function initialize(param1:XML) : void
      {
         super.initialize(param1);
         if(this.var_2915)
         {
            object.getModelController().setNumber(RoomObjectVariableEnum.const_1246,1);
         }
      }
      
      override public function getEventTypes() : Array
      {
         var _loc1_:Array = [RoomObjectRoomAdEvent.const_172];
         return getAllEventTypes(super.getEventTypes(),_loc1_);
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc2_:* = null;
         super.processUpdateMessage(param1);
         if(param1 is RoomObjectDataUpdateMessage)
         {
            this.setupImageFromFurnitureData();
         }
         if(param1 is RoomObjectRoomAdUpdateMessage)
         {
            _loc2_ = param1 as RoomObjectRoomAdUpdateMessage;
            switch(_loc2_.type)
            {
               case RoomObjectRoomAdUpdateMessage.const_1158:
                  object.getModelController().setNumber(RoomObjectVariableEnum.const_613,1,false);
                  break;
               case RoomObjectRoomAdUpdateMessage.const_1136:
                  object.getModelController().setNumber(RoomObjectVariableEnum.const_613,-1);
                  Logger.log("failed to load billboard image from url " + object.getModelController().getString(RoomObjectVariableEnum.const_306));
            }
         }
      }
      
      private function setupImageFromFurnitureData() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:Number = NaN;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc1_:Boolean = false;
         if(object != null)
         {
            _loc2_ = object.getModel().getString(RoomObjectVariableEnum.const_95);
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.split("\t");
               if(_loc3_ != null)
               {
                  for each(_loc7_ in _loc3_)
                  {
                     _loc8_ = _loc7_.split("=",2);
                     if(!(_loc8_ != null && _loc8_.length == 2))
                     {
                        continue;
                     }
                     _loc9_ = _loc8_[0];
                     _loc10_ = _loc8_[1];
                     switch(_loc9_)
                     {
                        case const_1678:
                           _loc11_ = parseInt(_loc10_);
                           if(!isNaN(_loc11_))
                           {
                              _loc14_ = int(_loc11_);
                              if(object.getState(0) != _loc14_)
                              {
                                 object.setState(_loc14_,0);
                                 _loc1_ = true;
                              }
                           }
                           break;
                        case const_1277:
                           _loc12_ = object.getModelController().getString(RoomObjectVariableEnum.const_306);
                           if(_loc12_ == null || _loc12_ != _loc10_)
                           {
                              object.getModelController().setString(RoomObjectVariableEnum.const_306,_loc10_,false);
                              object.getModelController().setNumber(RoomObjectVariableEnum.const_613,0,false);
                              _loc1_ = true;
                           }
                           break;
                        case const_1259:
                           _loc13_ = object.getModelController().getString(RoomObjectVariableEnum.const_392);
                           if(_loc13_ == null || _loc13_ != _loc10_)
                           {
                              object.getModelController().setString(RoomObjectVariableEnum.const_392,_loc10_);
                              _loc1_ = true;
                           }
                           break;
                     }
                  }
               }
               _loc4_ = object.getModelController().getString(RoomObjectVariableEnum.const_306);
               _loc5_ = object.getModelController().getString(RoomObjectVariableEnum.const_392);
               if(_loc4_ != null)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_172,object.getId(),object.getType(),_loc4_,_loc5_));
               }
               _loc6_ = const_1277 + "=" + (_loc4_ != null ? _loc4_ : "") + "\t";
               if(this.var_1612)
               {
                  _loc6_ += const_1259 + "=" + (_loc5_ != null ? _loc5_ : "") + "\t";
               }
               object.getModelController().setString(RoomWidgetInfostandExtraParamEnum.const_426,RoomWidgetInfostandExtraParamEnum.const_1241 + _loc6_);
            }
         }
         return _loc1_;
      }
   }
}
