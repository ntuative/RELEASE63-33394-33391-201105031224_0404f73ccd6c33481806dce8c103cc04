package com.sulake.habbo.navigator.roomthumbnails
{
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomThumbnailData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomThumbnailObjectData;
   import com.sulake.habbo.navigator.Util;
   import flash.utils.Dictionary;
   
   public class ThumbnailEditorModel
   {
      
      public static const const_38:int = 1;
      
      public static const const_62:int = 2;
      
      public static const const_36:int = 3;
       
      
      private var var_569:int = 1;
      
      private var _selected:RoomThumbnailObjectData;
      
      private var _data:RoomThumbnailData;
      
      public function ThumbnailEditorModel()
      {
         super();
      }
      
      private function removeSelected() : void
      {
         var _loc1_:Array = this._data.objects;
         if(this._selected == null)
         {
            return;
         }
         var _loc2_:int = Util.remove(_loc1_,this._selected);
         this._selected = null;
         if(_loc1_.length > 0)
         {
            this._selected = _loc1_[Math.min(_loc2_,_loc1_.length - 1)];
         }
      }
      
      private function addObject(param1:int) : void
      {
         Logger.log("New object pos: " + param1);
         var _loc2_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc2_.pos = param1;
         _loc2_.imgId = 0;
         this._data.objects.push(_loc2_);
         this._selected = _loc2_;
         Logger.log("Object count after insert: " + this._data.objects.length);
      }
      
      public function setPos(param1:int) : void
      {
         this._selected = this.findByPos(param1);
         if(this._selected == null)
         {
            this.addObject(param1);
         }
      }
      
      public function setImg(param1:int) : void
      {
         if(this.var_569 == const_38)
         {
            this._data.bgImgId = param1;
         }
         else if(this.var_569 == const_62)
         {
            this._data.frontImgId = param1;
         }
         if(this.var_569 == const_36)
         {
            if(this._selected == null)
            {
               return;
            }
            this._selected.imgId = param1;
         }
      }
      
      public function getImgId() : int
      {
         if(this.var_569 == const_38)
         {
            return this._data.bgImgId;
         }
         if(this.var_569 == const_62)
         {
            return this._data.frontImgId;
         }
         return this._selected == null ? -1 : int(this._selected.imgId);
      }
      
      public function findByPos(param1:int) : RoomThumbnailObjectData
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._data.objects)
         {
            if(_loc2_.pos == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getBlockedPositions() : Dictionary
      {
         var _loc2_:* = null;
         var _loc1_:Dictionary = new Dictionary();
         for each(_loc2_ in this._data.objects)
         {
            if(_loc2_.imgId > 0)
            {
               _loc1_[_loc2_.pos] = "taken";
            }
         }
         return _loc1_;
      }
      
      public function set data(param1:RoomThumbnailData) : void
      {
         this._data = param1;
         this.var_569 = const_38;
         if(this._data.objects.length > 0)
         {
            this._selected = this._data.objects[0];
         }
         else
         {
            this._selected = null;
         }
      }
      
      public function set mode(param1:int) : void
      {
         this.var_569 = param1;
      }
      
      public function set selected(param1:RoomThumbnailObjectData) : void
      {
         this._selected = param1;
      }
      
      public function get mode() : int
      {
         return this.var_569;
      }
      
      public function get selected() : RoomThumbnailObjectData
      {
         return this._selected;
      }
      
      public function get data() : RoomThumbnailData
      {
         return this._data;
      }
   }
}
