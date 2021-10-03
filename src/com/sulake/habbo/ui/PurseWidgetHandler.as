package com.sulake.habbo.ui
{
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.catalog.purse.IPurse;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.purse.PurseEvent;
   import com.sulake.habbo.widget.enums.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetPurseUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetGetPurseData;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenCatalogMessage;
   import flash.events.Event;
   
   public class PurseWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _disposed:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      public function PurseWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._container.catalog.events.removeEventListener(PurseEvent.const_68,this.purseEventHandler);
            this._container.catalog.events.removeEventListener(PurseEvent.const_114,this.purseEventHandler);
            this._container = null;
            this._disposed = true;
         }
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_421;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         this._container = param1;
         if(this._container.catalog)
         {
            this._container.catalog.events.addEventListener(PurseEvent.const_68,this.purseEventHandler);
            this._container.catalog.events.addEventListener(PurseEvent.const_114,this.purseEventHandler);
         }
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomWidgetGetPurseData.const_974);
         _loc1_.push(RoomWidgetOpenCatalogMessage.const_441);
         return _loc1_;
      }
      
      public function getProcessedEvents() : Array
      {
         return [];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!param1)
         {
            return null;
         }
         switch(param1.type)
         {
            case RoomWidgetGetPurseData.const_974:
               _loc2_ = this._container.catalog.getPurse();
               this._container.events.dispatchEvent(new RoomWidgetPurseUpdateEvent(RoomWidgetPurseUpdateEvent.const_68,_loc2_.credits));
               this._container.events.dispatchEvent(new RoomWidgetPurseUpdateEvent(RoomWidgetPurseUpdateEvent.const_114,_loc2_.getActivityPointsForType(Purse.const_220)));
               break;
            case RoomWidgetOpenCatalogMessage.const_441:
               _loc3_ = param1 as RoomWidgetOpenCatalogMessage;
               if(this._container.catalog != null)
               {
                  switch(_loc3_.pageKey)
                  {
                     case RoomWidgetOpenCatalogMessage.const_1107:
                        this._container.catalog.openCatalogPage(CatalogPageName.const_1666);
                        break;
                     case RoomWidgetOpenCatalogMessage.const_1217:
                        this._container.catalog.openCreditsHabblet();
                  }
               }
               break;
            default:
               Logger.log(param1.type);
         }
         return null;
      }
      
      private function purseEventHandler(param1:PurseEvent) : void
      {
         var _loc2_:* = null;
         switch(param1.type)
         {
            case PurseEvent.const_68:
               _loc2_ = new RoomWidgetPurseUpdateEvent(RoomWidgetPurseUpdateEvent.const_68,param1.balance);
               break;
            case PurseEvent.const_114:
               _loc2_ = new RoomWidgetPurseUpdateEvent(RoomWidgetPurseUpdateEvent.const_114,param1.balance);
         }
         if(_loc2_)
         {
            this._container.events.dispatchEvent(_loc2_);
         }
      }
      
      public function processEvent(param1:Event) : void
      {
      }
      
      public function update() : void
      {
      }
   }
}
