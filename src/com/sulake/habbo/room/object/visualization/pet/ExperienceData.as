package com.sulake.habbo.room.object.visualization.pet
{
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class ExperienceData
   {
       
      
      private var var_86:BitmapData;
      
      private var var_2870:Boolean;
      
      private var _copy:BitmapData;
      
      private var var_2909:int = -1;
      
      private var var_2290:int;
      
      public function ExperienceData(param1:BitmapData, param2:Boolean = true)
      {
         super();
         this.var_86 = param1;
         this.var_2870 = param2;
         if(this.var_86 != null)
         {
            this._copy = this.var_86.clone();
         }
         this.setExperience(0);
      }
      
      public function dispose() : void
      {
         if(this._copy)
         {
            this._copy.dispose();
            this._copy = null;
         }
         if(this.var_86 != null)
         {
            if(this.var_2870)
            {
               this.var_86.dispose();
            }
            this.var_86 = null;
         }
      }
      
      public function get alpha() : int
      {
         return this.var_2290;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2290 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_86;
      }
      
      public function setExperience(param1:int) : void
      {
         if(this.var_2909 == param1 || this.var_86 == null)
         {
            return;
         }
         this.var_86.copyPixels(this._copy,this._copy.rect,new Point(0,0));
         var _loc2_:TextFormat = new TextFormat();
         _loc2_.font = "Volter";
         _loc2_.color = 16777215;
         _loc2_.size = 9;
         var _loc3_:TextField = new TextField();
         _loc3_.embedFonts = true;
         _loc3_.width = 30;
         _loc3_.height = 12;
         _loc3_.background = true;
         _loc3_.backgroundColor = 3871388928;
         _loc3_.defaultTextFormat = _loc2_;
         _loc3_.text = "+" + param1;
         var _loc4_:Matrix = new Matrix();
         _loc4_.translate(15,19);
         this.var_86.draw(_loc3_,_loc4_);
      }
   }
}
