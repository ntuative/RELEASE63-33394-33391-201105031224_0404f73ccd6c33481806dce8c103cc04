package com.sulake.habbo.inventory.recycler
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.inventory.items.IItem;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class RecyclerModel implements IInventoryModel
   {
      
      public static const name_4:uint = 0;
      
      public static const STATE_ACTIVE:uint = 1;
       
      
      private var _inventory:HabboInventory;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _roomEngine:IRoomEngine;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var _disposed:Boolean = false;
      
      private var var_735:Boolean = false;
      
      private var _state:uint = 0;
      
      private var _itemList:Map;
      
      public function RecyclerModel(param1:HabboInventory, param2:IHabboWindowManager, param3:IHabboCommunicationManager, param4:IAssetLibrary, param5:IRoomEngine, param6:IHabboLocalizationManager)
      {
         super();
         this._inventory = param1;
         this._communication = param3;
         this._assetLibrary = param4;
         this._roomEngine = param5;
         this._localization = param6;
      }
      
      public function get running() : Boolean
      {
         return this._state == STATE_ACTIVE;
      }
      
      public function get state() : uint
      {
         return this._state;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function set state(param1:uint) : void
      {
         this._state = param1;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._inventory = null;
            this._communication = null;
            this._assetLibrary = null;
            this._roomEngine = null;
            this._localization = null;
            this._disposed = true;
         }
         this.stopRecycler();
      }
      
      public function startRecycler() : void
      {
         if(this._inventory == null || this._inventory.furniModel == null)
         {
            return;
         }
         this._state = STATE_ACTIVE;
         this._itemList = new Map();
         this._inventory.furniModel.showRecyclable(true);
      }
      
      public function stopRecycler() : void
      {
         var _loc2_:int = 0;
         if(this._itemList == null || this._inventory == null || this._inventory.furniModel == null)
         {
            return;
         }
         this._state = name_4;
         this._inventory.furniModel.showRecyclable(false);
         var _loc1_:int = 0;
         while(_loc1_ < this._itemList.length)
         {
            _loc2_ = this._itemList.getKey(_loc1_);
            this._inventory.furniModel.removeLockFrom(_loc2_);
            _loc1_++;
         }
         this._itemList = null;
      }
      
      public function lockSelectedFurni() : int
      {
         if(this._itemList == null || this._inventory == null || this._inventory.furniModel == null)
         {
            return 0;
         }
         var _loc1_:IItem = this._inventory.furniModel.requestSelectedFurniToRecycler();
         if(_loc1_ == null)
         {
            return 0;
         }
         if(this._itemList.getValue(_loc1_.id) == null)
         {
            this._itemList.add(_loc1_.id,_loc1_);
         }
         return _loc1_.id;
      }
      
      public function releaseFurni(param1:int) : Boolean
      {
         if(this._itemList == null)
         {
            return true;
         }
         var _loc2_:IItem = this._itemList.getValue(param1);
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc3_:FurniModel = this._inventory.furniModel;
         if(_loc3_ == null)
         {
            return false;
         }
         _loc3_.removeLockFrom(param1);
         this._itemList.remove(param1);
         return true;
      }
      
      public function getOwnItemsInRecycler() : Array
      {
         var _loc1_:Array = new Array();
         if(this._itemList == null)
         {
            return [];
         }
         var _loc2_:int = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc1_.push(this._itemList.getKey(_loc2_));
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function closingInventoryView() : void
      {
      }
      
      public function requestInitialization(param1:int = 0) : void
      {
      }
      
      public function categorySwitch(param1:String) : void
      {
      }
      
      public function subCategorySwitch(param1:String) : void
      {
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return null;
      }
   }
}
