package com.sulake.habbo.room.object
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomPlaneBitmapMaskData
   {
      
      public static const const_505:String = "window";
      
      public static const const_283:String = "hole";
       
      
      private var var_90:Vector3d = null;
      
      private var _type:String = null;
      
      private var _category:String = null;
      
      public function RoomPlaneBitmapMaskData(param1:String, param2:IVector3d, param3:String)
      {
         super();
         this.type = param1;
         this.loc = param2;
         this.category = param3;
      }
      
      public function get loc() : IVector3d
      {
         return this.var_90;
      }
      
      public function set loc(param1:IVector3d) : void
      {
         if(this.var_90 == null)
         {
            this.var_90 = new Vector3d();
         }
         this.var_90.assign(param1);
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function set category(param1:String) : void
      {
         this._category = param1;
      }
      
      public function dispose() : void
      {
         this.var_90 = null;
      }
   }
}
