package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1654:int;
      
      private var _name:String;
      
      private var var_1371:int;
      
      private var var_2217:int;
      
      private var var_2195:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_672:String;
      
      private var var_2214:int;
      
      private var var_2218:int;
      
      private var var_2216:int;
      
      private var var_2215:int;
      
      private var var_2199:int;
      
      private var _ownerName:String;
      
      private var var_545:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1654;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1371;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2217;
      }
      
      public function get experience() : int
      {
         return this.var_2195;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_672;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2214;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2218;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2216;
      }
      
      public function get respect() : int
      {
         return this.var_2215;
      }
      
      public function get ownerId() : int
      {
         return this.var_2199;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_545;
      }
      
      public function flush() : Boolean
      {
         this.var_1654 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1654 = param1.readInteger();
         this._name = param1.readString();
         this.var_1371 = param1.readInteger();
         this.var_2217 = param1.readInteger();
         this.var_2195 = param1.readInteger();
         this.var_2214 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2218 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2216 = param1.readInteger();
         this.var_672 = param1.readString();
         this.var_2215 = param1.readInteger();
         this.var_2199 = param1.readInteger();
         this.var_545 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
