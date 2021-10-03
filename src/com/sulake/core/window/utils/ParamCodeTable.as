package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_212;
         param1["bound_to_parent_rect"] = const_103;
         param1["child_window"] = const_1149;
         param1["embedded_controller"] = const_1254;
         param1["resize_to_accommodate_children"] = WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN;
         param1["input_event_processor"] = const_31;
         param1["internal_event_handling"] = const_801;
         param1["mouse_dragging_target"] = const_293;
         param1["mouse_dragging_trigger"] = const_398;
         param1["mouse_scaling_target"] = const_332;
         param1["mouse_scaling_trigger"] = const_559;
         param1["horizontal_mouse_scaling_trigger"] = const_289;
         param1["vertical_mouse_scaling_trigger"] = const_245;
         param1["observe_parent_input_events"] = const_1314;
         param1["optimize_region_to_layout_size"] = const_619;
         param1["parent_window"] = const_1104;
         param1["relative_horizontal_scale_center"] = const_226;
         param1["relative_horizontal_scale_fixed"] = const_146;
         param1["relative_horizontal_scale_move"] = const_433;
         param1["relative_horizontal_scale_strech"] = const_432;
         param1["relative_scale_center"] = const_1215;
         param1["relative_scale_fixed"] = const_877;
         param1["relative_scale_move"] = const_1312;
         param1["relative_scale_strech"] = const_1167;
         param1["relative_vertical_scale_center"] = const_203;
         param1["relative_vertical_scale_fixed"] = const_160;
         param1["relative_vertical_scale_move"] = const_249;
         param1["relative_vertical_scale_strech"] = const_339;
         param1["on_resize_align_left"] = const_861;
         param1["on_resize_align_right"] = const_471;
         param1["on_resize_align_center"] = const_551;
         param1["on_resize_align_top"] = const_750;
         param1["on_resize_align_bottom"] = const_503;
         param1["on_resize_align_middle"] = const_634;
         param1["on_accommodate_align_left"] = const_1121;
         param1["on_accommodate_align_right"] = const_487;
         param1["on_accommodate_align_center"] = const_766;
         param1["on_accommodate_align_top"] = const_1272;
         param1["on_accommodate_align_bottom"] = const_481;
         param1["on_accommodate_align_middle"] = const_954;
         param1["route_input_events_to_parent"] = const_639;
         param1["use_parent_graphic_context"] = const_34;
         param1["draggable_with_mouse"] = const_1252;
         param1["scalable_with_mouse"] = const_1249;
         param1["reflect_horizontal_resize_to_parent"] = const_635;
         param1["reflect_vertical_resize_to_parent"] = const_592;
         param1["reflect_resize_to_parent"] = const_340;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1187;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
