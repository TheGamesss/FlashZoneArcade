package
{
   import flash.display.*;
   import flash.geom.*;
   import starling.display.Image;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1734")]
   public class windowCutscene extends staticInteractObjects
   {
      
      public var overlayImage:Image;
      
      public var roomLightImage:Image;
      
      public var bitmapData:BitmapData;
      
      private var b:uint = 20;
      
      private var flashes:int = 2;
      
      private var state:uint;
      
      private var hold:uint = 0;
      
      private var bitRes:Number = 2;
      
      public function windowCutscene(p:*)
      {
         isWide = 400;
         isTall = 300;
         super("windowCutscene",p.x,p.y,1,1,0);
         if(Main.DoorIt == 1)
         {
            gotoAndStop(1);
            this.bitmapData = new BitmapData(800 * this.bitRes,600 * this.bitRes,true,0);
            this.bitmapData.drawWithQuality(this,new Matrix(this.bitRes,0,0,this.bitRes,isWide,isTall),null,null,null,true,StageQuality.HIGH_16X16_LINEAR);
            gotoAndStop(2);
            this.overlayImage = StarlingBackgrounds.addBitmap(this.bitmapData,StarlingBackgrounds.BackgroundObjArray[0],x - 400 / this.bitRes,y - 300 / this.bitRes,1 / this.bitRes,false);
            this.bitmapData = new BitmapData(800 * this.bitRes,600 * this.bitRes,true,0);
            this.bitmapData.drawWithQuality(this,new Matrix(this.bitRes,0,0,this.bitRes,isWide,isTall),null,null,null,true,StageQuality.HIGH_16X16_LINEAR);
            this.roomLightImage = StarlingBackgrounds.addBitmap(this.bitmapData,StarlingBackgrounds.BackgroundObjArray[0],x - 400 / this.bitRes,y - 300 / this.bitRes,1 / this.bitRes,false);
            this.bitmapData.dispose();
            this.state = 0;
            gotoAndStop(4);
            Backgrounds.backgroundsArray[0].addChild(this);
            InteractEnterFrameArray.push(this);
            Sounds.playOnce("Intro_Rain");
         }
         stop();
      }
      
      override public function InteractEnterFrame() : Boolean
      {
         var temp:Number = NaN;
         nextFrame();
         if(currentFrame == totalFrames)
         {
            gotoAndStop(3);
         }
         if(Main.charScrollZ < 75)
         {
            if(alpha > 0)
            {
               alpha -= 0.002;
            }
         }
         if(this.state == 0)
         {
            if(this.hold > 0)
            {
               --this.hold;
            }
            else
            {
               if(this.roomLightImage != null && this.roomLightImage.alpha > 0)
               {
                  this.roomLightImage.alpha *= 0.85;
               }
               if(this.b > 0)
               {
                  --this.b;
               }
               else if(this.flashes > 0)
               {
                  --this.flashes;
                  this.b = 3 + Math.random() * 5;
                  if(this.roomLightImage != null)
                  {
                     this.roomLightImage.alpha = 0.2 + Math.random() * 0.2;
                  }
               }
               else if(this.flashes == -1)
               {
                  this.flashes = Math.random() * 3;
                  this.b = 60 + int(Math.random() * 40);
               }
               else if(this.flashes < 0)
               {
                  ++this.flashes;
                  this.b = 2 + Math.random() * 2;
                  if(this.roomLightImage != null)
                  {
                     this.roomLightImage.alpha = 0.2 + Math.random() * 0.2;
                  }
               }
               else
               {
                  this.flashes = -(2 + Math.random() * 3);
                  this.b = 6 + Math.random() * 4;
                  if(this.roomLightImage != null)
                  {
                     this.roomLightImage.alpha = 1;
                  }
                  this.hold = 8;
               }
            }
            temp = (Main.charScrollZ - 64) * 0.1;
            if(Char.CharArray[0].wantUD < -0.5 || Char.CharArray[0].attackUD < -0.5)
            {
               if(temp > 0.2)
               {
                  temp = 0.2;
               }
            }
            else if(temp > 0.04)
            {
               temp = 0.04;
            }
            Main.charScrollY += temp * 2.4;
            Main.charScrollZ -= temp;
            if(Main.charScrollZ < 66)
            {
               this.b = 60;
               this.state = 1;
            }
         }
         else if(this.state == 1)
         {
            if(this.roomLightImage != null && this.roomLightImage.alpha > 0)
            {
               this.roomLightImage.alpha *= 0.85;
            }
            if(this.b > 0)
            {
               --this.b;
               if(this.b > 0 && (Char.CharArray[0].wantUD < -0.5 || Char.CharArray[0].attackUD < -0.5))
               {
                  --this.b;
               }
            }
            else if(this.overlayImage != null && this.overlayImage.alpha > 0)
            {
               this.overlayImage.alpha -= 0.01;
            }
            else
            {
               killInteract.push(this);
               Main.cameraShiftRatio = 0;
               Main.toCameraShiftRatio = 0;
               Main.cameraShiftX = Main.charScrollX;
               Main.cameraShiftY = Main.charScrollY;
               Main.cameraShiftZ = Main.charScrollZ;
               Char.CharArray[0].zOffset = 75;
               Main.switchScroll("scrollChars");
               this.state = 2;
               rootHUD.HUD.alpha = 1;
               if(Main.isTouchScreen)
               {
                  Main.stageRoot.justArrowsVisible(true);
               }
            }
         }
      }
      
      override public function cleanUp() : void
      {
         if(this.overlayImage != null)
         {
            this.overlayImage.texture.dispose();
            this.overlayImage.dispose();
            this.overlayImage.removeFromParent(true);
         }
         if(this.roomLightImage != null)
         {
            this.roomLightImage.texture.dispose();
            this.roomLightImage.dispose();
            this.roomLightImage.removeFromParent(true);
         }
      }
   }
}

