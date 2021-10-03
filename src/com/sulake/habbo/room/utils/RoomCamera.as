package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_1448:Number = 12;
       
      
      private var var_2701:int = -1;
      
      private var var_2707:int = -2;
      
      private var var_211:Vector3d = null;
      
      private var var_1222:Number = 0;
      
      private var var_1515:Number = 0;
      
      private var var_1924:Boolean = false;
      
      private var var_188:Vector3d = null;
      
      private var var_1927:Vector3d;
      
      private var var_2710:Boolean = false;
      
      private var var_2703:Boolean = false;
      
      private var var_2709:Boolean = false;
      
      private var var_2704:Boolean = false;
      
      private var var_2708:int = 0;
      
      private var var_2706:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2705:int = 0;
      
      private var var_2702:int = 0;
      
      private var var_1706:int = -1;
      
      private var var_1925:int = 0;
      
      private var var_1926:Boolean = false;
      
      public function RoomCamera()
      {
         this.var_1927 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_188;
      }
      
      public function get targetId() : int
      {
         return this.var_2701;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2707;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_1927;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2710;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2703;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2709;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2704;
      }
      
      public function get screenWd() : int
      {
         return this.var_2708;
      }
      
      public function get screenHt() : int
      {
         return this.var_2706;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2705;
      }
      
      public function get roomHt() : int
      {
         return this.var_2702;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1706;
      }
      
      public function get isMoving() : Boolean
      {
         if(this.var_211 != null && this.var_188 != null)
         {
            return true;
         }
         return false;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2701 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_1927.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2707 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2710 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2703 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2709 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2704 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2708 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2706 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         if(this._scale != param1)
         {
            this._scale = param1;
            this.var_1926 = true;
         }
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2705 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2702 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1706 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         var _loc2_:* = null;
         if(this.var_211 == null)
         {
            this.var_211 = new Vector3d();
         }
         if(this.var_211.x != param1.x || this.var_211.y != param1.y || this.var_211.z != param1.z)
         {
            this.var_211.assign(param1);
            this.var_1925 = 0;
            _loc2_ = Vector3d.dif(this.var_211,this.var_188);
            this.var_1222 = _loc2_.length;
            this.var_1924 = true;
         }
      }
      
      public function dispose() : void
      {
         this.var_211 = null;
         this.var_188 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_188 != null)
         {
            return;
         }
         this.var_188 = new Vector3d();
         this.var_188.assign(param1);
      }
      
      public function resetLocation(param1:IVector3d) : void
      {
         if(this.var_188 == null)
         {
            this.var_188 = new Vector3d();
         }
         this.var_188.assign(param1);
      }
      
      public function update(param1:uint, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.var_211 != null && this.var_188 != null)
         {
            ++this.var_1925;
            if(this.var_1926)
            {
               this.var_1926 = false;
               this.var_188 = this.var_211;
               this.var_211 = null;
               return;
            }
            _loc3_ = Vector3d.dif(this.var_211,this.var_188);
            if(_loc3_.length > this.var_1222)
            {
               this.var_1222 = _loc3_.length;
            }
            if(_loc3_.length <= param2)
            {
               this.var_188 = this.var_211;
               this.var_211 = null;
               this.var_1515 = 0;
            }
            else
            {
               _loc4_ = Math.sin(0 * _loc3_.length / this.var_1222);
               _loc5_ = param2 * 0.5;
               _loc6_ = this.var_1222 / const_1448;
               _loc7_ = _loc5_ + (_loc6_ - _loc5_) * _loc4_;
               if(this.var_1924)
               {
                  if(_loc7_ < this.var_1515)
                  {
                     _loc7_ = this.var_1515;
                     if(_loc7_ > _loc3_.length)
                     {
                        _loc7_ = _loc3_.length;
                     }
                  }
                  else
                  {
                     this.var_1924 = false;
                  }
               }
               this.var_1515 = _loc7_;
               _loc3_.div(_loc3_.length);
               _loc3_.mul(_loc7_);
               this.var_188 = Vector3d.sum(this.var_188,_loc3_);
            }
         }
      }
   }
}
