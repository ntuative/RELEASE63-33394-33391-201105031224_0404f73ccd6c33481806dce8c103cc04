package com.sulake.habbo.avatar.geometry
{
   import flash.utils.Dictionary;
   
   public class AvatarSet
   {
       
      
      private var _id:String;
      
      private var var_1274:Dictionary;
      
      private var var_2006:Array;
      
      private var var_2789:Array;
      
      private var var_2648:Boolean;
      
      public function AvatarSet(param1:XML)
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         super();
         this._id = String(param1.@id);
         var _loc2_:String = String(param1.@main);
         this.var_2648 = _loc2_ == null ? false : Boolean(Boolean(parseInt(_loc2_)));
         this.var_1274 = new Dictionary();
         this.var_2006 = new Array();
         for each(_loc4_ in param1.avatarset)
         {
            _loc3_ = new AvatarSet(_loc4_);
            this.var_1274[String(_loc4_.@id)] = _loc3_;
         }
         for each(_loc5_ in param1.bodypart)
         {
            this.var_2006.push(String(_loc5_.@id));
         }
         _loc6_ = this.var_2006.concat();
         for each(_loc3_ in this.var_1274)
         {
            _loc6_ = _loc6_.concat(_loc3_.getBodyParts());
         }
         this.var_2789 = _loc6_;
      }
      
      public function findAvatarSet(param1:String) : AvatarSet
      {
         var _loc2_:* = null;
         if(param1 == this._id)
         {
            return this;
         }
         for each(_loc2_ in this.var_1274)
         {
            if(_loc2_.findAvatarSet(param1) != null)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getBodyParts() : Array
      {
         return this.var_2789.concat();
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get isMain() : Boolean
      {
         var _loc1_:* = null;
         if(this.var_2648)
         {
            return true;
         }
         for each(_loc1_ in this.var_1274)
         {
            if(_loc1_.isMain)
            {
               return true;
            }
         }
         return false;
      }
   }
}
