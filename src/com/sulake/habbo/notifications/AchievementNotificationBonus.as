package com.sulake.habbo.notifications
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class AchievementNotificationBonus
   {
       
      
      private var _window:IFrameWindow;
      
      private var var_60:IHabboLocalizationManager;
      
      private var _assets:IAssetLibrary;
      
      private const const_2122:String = "achievement_bg_001_png";
      
      public function AchievementNotificationBonus(param1:int, param2:String, param3:IAssetLibrary, param4:IHabboWindowManager, param5:IHabboLocalizationManager)
      {
         super();
         if(!param3 || !param4 || !param5)
         {
            return;
         }
         this._assets = param3;
         this.var_60 = param5;
         var _loc6_:XmlAsset = param3.getAssetByName("achievement_notification_bonus_xml") as XmlAsset;
         if(_loc6_ == null)
         {
            return;
         }
         this._window = param4.buildFromXML(_loc6_.content as XML) as IFrameWindow;
         if(this._window == null)
         {
            return;
         }
         this._window.procedure = this.eventHandler;
         this._window.center();
         this.setText("bonus_points","+" + String(param1));
         if(param2 && param2 != "")
         {
            this.var_60.registerParameter("notifications.achievement.bonus_received.name","realname",param2);
            this.setText("bonus_info",this.var_60.getKey("notifications.achievement.bonus_received.name"));
         }
         var _loc7_:BitmapData = (param3.getAssetByName(this.const_2122) as BitmapDataAsset).content as BitmapData;
         var _loc8_:IBitmapWrapperWindow = this._window.findChildByName("achievement_bg") as IBitmapWrapperWindow;
         _loc8_.bitmap = new BitmapData(_loc8_.width,_loc8_.height,true,0);
         _loc8_.bitmap.copyPixels(_loc7_,_loc7_.rect,new Point(0,_loc8_.height - _loc7_.height),null,null,true);
         this._window.header.controls.visible = false;
      }
      
      public function dispose() : void
      {
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         this.var_60 = null;
         this._assets = null;
      }
      
      private function setText(param1:String, param2:String) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc3_:ITextWindow = this._window.findChildByName(param1) as ITextWindow;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.text = param2;
      }
      
      private function setImage(param1:String, param2:BitmapData) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByName(param1) as IBitmapWrapperWindow;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.bitmap = param2;
      }
      
      private function eventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "close":
               this.dispose();
               return;
            default:
               return;
         }
      }
   }
}
