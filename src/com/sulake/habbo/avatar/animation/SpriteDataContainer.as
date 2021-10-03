package com.sulake.habbo.avatar.animation
{
   public class SpriteDataContainer implements ISpriteDataContainer
   {
       
      
      private var var_2625:IAnimation;
      
      private var _id:String;
      
      private var var_1951:int;
      
      private var var_2627:String;
      
      private var var_2626:Boolean;
      
      private var _dx:Array;
      
      private var var_1497:Array;
      
      private var var_1496:Array;
      
      public function SpriteDataContainer(param1:IAnimation, param2:XML)
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         super();
         this.var_2625 = param1;
         this._id = String(param2.@id);
         this.var_1951 = parseInt(param2.@ink);
         this.var_2627 = String(param2.@member);
         this.var_2626 = Boolean(parseInt(param2.@directions));
         this._dx = [];
         this.var_1497 = [];
         this.var_1496 = [];
         for each(_loc3_ in param2.direction)
         {
            _loc4_ = parseInt(_loc3_.@id);
            this._dx[_loc4_] = parseInt(_loc3_.@dx);
            this.var_1497[_loc4_] = parseInt(_loc3_.@dy);
            this.var_1496[_loc4_] = parseInt(_loc3_.@dz);
         }
      }
      
      public function getDirectionOffsetX(param1:int) : int
      {
         if(param1 < this._dx.length)
         {
            return this._dx[param1];
         }
         return 0;
      }
      
      public function getDirectionOffsetY(param1:int) : int
      {
         if(param1 < this.var_1497.length)
         {
            return this.var_1497[param1];
         }
         return 0;
      }
      
      public function getDirectionOffsetZ(param1:int) : int
      {
         if(param1 < this.var_1496.length)
         {
            return this.var_1496[param1];
         }
         return 0;
      }
      
      public function get animation() : IAnimation
      {
         return this.var_2625;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get ink() : int
      {
         return this.var_1951;
      }
      
      public function get member() : String
      {
         return this.var_2627;
      }
      
      public function get hasDirections() : Boolean
      {
         return this.var_2626;
      }
   }
}
