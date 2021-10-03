package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1654:int;
      
      private var var_1371:int;
      
      private var var_2194:int;
      
      private var var_2195:int;
      
      private var var_2192:int;
      
      private var _energy:int;
      
      private var var_2191:int;
      
      private var _nutrition:int;
      
      private var var_2198:int;
      
      private var var_2199:int;
      
      private var _ownerName:String;
      
      private var var_2215:int;
      
      private var var_545:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1654;
      }
      
      public function get level() : int
      {
         return this.var_1371;
      }
      
      public function get levelMax() : int
      {
         return this.var_2194;
      }
      
      public function get experience() : int
      {
         return this.var_2195;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2192;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2191;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2198;
      }
      
      public function get ownerId() : int
      {
         return this.var_2199;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2215;
      }
      
      public function get age() : int
      {
         return this.var_545;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1654 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1371 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2194 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2195 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2192 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2191 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2198 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2199 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2215 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_545 = param1;
      }
   }
}
