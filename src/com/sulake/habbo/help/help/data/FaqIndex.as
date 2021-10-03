package com.sulake.habbo.help.help.data
{
   import com.sulake.core.utils.Map;
   
   public class FaqIndex
   {
       
      
      private var var_803:FaqCategory;
      
      private var var_802:FaqCategory;
      
      private var var_804:FaqCategory;
      
      private var var_162:Map;
      
      private var _lastUpdatedQuestionId:int;
      
      private var var_2958:int;
      
      public function FaqIndex()
      {
         super();
         this.var_803 = new FaqCategory(-999,"${help.faq.title.urgent}");
         this.var_802 = new FaqCategory(-9999,"${help.faq.title.normal}");
         this.var_804 = new FaqCategory(-99999,"${help.faq.title.searchresults}");
         this.var_162 = new Map();
      }
      
      public function get lastUpdatedQuestionId() : int
      {
         return this._lastUpdatedQuestionId;
      }
      
      public function get lastUpdatedCategoryId() : int
      {
         return this.var_2958;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this.var_162 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_162.length)
            {
               _loc2_ = this.var_162.getWithIndex(_loc1_);
               _loc2_.dispose();
               _loc1_++;
            }
            this.var_162.dispose();
            this.var_162 = null;
         }
         this.var_803.dispose();
         this.var_802.dispose();
         this.var_804.dispose();
      }
      
      public function getCategory(param1:int, param2:String = null, param3:Boolean = false) : FaqCategory
      {
         var _loc4_:FaqCategory = this.var_162.getValue(param1);
         if(_loc4_ != null || !param3)
         {
            return _loc4_;
         }
         _loc4_ = new FaqCategory(param1,param2);
         this.var_162.add(param1,_loc4_);
         return _loc4_;
      }
      
      public function getItem(param1:int, param2:int = -1) : FaqItem
      {
         if(param2 < 0)
         {
            return this.findItem(param1);
         }
         var _loc3_:FaqCategory = this.getCategory(param2);
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_.getItem(param1);
      }
      
      public function storeAnswerText(param1:int, param2:String) : void
      {
         var _loc4_:* = null;
         if(this.var_803.hasItem(param1))
         {
            this.var_803.getItem(param1).answerText = param2;
         }
         if(this.var_802.hasItem(param1))
         {
            this.var_802.getItem(param1).answerText = param2;
         }
         if(this.var_804.hasItem(param1))
         {
            this.var_804.getItem(param1).answerText = param2;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.var_162.length)
         {
            _loc4_ = this.var_162.getWithIndex(_loc3_);
            if(_loc4_.hasItem(param1))
            {
               _loc4_.getItem(param1).answerText = param2;
            }
            _loc3_++;
         }
      }
      
      public function getFrontPageUrgentCategory() : FaqCategory
      {
         return this.var_803;
      }
      
      public function getFrontPageNormalCategory() : FaqCategory
      {
         return this.var_802;
      }
      
      public function getSearchResultCategory() : FaqCategory
      {
         return this.var_804;
      }
      
      public function getCategoryCount() : int
      {
         return this.var_162.length;
      }
      
      public function getCategoryByIndex(param1:int) : FaqCategory
      {
         if(param1 >= this.var_162.length)
         {
            return null;
         }
         return this.var_162.getWithIndex(param1);
      }
      
      public function getCategoryTitleArray() : Array
      {
         var _loc2_:* = null;
         var _loc1_:Array = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < this.var_162.length)
         {
            _loc2_ = this.var_162.getWithIndex(_loc3_);
            if(_loc2_ != null)
            {
               _loc1_.push(_loc2_.categoryTitle);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      private function findItem(param1:int) : FaqItem
      {
         var _loc3_:* = null;
         if(this.var_803.hasItem(param1))
         {
            return this.var_803.getItem(param1);
         }
         if(this.var_802.hasItem(param1))
         {
            return this.var_802.getItem(param1);
         }
         if(this.var_804.hasItem(param1))
         {
            return this.var_804.getItem(param1);
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.var_162.length)
         {
            _loc3_ = this.var_162.getWithIndex(_loc2_);
            if(_loc3_.hasItem(param1))
            {
               return _loc3_.getItem(param1);
            }
            _loc2_++;
         }
         return null;
      }
   }
}
