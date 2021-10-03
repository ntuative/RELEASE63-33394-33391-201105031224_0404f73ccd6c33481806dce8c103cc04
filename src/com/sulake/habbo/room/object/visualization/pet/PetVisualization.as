package com.sulake.habbo.room.object.visualization.pet
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IPetImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class PetVisualization extends RoomObjectSpriteVisualization implements IPetImageListener
   {
      
      private static const const_1001:int = 2;
      
      private static const const_1337:Array = [0,0,0];
       
      
      private var var_593:PetVisualizationData = null;
      
      private var var_501:Map;
      
      private var var_1133:int = 0;
      
      private var var_580:int = 0;
      
      private var var_907:Boolean;
      
      private var var_672:String;
      
      private var var_1134:int = 0;
      
      private var _updateTimes:Array;
      
      private var var_592:BitmapDataAsset;
      
      private var var_381:ExperienceData;
      
      private var var_1080:Boolean = false;
      
      private var var_1728:Boolean = false;
      
      private const const_2129:int = 3;
      
      private var var_1706:int = -1;
      
      private const const_1002:int = 0;
      
      private const const_1862:int = 1;
      
      private const const_1858:int = 2;
      
      private const const_1338:int = 3;
      
      private var var_58:IAvatarImage = null;
      
      private var var_246:String = "";
      
      private var _postureParameter:String = "";
      
      private var var_1673:Boolean = false;
      
      private var var_1378:Boolean = false;
      
      private var var_1668:Boolean = false;
      
      private var var_1108:Boolean = false;
      
      private var var_1729:Boolean = false;
      
      private var var_1379:String = "";
      
      private var var_1415:int = 0;
      
      private var var_2195:int = 0;
      
      private var var_1671:Number = NaN;
      
      private var var_1667:int = -1;
      
      private var var_1669:int = -1;
      
      public function PetVisualization()
      {
         super();
         this._updateTimes = new Array();
         this.var_501 = new Map();
         this.var_907 = false;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1080;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.dispose();
         if(this.var_501 != null)
         {
            _loc1_ = this.var_501.getKeys();
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = this.var_501.getValue(_loc2_) as IAvatarImage;
               _loc3_.dispose();
            }
         }
         this.var_501.dispose();
         if(this.var_381)
         {
            this.var_381.dispose();
         }
         this.var_381 = null;
         this.var_593 = null;
         this.var_1080 = true;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_593 = param1 as PetVisualizationData;
         createSprites(this.const_1338);
         var _loc2_:BitmapData = (this.var_593.getAvatarRendererAsset("pet_experience_bubble_png") as BitmapDataAsset).content as BitmapData;
         this.var_381 = new ExperienceData(_loc2_.clone());
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         if(param1.getUpdateID() != var_173)
         {
            this.var_1673 = param1.getNumber(RoomObjectVariableEnum.const_442) > 0;
            this.var_1379 = param1.getString(RoomObjectVariableEnum.const_150);
            this.var_246 = param1.getString(RoomObjectVariableEnum.const_262);
            this._postureParameter = param1.getString(RoomObjectVariableEnum.const_769);
            this.var_1671 = param1.getNumber(RoomObjectVariableEnum.const_215);
            this.var_1415 = param1.getNumber(RoomObjectVariableEnum.AVATAR_EXPERIENCE_TIMESTAMP);
            this.var_2195 = param1.getNumber(RoomObjectVariableEnum.const_894);
            this.validateActions();
            _loc3_ = param1.getString(RoomObjectVariableEnum.const_218);
            if(this.var_672 != _loc3_)
            {
               this.var_672 = _loc3_;
               this.resetAvatarImages();
            }
            var_173 = param1.getUpdateID();
            return true;
         }
         return false;
      }
      
      private function resetAvatarImages() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_501)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_501.reset();
         this.var_58 = null;
      }
      
      private function validateActions() : void
      {
         var _loc1_:int = 0;
         this.var_1729 = false;
         switch(this.var_246)
         {
            case AvatarAction.const_539:
            case AvatarAction.const_1166:
            case AvatarAction.const_1196:
            case AvatarAction.const_1219:
            case AvatarAction.const_1253:
            case AvatarAction.const_1092:
            case AvatarAction.const_900:
            case AvatarAction.const_363:
            case AvatarAction.const_238:
               this.var_1729 = true;
         }
         this.var_1668 = false;
         this.var_1108 = false;
         if(this.var_246 == "lay")
         {
            this.var_1108 = true;
            _loc1_ = int(this._postureParameter);
            if(_loc1_ < 0)
            {
               this.var_1668 = true;
            }
         }
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean = false) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param3 || var_471 != param1.getUpdateID() || this.var_1706 != param2.updateId)
         {
            _loc4_ = param1.getDirection().x - param2.direction.x;
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            _loc5_ = this.var_1671;
            if(isNaN(this.var_1671))
            {
               _loc5_ = _loc4_;
            }
            else
            {
               _loc5_ -= param2.direction.x;
               _loc5_ = (_loc5_ % 360 + 360) % 360;
            }
            if(_loc4_ != this.var_1667 || param3)
            {
               this.var_1667 = _loc4_;
               _loc4_ -= 112.5;
               _loc4_ = (_loc4_ + 360) % 360;
               this.var_58.setDirectionAngle(AvatarSetType.const_35,_loc4_);
            }
            if(_loc5_ != this.var_1669 || param3)
            {
               this.var_1669 = _loc5_;
               _loc5_ -= 112.5;
               _loc5_ = (_loc5_ + 360) % 360;
               this.var_58.setDirectionAngle(AvatarSetType.const_51,_loc5_);
            }
            var_471 = param1.getUpdateID();
            this.var_1706 = param2.updateId;
            return true;
         }
         return false;
      }
      
      private function getAvatarImage(param1:Number) : IAvatarImage
      {
         var _loc2_:String = "avatarImage" + param1.toString();
         var _loc3_:IAvatarImage = this.var_501.getValue(_loc2_) as IAvatarImage;
         if(_loc3_ == null)
         {
            _loc3_ = this.var_593.getAvatar(this.var_672,param1,this);
            if(_loc3_ != null)
            {
               this.var_501.add(_loc2_,_loc3_);
            }
         }
         return _loc3_;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1862);
         this.var_592 = null;
         _loc2_ = getSprite(this.const_1862);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 < 48)
         {
            this.var_592 = this.var_58.getAsset("sh_std_sd_1_0_0");
            _loc3_ = -8;
            _loc4_ = -3;
         }
         else
         {
            this.var_592 = this.var_58.getAsset("h_std_sd_1_0_0");
            _loc3_ = -17;
            _loc4_ = -7;
         }
         if(this.var_592)
         {
            _loc2_.asset = this.var_592.content as BitmapData;
            _loc2_.offsetX = _loc3_;
            _loc2_.offsetY = _loc4_;
            _loc2_.alpha = 50;
            _loc2_.relativeDepth = 1;
         }
         else
         {
            _loc2_.asset = null;
         }
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc5_:IRoomObject = object;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_593 == null)
         {
            return;
         }
         var _loc6_:IRoomObjectModel = _loc5_.getModel();
         if(this.var_1728)
         {
            this.var_1728 = false;
            this.var_1133 = 0;
            this.var_1134 = 1;
            this.resetAvatarImages();
         }
         var _loc7_:Number = param1.scale;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = this.updateModel(_loc6_,_loc7_);
         if(_loc10_ || _loc7_ != var_87 || this.var_58 == null)
         {
            if(_loc7_ != var_87)
            {
               var_87 = _loc7_;
               _loc8_ = true;
            }
            if(_loc8_ || this.var_58 == null)
            {
               this.var_58 = this.getAvatarImage(_loc7_);
            }
            if(this.var_58 == null)
            {
               return;
            }
            if(_loc8_)
            {
               this.updateShadow(_loc7_);
            }
            _loc9_ = this.updateObject(_loc5_,param1,true);
            this.updateActions(this.var_58);
         }
         else
         {
            _loc9_ = this.updateObject(_loc5_,param1);
         }
         var _loc11_:Boolean = _loc9_ || _loc10_ || _loc8_;
         var _loc12_:Boolean = this.var_907 || this.var_1134 > 0 || this.var_1729;
         this.var_381.alpha = 0;
         if(this.var_1415 > 0)
         {
            _loc13_ = param2 - this.var_1415;
            if(_loc13_ < AvatarAction.const_1062)
            {
               this.var_381.alpha = int(Math.sin(_loc13_ / 0 * 0) * 255);
               this.var_381.setExperience(this.var_2195);
               this.var_1134 = this.const_2129;
            }
            else
            {
               this.var_1415 = 0;
            }
            _loc14_ = getSprite(this.const_1858);
            if(_loc14_ != null)
            {
               if(this.var_381.alpha > 0)
               {
                  _loc14_.asset = this.var_381.image;
                  _loc14_.offsetX = -20;
                  _loc14_.offsetY = -80;
                  _loc14_.alpha = this.var_381.alpha;
                  _loc14_.visible = true;
               }
               else
               {
                  _loc14_.asset = null;
                  _loc14_.visible = false;
               }
            }
         }
         if(_loc11_ || _loc12_)
         {
            increaseUpdateId();
            --this.var_1134;
            ++this.var_580;
            --this.var_1133;
            if(!(this.var_1133 <= 0 || _loc8_))
            {
               return;
            }
            this.var_58.updateAnimationByFrames(1);
            this.var_1133 = const_1001;
            this.var_907 = this.var_58.isAnimating();
            _loc15_ = this.var_58.getCanvasOffsets();
            if(_loc15_ == null || _loc15_.length < 3)
            {
               _loc15_ = const_1337;
            }
            _loc16_ = 0;
            if(object.getLocation().z > 0)
            {
               _loc16_ = Math.min(_loc7_ / 2.75,0);
            }
            _loc14_ = getSprite(this.const_1002);
            if(_loc14_)
            {
               _loc19_ = this.var_58.getImage(AvatarSetType.const_35,false);
               if(_loc19_ != null)
               {
                  _loc14_.asset = _loc19_;
               }
               if(_loc7_ < 48)
               {
                  _loc14_.offsetX = -16 + _loc15_[0];
                  _loc14_.offsetY = -_loc14_.asset.height + 8 + _loc15_[1] + _loc16_;
               }
               else
               {
                  _loc14_.offsetX = -32 + _loc15_[0];
                  _loc14_.offsetY = -_loc14_.asset.height + 16 + _loc15_[1] + _loc16_;
               }
            }
            _loc17_ = this.const_1338;
            for each(_loc18_ in this.var_58.getSprites())
            {
               _loc14_ = getSprite(_loc17_);
               if(_loc14_ != null)
               {
                  _loc20_ = this.var_58.getLayerData(_loc18_);
                  _loc21_ = 0;
                  _loc22_ = _loc18_.getDirectionOffsetX(this.var_58.getDirection());
                  _loc23_ = _loc18_.getDirectionOffsetY(this.var_58.getDirection());
                  _loc24_ = _loc18_.getDirectionOffsetZ(this.var_58.getDirection());
                  _loc25_ = 0;
                  if(_loc18_.hasDirections)
                  {
                     _loc25_ = this.var_58.getDirection();
                  }
                  if(_loc20_ != null)
                  {
                     _loc21_ = _loc20_.animationFrame;
                     _loc22_ += _loc20_.dx;
                     _loc23_ += _loc20_.dy;
                     _loc25_ += _loc20_.directionOffset;
                  }
                  if(_loc7_ < 48)
                  {
                     _loc22_ /= 2;
                     _loc23_ /= 2;
                  }
                  if(_loc25_ < 0)
                  {
                     _loc25_ += 8;
                  }
                  if(_loc25_ > 7)
                  {
                     _loc25_ -= 8;
                  }
                  _loc26_ = this.var_58.getScale() + "_" + _loc18_.member + "_" + _loc25_ + "_" + _loc21_;
                  _loc27_ = this.var_58.getAsset(_loc26_);
                  if(_loc27_ != null)
                  {
                     _loc14_.asset = _loc27_.content as BitmapData;
                     _loc14_.offsetX = -1 * _loc27_.offset.x - _loc7_ / 2 + _loc22_;
                     _loc14_.offsetY = -1 * _loc27_.offset.y + _loc23_;
                     _loc14_.relativeDepth = -0.01 - 0.1 * _loc17_ * _loc24_;
                     if(_loc18_.ink == 33)
                     {
                        _loc14_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc14_.blendMode = BlendMode.NORMAL;
                     }
                     _loc17_++;
                  }
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_396,this.var_246,this._postureParameter);
         if(this.var_1379 != null && this.var_1379 != "")
         {
            param1.appendAction(AvatarAction.const_353,this.var_1379);
         }
         if(this.var_1673 || this.var_1378)
         {
            param1.appendAction(AvatarAction.const_545);
         }
         param1.endActionAppends();
         var _loc2_:int = param1.getSprites().length + this.const_1338;
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function imageReady() : void
      {
         this.var_1728 = true;
      }
      
      public function petImageReady(param1:String) : void
      {
         this.resetAvatarImages();
      }
   }
}
