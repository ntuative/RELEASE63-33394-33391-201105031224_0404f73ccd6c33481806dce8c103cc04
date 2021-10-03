package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_754;
         param1["bitmap"] = const_847;
         param1["border"] = const_715;
         param1["border_notify"] = const_1808;
         param1["button"] = const_511;
         param1["button_thick"] = const_768;
         param1["button_icon"] = const_1784;
         param1["button_group_left"] = const_835;
         param1["button_group_center"] = const_808;
         param1["button_group_right"] = const_929;
         param1["canvas"] = const_878;
         param1["checkbox"] = const_733;
         param1["closebutton"] = const_1203;
         param1["container"] = const_405;
         param1["container_button"] = const_968;
         param1["display_object_wrapper"] = const_910;
         param1["dropmenu"] = const_614;
         param1["dropmenu_item"] = const_552;
         param1["frame"] = const_437;
         param1["frame_notify"] = const_1633;
         param1["header"] = const_809;
         param1["html"] = const_1173;
         param1["icon"] = const_1176;
         param1["itemgrid"] = const_1298;
         param1["itemgrid_horizontal"] = const_573;
         param1["itemgrid_vertical"] = const_832;
         param1["itemlist"] = const_1292;
         param1["itemlist_horizontal"] = const_397;
         param1["itemlist_vertical"] = const_391;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1607;
         param1["menu"] = const_1594;
         param1["menu_item"] = const_1629;
         param1["submenu"] = const_1278;
         param1["minimizebox"] = const_1674;
         param1["notify"] = const_1611;
         param1["null"] = const_735;
         param1["password"] = const_802;
         param1["radiobutton"] = const_827;
         param1["region"] = const_646;
         param1["restorebox"] = const_1548;
         param1["scaler"] = const_631;
         param1["scaler_horizontal"] = const_1741;
         param1["scaler_vertical"] = const_1767;
         param1["scrollbar_horizontal"] = const_647;
         param1["scrollbar_vertical"] = const_881;
         param1["scrollbar_slider_button_up"] = const_1269;
         param1["scrollbar_slider_button_down"] = const_1093;
         param1["scrollbar_slider_button_left"] = const_1189;
         param1["scrollbar_slider_button_right"] = const_1307;
         param1["scrollbar_slider_bar_horizontal"] = const_1138;
         param1["scrollbar_slider_bar_vertical"] = const_1117;
         param1["scrollbar_slider_track_horizontal"] = const_1100;
         param1["scrollbar_slider_track_vertical"] = const_1090;
         param1["scrollable_itemlist"] = const_1556;
         param1["scrollable_itemlist_vertical"] = const_629;
         param1["scrollable_itemlist_horizontal"] = const_1086;
         param1["selector"] = const_787;
         param1["selector_list"] = const_692;
         param1["submenu"] = const_1278;
         param1["tab_button"] = const_964;
         param1["tab_container_button"] = const_1085;
         param1["tab_context"] = const_411;
         param1["tab_content"] = const_1224;
         param1["tab_selector"] = const_804;
         param1["text"] = const_570;
         param1["input"] = const_813;
         param1["toolbar"] = const_1656;
         param1["tooltip"] = const_447;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
