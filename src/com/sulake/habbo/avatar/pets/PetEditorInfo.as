package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_2808:Boolean;
      
      private var var_2182:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         this.var_2808 = Boolean(parseInt(param1.@club));
         this.var_2182 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return this.var_2808;
      }
      
      public function get isSelectable() : Boolean
      {
         return this.var_2182;
      }
   }
}
