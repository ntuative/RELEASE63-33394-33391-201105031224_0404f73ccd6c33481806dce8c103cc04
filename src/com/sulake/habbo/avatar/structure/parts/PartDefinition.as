package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2352:String;
      
      private var var_1721:String;
      
      private var var_2351:String;
      
      private var var_1722:Boolean;
      
      private var var_1723:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2352 = String(param1["set-type"]);
         this.var_1721 = String(param1["flipped-set-type"]);
         this.var_2351 = String(param1["remove-set-type"]);
         this.var_1722 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1723 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1723;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1723 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2352;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1721;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2351;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1722;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1722 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1721 = param1;
      }
   }
}
