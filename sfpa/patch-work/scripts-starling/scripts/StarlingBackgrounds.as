package
{
   import com.emibap.textureAtlas.*;
   import flash.display.*;
   import flash.display3D.*;
   import flash.display3D.textures.RectangleTexture;
   import flash.display3D.textures.Texture;
   import flash.events.*;
   import flash.filters.BlurFilter;
   import flash.geom.*;
   import flash.system.*;
   import flash.utils.*;
   import starling.core.*;
   import starling.display.*;
   import starling.events.*;
   import starling.filters.BlurFilter;
   import starling.textures.*;
   import starling.utils.*;
   
   public class StarlingBackgrounds extends starling.display.Sprite
   {
      
      public static var myStarling:Starling;
      
      private static var StaticBackground:starling.display.Sprite;
      
      public static var volcanoBackground:ScrollingObject;
      
      private static var inkboardAtlas:TextureAtlas;
      
      public static var inkSplat:starling.display.MovieClip;
      
      public static var cheatScale:starling.display.Sprite;
      
      private static var holdCacheFunc:Function;
      
      private static var croppedBD:BitmapData;
      
      public static var depthOfField:Boolean;
      
      public static var depthOfFieldCache:Boolean;
      
      public static var realStageX:int;
      
      public static var realStageY:int;
      
      public static var doorTexture:starling.textures.Texture;
      
      public static var tearTexture:starling.textures.Texture;
      
      public static var springSurfaceTexture:starling.textures.Texture;
      
      public static var springSpringTexture:starling.textures.Texture;
      
      public static var BackgroundArray:Array = [];
      
      public static var BackgroundObjArray:Array = [];
      
      public static var BackContainerArray:Array = [];
      
      public static var BackgroundMeshes:Array = [];
      
      public static var allImages:Array = [];
      
      private static var effectsAtlas:Array = [];
      
      private static var backBitMax:uint = 4096 - 1;
      
      private static var backFormat:String = "bgraPacked4444";
      
      private static var blurRes:Number = 0.5;
      
      public static var constrained:Boolean = false;
      
      private static var sliceNx:uint = 0;
      
      public static var sliceNy:uint = 0;
      
      public static var cameraFocalLength:int = 200;
      
      public static var backgroundObjectsArray:Array = [];
      
      public static var bitRes:Number = 1;
      
      public static var doorStampArray:Array = [];
      
      public static var groundTextures:Vector.<starling.textures.Texture> = new Vector.<starling.textures.Texture>(0);
      
      public static var groundBounds:Vector.<Rectangle> = new Vector.<Rectangle>(0);
      
      private static var charImage:Vector.<Image> = new Vector.<Image>(0);
      
      private static var charTexture:Vector.<starling.textures.Texture> = new Vector.<starling.textures.Texture>(0);
      
      private static var charNative:Vector.<RectangleTexture> = new Vector.<RectangleTexture>(0);
      
      private static var charNativeConstrained:Vector.<flash.display3D.textures.Texture> = new Vector.<flash.display3D.textures.Texture>(0);
      
      private static var pencilImage:Vector.<Image> = new Vector.<Image>(0);
      
      private static var pencilTexture:Vector.<starling.textures.Texture> = new Vector.<starling.textures.Texture>(0);
      
      private static var pencilNative:Vector.<RectangleTexture> = new Vector.<RectangleTexture>(0);
      
      private static var pencilNativeConstrained:Vector.<flash.display3D.textures.Texture> = new Vector.<flash.display3D.textures.Texture>(0);
      
      public static var charColor:uint = 16777215;
      
      public function StarlingBackgrounds()
      {
         super();
         try
         {
            textBubbles.setConstrained(constrained);
            StaticBackground = new starling.display.Sprite();
            myStarling.stage.addChild(StaticBackground);
            Texture.asyncBitmapUploadEnabled = false;
            if(Capabilities.os.substr(0,3) != "Win")
            {
               backFormat = "bgra";
            }
            if(constrained)
            {
               backBitMax = 2048 - 1;
               StarlingSmoke.createAtlas(createEffect(new toBeCachedSmoke(),0.74,true));
               StarlingInteract.createAtlas(createEffect(new toBeCachedInteracts(),1.5,true));
               StarlingEffect.createAtlas(createEffect(new toBeCachedEffects(),1.25,true));
               StarlingDecals.createAtlas(createEffect(new toBeCachedDecals(),1.5,true));
            }
            else
            {
               StarlingSmoke.createAtlas(createEffect(new toBeCachedSmoke(),1.5,true,true));
               StarlingInteract.createAtlas(createEffect(new toBeCachedInteracts(),1.5,true));
               StarlingEffect.createAtlas(createEffect(new toBeCachedEffects(),1.5,true));
               StarlingDecals.createAtlas(createEffect(new toBeCachedDecals(),1.5,true));
            }
            groundCache();
         }
         catch(err:Error)
         {
            trace("StarlingBackgrounds init fallback: " + err.message);
            if(StaticBackground == null)
            {
               StaticBackground = new starling.display.Sprite();
               myStarling.stage.addChild(StaticBackground);
            }
         }
         Main.stageRoot.StartAfterStarling();
      }
      
      public static function startStarling(e:flash.display.Stage) : *
      {
         myStarling = new Starling(StarlingBackgrounds,Main.stageRoot.stage,null,null,"auto","auto");
         Main.FadeClip.x = Main.realStageX;
         Main.FadeClip.y = Main.realStageY;
         myStarling.start();
      }
      
      private static function onExtendedComplete(e:flash.events.Event) : void
      {
         Main.stageRoot.stage.stage3Ds[0].removeEventListener(flash.events.Event.CONTEXT3D_CREATE,onExtendedComplete);
         Main.stageRoot.stage.stage3Ds[0].removeEventListener(ErrorEvent.ERROR,onExtendedFailed);
         if(Main.stageRoot.stage.stage3Ds[0].context3D)
         {
            Main.stageRoot.stage.stage3Ds[0].context3D.dispose(false);
         }
         setTimeout(reallyStartStarling,100);
      }
      
      private static function onExtendedFailed(e:flash.events.Event) : void
      {
         Main.stageRoot.stage.stage3Ds[0].removeEventListener(flash.events.Event.CONTEXT3D_CREATE,onExtendedComplete);
         Main.stageRoot.stage.stage3Ds[0].removeEventListener(ErrorEvent.ERROR,onExtendedFailed);
         if(Main.stageRoot.stage.stage3Ds[0].context3D)
         {
            Main.stageRoot.stage.stage3Ds[0].context3D.dispose(false);
         }
         constrained = true;
         setTimeout(reallyStartStarling,1000);
      }
      
      private static function reallyStartStarling() : void
      {
         if(constrained)
         {
            myStarling = new Starling(StarlingBackgrounds,Main.stageRoot.stage,null,null,"auto",Context3DProfile.BASELINE_CONSTRAINED);
         }
         else
         {
            myStarling = new Starling(StarlingBackgrounds,Main.stageRoot.stage,null,null,"auto",Context3DProfile.BASELINE_EXTENDED);
         }
         Main.FadeClip.x = Main.realStageX;
         Main.FadeClip.y = Main.realStageY;
         myStarling.start();
      }
      
      public static function addStaticBack(bitmap:BitmapData) : *
      {
         try
         {
            if(StaticBackground == null)
            {
               StaticBackground = new starling.display.Sprite();
               myStarling.stage.addChild(StaticBackground);
            }
            if(StaticBackground.numChildren > 0)
            {
               StaticBackground.removeChildAt(0);
            }
            StaticBackground.blendMode = BlendMode.NONE;
         }
         catch(err:Error)
         {
            trace("Skipping static background: " + err.message);
         }
      }
      
      public static function resizeStaticBack(scx:Number, scy:Number) : void
      {
         if(StaticBackground != null)
         {
            StaticBackground.scaleX = scx;
            StaticBackground.scaleY = scy;
         }
      }
      
      public static function setupCharStarling(ratio:Number, id:uint) : void
      {
         charImage[id] = null;
         pencilImage[id] = null;
      }
      
      public static function addCharStarling(id:uint) : void
      {
      }
      
      public static function pressCharBitmap(charBitmap:BitmapData, id:uint) : void
      {
      }
      
      public static function placeCharBitmap(ex:Number, ey:Number, rot:Number, ratio:Number, id:uint) : void
      {
      }
      
      public static function ArrangeBackgrounds(rail:uint, id:uint) : void
      {
      }
      
      public static function placeSlash(slash:*) : void
      {
         myStarling.stage.addChildAt(slash,pencilImage[0].parent.getChildIndex(pencilImage[0]) + 1);
      }
      
      public static function pressPencilBitmap(pencilBitmap:BitmapData, id:uint) : void
      {
      }
      
      public static function placePencilBitmap(ex:Number, ey:Number, rot:Number, ratioX:Number, ratioY:Number, id:uint) : void
      {
      }
      
      public static function charVisible(vis:Boolean, id:uint) : void
      {
      }
      
      public static function pencilVisible(vis:Boolean, id:uint) : void
      {
      }
      
      public static function toStarlingFromMC(clip:*, ratio:*, background:*, offsetX:int = 0, offsetY:int = 0, toMesh:Boolean = false, func:Function = null, blur:Number = 0) : Boolean
      {
         sliceNx = 0;
         sliceNy = 0;
         return true;
      }
      
      public static function toStarlingObj(clip:*, ratio:*, background:*) : Image
      {
         var bounds:Rectangle = clip.getBounds(clip);
         bitmapData = new BitmapData(bounds.width + 4,bounds.height + 4,true,0);
         bitmapData.drawWithQuality(clip,new Matrix(ratio,0,0,ratio,-bounds.x,-bounds.y),clip.transform.colorTransform,null,null,true,StageQuality.BEST);
         return addBitmap(bitmapData,background,clip.x + bounds.x,clip.y + bounds.y,1 / ratio);
      }
      
      private static function advanceBitmap() : void
      {
         ++sliceNy;
         croppedBD.dispose();
         if(holdCacheFunc != null)
         {
            holdCacheFunc();
         }
      }
      
      public static function addBackground(i:*) : *
      {
         BackContainerArray[i] = new starling.display.Sprite();
         BackgroundArray[i] = new starling.display.Sprite();
         BackgroundObjArray[i] = new starling.display.Sprite();
         myStarling.stage.addChild(BackContainerArray[i]);
         myStarling.stage.addChild(BackgroundArray[i]);
         myStarling.stage.addChild(BackgroundObjArray[i]);
      }
      
      public static function addBitmap(bitmap:BitmapData, background:*, ex:*, ey:*, ratio:*, toAll:Boolean = true, func:Function = null, blur:Number = 0) : Image
      {
         if(func != null)
         {
            func();
         }
         return null;
      }
      
      public static function setBlur(rail:uint, clear:Boolean = false) : void
      {
         var i:uint = 0;
         var blur:Number = NaN;
         if(!depthOfField || constrained)
         {
            return;
         }
         var blurOffset:Number = Main.getBlurOffset(rail);
         var ratio:Number = 2.16 / Main.overRatio;
         for(i in BackgroundArray)
         {
            blur = (0.25 + Math.abs(Main.getBlurOffset(i) - blurOffset) * 1.5) / 2.16 * Main.overRatio;
            if(i == rail)
            {
               if(BackgroundArray[i].filter != null)
               {
                  BackgroundArray[i].filter.dispose();
                  BackgroundArray[i].filter = null;
               }
            }
            else
            {
               if(BackgroundArray[i].filter == null)
               {
                  BackgroundArray[i].filter = new starling.filters.BlurFilter(blur,blur,blurRes * ratio);
               }
               else
               {
                  BackgroundArray[i].filter.blurX = blur;
                  BackgroundArray[i].filter.blurY = blur;
               }
               BackgroundArray[i].filter.cache();
            }
            if(i == rail)
            {
               if(BackgroundObjArray[i].filter != null)
               {
                  BackgroundObjArray[i].filter.dispose();
                  BackgroundObjArray[i].filter = null;
               }
            }
            else
            {
               if(BackgroundObjArray[i].filter == undefined || clear)
               {
                  BackgroundObjArray[i].filter = new starling.filters.BlurFilter(blur,blur,blurRes * ratio);
               }
               else
               {
                  BackgroundObjArray[i].filter.blurX = blur;
                  BackgroundObjArray[i].filter.blurY = blur;
               }
               BackgroundObjArray[i].filter.padding = new Padding(40,40,40,40);
            }
            if(i == rail)
            {
               if(BackContainerArray[i].filter != null)
               {
                  BackContainerArray[i].filter.dispose();
                  BackContainerArray[i].filter = null;
               }
            }
            else if(BackContainerArray[i].filter == undefined || clear)
            {
               BackContainerArray[i].filter = new starling.filters.BlurFilter(blur,blur,blurRes * ratio);
            }
            else
            {
               BackContainerArray[i].filter.blurX = blur;
               BackContainerArray[i].filter.blurY = blur;
            }
         }
      }
      
      public static function addScrollObject(e:*, ez:*, res:Number = 1, func:Function = null) : Boolean
      {
         var obj:ScrollingObject = new ScrollingObject(e.x,e.y,ez);
         backgroundObjectsArray.push(obj);
         myStarling.stage.addChild(obj);
         if(func == null)
         {
            while(!toStarlingFromMC(e,res,obj))
            {
            }
            return true;
         }
         return toStarlingFromMC(e,res,obj,0,0,false,func);
      }
      
      public static function addVolcano() : void
      {
         try
         {
            volcanoBackground = new ScrollingObject(0,0,1000);
            myStarling.stage.addChild(volcanoBackground);
            volcanoBackground.touchable = false;
         }
         catch(err:Error)
         {
            trace("Skipping volcano background: " + err.message);
         }
      }
      
      public static function resizeVolcano(ex:*, ey:*) : void
      {
         if(volcanoBackground != null)
         {
            volcanoBackground.scaleX = ex;
            volcanoBackground.scaleY = ey;
         }
      }
      
      public static function addBitmapRender(bitmap:*, n:*, ex:*, ey:*, ratio:*) : *
      {
         var rend:RenderTexture = new RenderTexture(bitmap.width,bitmap.height,true,1);
         var image:Image = new Image(Texture.fromBitmapData(bitmap,false,true,1,backFormat));
         rend.draw(image);
         image.texture.dispose();
         image.dispose();
         var tile:Image = new Image(rend);
         tile.x = ex;
         tile.y = ey;
         tile.scaleX = tile.scaleY = ratio;
         BackgroundObjArray[n].addChild(tile);
         return tile;
      }
      
      private static function createEffect(mc:*, n:*, compress:*, xl:Boolean = false) : *
      {
         return DynamicAtlas.fromMovieClipContainer(mc,n,1,true,true,compress,xl);
      }
      
      public static function addObject(mc:*, rail:int) : void
      {
         BackgroundObjArray[rail].addChild(mc);
      }
      
      public static function addObjectBack(mc:starling.display.MovieClip, rail:int) : void
      {
         BackContainerArray[rail].addChild(mc);
      }
      
      public static function stampInkSplat(bit:*, b:*, matrix:*) : *
      {
         inkSplat.currentFrame = b;
         bit.texture.draw(inkSplat,matrix);
      }
      
      public static function removeMovieClip(e:*) : *
      {
         myStarling.juggler.remove(e);
         e.removeFromParent(true);
         e.dispose();
      }
      
      public static function scrollBackgrounds(n:*, ex:*, ey:*, ratio:*) : void
      {
         BackContainerArray[n].x = BackgroundObjArray[n].x = BackgroundArray[n].x = ex;
         BackContainerArray[n].y = BackgroundObjArray[n].y = BackgroundArray[n].y = ey;
         BackContainerArray[n].scaleX = BackContainerArray[n].scaleY = BackgroundObjArray[n].scaleX = BackgroundObjArray[n].scaleY = BackgroundArray[n].scaleX = BackgroundArray[n].scaleY = ratio;
      }
      
      public static function scrollVolcano(ex:Number, ey:Number, ratio:Number) : void
      {
         volcanoBackground.x = realStageX + (ex - 20000) * ratio;
         volcanoBackground.y = realStageY + (ey - 12500) * ratio;
         volcanoBackground.scaleX = volcanoBackground.scaleY = 50 * ratio;
      }
      
      public static function scrollBackgroundObjects(cameraX:*, cameraY:*, cameraZ:*) : *
      {
         var ratio:Number = NaN;
         for(var i:int = 0; i < backgroundObjectsArray.length; i++)
         {
            ratio = cameraFocalLength / (cameraFocalLength + backgroundObjectsArray[i].theZ - cameraZ) * Main.overRatio;
            if(ratio > 0)
            {
               backgroundObjectsArray[i].visible = true;
               backgroundObjectsArray[i].x = realStageX + (backgroundObjectsArray[i].theX - cameraX) * ratio;
               backgroundObjectsArray[i].y = realStageY + (backgroundObjectsArray[i].theY - cameraY) * ratio;
               backgroundObjectsArray[i].scaleX = backgroundObjectsArray[i].scaleY = ratio;
            }
            else
            {
               backgroundObjectsArray[i].visible = false;
            }
         }
      }
      
      public static function onResize() : *
      {
         myStarling.viewPort.width = Main.stageRoot.stage.stageWidth;
         myStarling.viewPort.height = Main.stageRoot.stage.stageHeight;
         myStarling.stage.stageWidth = Main.stageRoot.stage.stageWidth;
         myStarling.stage.stageHeight = Main.stageRoot.stage.stageHeight;
      }
      
      public static function flattenBackgrounds() : *
      {
         var i:uint = 0;
         for(i in BackgroundArray)
         {
            BackgroundArray[i].touchable = false;
            BackContainerArray[i].touchable = false;
            BackgroundObjArray[i].touchable = false;
         }
         for(i in backgroundObjectsArray)
         {
            backgroundObjectsArray[i].touchable = false;
         }
      }
      
      public static function unflattenBackgrounds() : *
      {
      }
      
      public static function flushBackgrounds() : *
      {
         var i:uint = 0;
         for(i in allImages)
         {
            allImages[i].removeFromParent(true);
            allImages[i].texture.dispose();
            allImages[i].dispose();
            allImages[i] = null;
         }
         allImages = [];
      }
      
      public static function removeBackgrounds() : *
      {
         var i:uint = 0;
         for(i in BackgroundArray)
         {
            if(BackgroundArray[i].filter != null)
            {
               BackgroundArray[i].filter.dispose();
               BackgroundArray[i].filter = null;
            }
            if(BackgroundObjArray[i].filter != null)
            {
               BackgroundObjArray[i].filter.dispose();
               BackgroundObjArray[i].filter = null;
            }
            if(BackContainerArray[i].filter != null)
            {
               BackContainerArray[i].filter.dispose();
               BackContainerArray[i].filter = null;
            }
            BackgroundArray[i].removeFromParent(true);
            BackgroundArray[i].dispose();
            BackgroundObjArray[i].removeFromParent(true);
            BackgroundObjArray[i].dispose();
            BackContainerArray[i].removeFromParent(true);
            BackContainerArray[i].dispose();
         }
         BackgroundArray = [];
         BackgroundObjArray = [];
         BackContainerArray = [];
      }
      
      public static function removeOneBackground(i:*) : *
      {
         BackgroundArray[i].removeFromParent(true);
         BackgroundArray[i].dispose();
         BackgroundArray.splice(i,1);
         BackgroundObjArray.splice(i,1);
         BackContainerArray.splice(i,1);
      }
      
      private static function groundCache() : void
      {
         var bounds:Rectangle = null;
         var bitmapData:BitmapData = null;
         var ground:groundStampW4 = new groundStampW4();
         for(var i:uint = 0; i < ground.totalFrames; i++)
         {
            ground.gotoAndStop(i + 1);
            bounds = groundBounds[i] = ground.getBounds(ground);
            bitmapData = new BitmapData(bounds.width,bounds.height,true,0);
            bitmapData.drawWithQuality(ground,new Matrix(1,0,0,1,-bounds.x,-bounds.y),null,null,null,true,StageQuality.BEST);
            groundTextures[i] = Texture.fromBitmapData(bitmapData,false,true,1,Context3DTextureFormat.BGRA_PACKED);
            bitmapData.dispose();
         }
      }
      
      public static function getGroundSmoke(frame:uint, rail:uint) : Image
      {
         var ground:Image = new Image(groundTextures[frame]);
         ground.pivotX = -groundBounds[frame].x;
         ground.pivotY = -groundBounds[frame].y;
         BackContainerArray[rail].addChild(ground);
         return ground;
      }
   }
}

