package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_424:int = 1;
      
      public static const const_255:int = 2;
      
      public static const const_318:int = 3;
      
      public static const const_409:int = 4;
      
      public static const const_282:int = 5;
      
      public static const const_399:int = 1;
      
      public static const const_972:int = 2;
      
      public static const const_884:int = 3;
      
      public static const const_945:int = 4;
      
      public static const const_270:int = 5;
      
      public static const const_779:int = 6;
      
      public static const const_930:int = 7;
      
      public static const const_276:int = 8;
      
      public static const const_431:int = 9;
      
      public static const const_2094:int = 10;
      
      public static const const_980:int = 11;
      
      public static const const_643:int = 12;
       
      
      private var var_429:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_429 = new Array();
         this.var_429.push(new Tab(this._navigator,const_424,const_643,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_525));
         this.var_429.push(new Tab(this._navigator,const_255,const_399,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_525));
         this.var_429.push(new Tab(this._navigator,const_409,const_980,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1303));
         this.var_429.push(new Tab(this._navigator,const_318,const_270,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_525));
         this.var_429.push(new Tab(this._navigator,const_282,const_276,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_823));
         this.setSelectedTab(const_424);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_409;
      }
      
      public function get tabs() : Array
      {
         return this.var_429;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_429)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_429)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_429)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
