package
{
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.utils.*;
   
   public class Char extends collision
   {
      
      public static var myNetwork:Network;
      
      public static var netMaster:Boolean;
      
      public static var realStageX:uint;
      
      public static var realStageY:uint;
      
      public static var pushingScreen:Boolean;
      
      public static var useNodes:Boolean;
      
      internal static var test1:MovieClip;
      
      public static var isTouchScreen:Boolean;
      
      public static var dontSquiggle:Boolean;
      
      public static var baddieContainer:Object;
      
      public static var hasPencil:Boolean;
      
      public static var hasPen:Boolean;
      
      public static var hasPencilAdv:Boolean;
      
      public static var hasShoot:Boolean;
      
      public static var hasZip:Boolean;
      
      private static var inBonus:Boolean;
      
      public static var forceBitmap:Boolean;
      
      internal static var foreground:MovieClip;
      
      public static var networkControls:Array = [0,0,0,0,1,0,0,0,0,1,1,"Idle",1,[]];
      
      private static var cameraFocalLength:int = 100;
      
      public static var overRatio:Number = 1;
      
      public static var CharN:uint = 0;
      
      public static var CharArray:Vector.<Char> = new Vector.<Char>(0);
      
      public static var DisabledArray:Vector.<Char> = new Vector.<Char>(0);
      
      public static var ActiveCharArray:Vector.<Char> = new Vector.<Char>(0);
      
      public static var InactiveCharArray:Vector.<Char> = new Vector.<Char>(0);
      
      public static var Squiggles:int = 0;
      
      private var oY:Number;
      
      public var pencilRL:int = 0;
      
      public var pencilTipX:int = 0;
      
      public var pencilTipY:int = 0;
      
      public var oPencilTipX:int = 0;
      
      public var pencilX:int;
      
      public var pencilY:int;
      
      private var lastInkPointX:Number;
      
      private var lastInkPointY:Number;
      
      public var pencilRot:int;
      
      private var shootAngle:Number;
      
      public var Pencil:Object;
      
      public var attackN:uint;
      
      public var chargeN:uint;
      
      public var justAttackHit:Boolean;
      
      public var justAttackQuick:Boolean;
      
      public var attackRL:Number = 0;
      
      public var attackUD:int = 0;
      
      private var superHurt:Boolean;
      
      public var resetPencil:Function;
      
      private var terminalVelocity:uint;
      
      public var chargePower:int;
      
      public var ID:Number = 0;
      
      public var fallView:Number = 0;
      
      public var FloatLock:Boolean = false;
      
      public var lives:int = 3;
      
      public var smashLives:int = 3;
      
      public var toOnRail:int = -1;
      
      private var wasOnRail:int = -1;
      
      public var cameraZ:Number = 0;
      
      public var ratio:Number = 1;
      
      public var realRatio:Number = 1;
      
      public var onWallN:int;
      
      private var canLateJump:Number = 0;
      
      private var jumpHeld:Number;
      
      private var tempStilleX:int;
      
      public var canQuickDrop:Boolean;
      
      public var wallJumped:Boolean;
      
      public var canZip:Boolean;
      
      private var canBuzzSaw:Boolean;
      
      private var canPokeDown:Boolean;
      
      private var canRising:Boolean;
      
      private var moveSound:Number;
      
      public var sheathFrame:int = 0;
      
      public var pencilOut:int = 0;
      
      public var frameSkip:int = 0;
      
      public var landFrame:int = 1;
      
      public var legFrame:uint = 0;
      
      public var performN:int = 0;
      
      public var b:int = 0;
      
      public var hairRL:Number = 0;
      
      public var hairUD:Number = 0;
      
      private var hairGoTo:int;
      
      public var hairGel:int;
      
      public var fliprot:Number = 0;
      
      public var startRot:Number = 0;
      
      public var spinRot:Number;
      
      public var RLStatus:String = "nothing";
      
      public var isCarrying:String = "nothing";
      
      public var cameraX:Number = 0;
      
      public var cameraY:Number = 0;
      
      public var groundY:Number = 0;
      
      public var groundYUD:Number = 0;
      
      public var cameraYUD:Number = 0;
      
      public var springWantRL:Number = 0;
      
      private var alreadyPredicted:Boolean;
      
      private var alreadyPredictY:int = 0;
      
      private var alreadyPredictedN:uint = 0;
      
      public var predictOffsetY:int = 0;
      
      public var lastBouncedX:int = 0;
      
      public var lastBouncedY:int = -10000;
      
      private var smoothScroll:Number = 150;
      
      public var smoothScrollX:Number = 150;
      
      public var smoothScrollY:Number = 0;
      
      private var smoothScrollRL:Number = 0;
      
      private var smoothScrollUD:Number = 0;
      
      private var cameraThresh:Number = 0;
      
      private var strictFade:Number = -1.5708;
      
      public var canAutoLook:Boolean = true;
      
      private var canAutoLookX:int = 0;
      
      private var willBeOnWall:int = 0;
      
      private var lastInkboardRot:Number;
      
      private var holdInkRot:uint;
      
      public var char:Object;
      
      public var charClips:Object;
      
      public var toVOffset:int;
      
      public var zOffset:int;
      
      public var inkReserve:Number = 100;
      
      public var inkMax:uint = 100;
      
      private var inkAim:Number;
      
      public var superStill:Boolean;
      
      private var shootSwitch:int = 0;
      
      private var landQuick:Boolean;
      
      private var landSlow:Boolean;
      
      public var backEffect:Boolean = false;
      
      private var quickRadian:Number = 0.017453292519943295;
      
      private var moreChar:uint = 0;
      
      private var deepArray:Array;
      
      public var Slash:Object;
      
      private var tempFloat:int;
      
      private var tempStill:Boolean;
      
      private var tempJump:Boolean;
      
      private var tempTempStill:Boolean;
      
      private var tempFloatStill:Boolean;
      
      private var landRL:Number;
      
      private var landUD:Number;
      
      private var backFlipRot:Number;
      
      private var trueRot:Number;
      
      private var targetRot:Number;
      
      private var shouldRot:Number;
      
      private var frames:int;
      
      public var hitGround:int;
      
      private var hitWall:int;
      
      private var temp:Number;
      
      private var goFrame:int;
      
      private var ledgeTil:int;
      
      private var rockingOut:int;
      
      private var rockOutCounter:int;
      
      private var offScreenCounter:uint = 30;
      
      private var flipDir:int;
      
      private var i:int;
      
      public var thrust:int = 16;
      
      public var warpDoor:Object;
      
      public var LoadIt:String;
      
      public var DoorIt:int;
      
      private var showDoorIcon:Boolean;
      
      private var hasDoorIcon:Boolean;
      
      private var myDoorIcon:StarlingSmoke;
      
      private var inBox:Object;
      
      public var outBox:Object;
      
      public var onInkBoard:inkBoard;
      
      public var onSlidePole:slidePole;
      
      public var head:Object;
      
      public var headx:Number;
      
      public var heady:Number;
      
      private var headX:Number;
      
      private var headY:Number;
      
      public var headrot:Number;
      
      public var hatSym:Boolean;
      
      public var hatN:int;
      
      public var pantsN:int;
      
      public var colorN:int;
      
      public var patternN:int;
      
      public var inkboardPointer:wantRotPointer;
      
      public var wantRotFollowX:Number;
      
      public var wantRotFollowY:Number;
      
      public var squiggleBuffer:uint;
      
      public var myTransLevelOffsetX:Number = 0;
      
      public var myTransLevelOffsetY:Number = 0;
      
      public var myTransLevelOffsetDelay:Number = 0;
      
      public var charbit:BitmapData;
      
      public var charmap:Bitmap;
      
      public var pantsTextures:MovieClip;
      
      public var maskContainer:Sprite;
      
      public var boxMask:boxInMask;
      
      public var smashDamage:int;
      
      public var myNode:int;
      
      public var cameraMaster:Boolean;
      
      private var trackYs:Array;
      
      public var fromFloatY:Number;
      
      public var AisDown:Boolean;
      
      public var SisDown:Boolean;
      
      public var SpIsDown:Boolean;
      
      public var runtoslide:Boolean;
      
      public var impact:Boolean;
      
      public var justLanded:Boolean;
      
      public var fromLedge:Boolean;
      
      public var fromSlide:Boolean;
      
      public var toPencil:Boolean;
      
      public var stepUp:Boolean;
      
      public var sheathing:Boolean;
      
      public var alreadyLanded:Boolean;
      
      public var walkLock:Boolean;
      
      public var ledgeGrab:Boolean;
      
      public var skipslide:Boolean;
      
      public var TempStill:Boolean;
      
      public var quickDrop:Boolean;
      
      public var FloatStill:Boolean;
      
      public var canSpin:Boolean;
      
      public var flailing:Boolean;
      
      public var waterLanding:Boolean;
      
      public var TempStillX:Boolean;
      
      public var isDoubling:Boolean;
      
      public var hasGamepad:Boolean;
      
      public var usingGamepad:Boolean;
      
      public var superTumble:Boolean;
      
      private var quickAttack:Boolean;
      
      public var fakeRightIsDown:Boolean;
      
      public var fakeLeftIsDown:Boolean;
      
      public var fakeUpIsDown:Boolean;
      
      public var fakeDownIsDown:Boolean;
      
      public var fakeJumpIsDown:Boolean;
      
      public var fakeAttackIsDown:Boolean;
      
      public var fakeSpecialIsDown:Boolean;
      
      public var fakeSpecial2IsDown:Boolean;
      
      public var rootRightIsDown:int;
      
      public var rootLeftIsDown:int;
      
      public var rootUpIsDown:int;
      
      public var rootDownIsDown:int;
      
      public var rootJumpIsDown:int;
      
      public var rootAttackIsDown:int;
      
      public var rootSpecialIsDown:int;
      
      public var rootSpecial2IsDown:int;
      
      public var padX:uint;
      
      public var padY:uint;
      
      public var padRight:uint;
      
      public var padLeft:uint;
      
      public var padUp:uint;
      
      public var padDown:uint;
      
      public var padJump:uint;
      
      public var padAttack:uint;
      
      public var padSpecial:uint;
      
      public var padSpecial2:uint;
      
      public var padStart:uint;
      
      private var padReset:uint = 0;
      
      private var padRefresh:uint = 0;
      
      public var padStartIsDown:Boolean;
      
      private var controlSwap:int;
      
      public var controlSwapX:int;
      
      public var controlSwapY:int;
      
      public var CharEnterFrame:Function;
      
      public var hatEffect:Function;
      
      private var AttackStuff:Function;
      
      public var CheckKeysDown:Function;
      
      public var CheckKeysUp:Function;
      
      public var Gamepad:Object;
      
      public var gamepadID:String;
      
      public var gamepadName:String;
      
      public var gamepadNum:int = -1;
      
      private var padDeadzone:Number = 0;
      
      private var dPadDeadzone:Number = 0;
      
      private var padRange:Number;
      
      private var gamepadRL:Number = 0;
      
      private var gamepadUD:Number = 0;
      
      private var gamepadTempX:Number = 0;
      
      private var gamepadTempY:Number = 0;
      
      private var dpadTempX:Number = 0;
      
      private var dpadTempY:Number = 0;
      
      private var gamepadRot:Number = 0;
      
      private var oGamepadRot:Number = 0;
      
      private var followStick:Boolean = false;
      
      private var gamepadJump:Boolean;
      
      private var gamepadAttack:Boolean;
      
      private var gamepadSpecial:Boolean;
      
      private var gamepadSpecial2:Boolean;
      
      private var hasAnalog:Boolean;
      
      private var hasDpad:Boolean;
      
      private var hasAnalogDpad:Boolean;
      
      private var gamepadButtons:Vector.<int>;
      
      public var gamepadControls:Vector.<Number>;
      
      private var charBitmap:BitmapData;
      
      private var pencilBitmap:BitmapData;
      
      private var charVector:Boolean;
      
      private var charRes:Number = 1.5;
      
      public var forcingBitmap:Boolean;
      
      private var puppet:Boolean;
      
      private var subStatus:String;
      
      public var myDebugs:Array;
      
      private var charSetups:Object;
      
      private var justHitArray:Vector.<collision>;
      
      internal var SlideBackpeddleSetupFrame:Function;
      
      internal var SlideBackpeddleEnterFrame:Function;
      
      internal var ShootAirSetupFrame:Function;
      
      internal var ShootAirEnterFrame:Function;
      
      internal var ZipAirSetupFrame:Function;
      
      internal var ZipAirEnterFrame:Function;
      
      internal var PencilAirSetupFrame:Function;
      
      internal var PencilAirEnterFrame:Function;
      
      public function Char(rail:uint = 0, pup:Boolean = false)
      {
         var container:Sprite;
         var myClass:Class;
         this.charClips = new Object();
         this.deepArray = [];
         this.inkboardPointer = new wantRotPointer();
         this.trackYs = [];
         this.CharEnterFrame = function():*
         {
         };
         this.gamepadButtons = new Vector.<int>();
         this.gamepadControls = new Vector.<Number>();
         this.myDebugs = [];
         this.charSetups = {
            "Level1Setup":function(e:*):*
            {
            },
            "Bonus4Setup":function(e:*):*
            {
               if(Main.DoorIt == 0)
               {
                  e.gotoBuffer = "Drop";
                  e.fakeUD = e.moveUD = 30;
               }
            },
            "Menus0Setup":function(e:*):*
            {
               if(Main.DoorIt == 5)
               {
                  e.gotoBuffer = "Hurt";
                  e.Jumper = 0;
                  e.rotter = 20;
               }
            },
            "Trans4Setup":function(e:*):*
            {
               if(Main.DoorIt == 2)
               {
                  Main.achievement("WheresPenguin");
               }
            }
         };
         this.justHitArray = new Vector.<collision>(0);
         this.SlideBackpeddleSetupFrame = this.BackpeddleSetupFrame;
         this.SlideBackpeddleEnterFrame = this.BackpeddleEnterFrame;
         this.ShootAirSetupFrame = this.ShootSetupFrame;
         this.ShootAirEnterFrame = this.ShootEnterFrame;
         this.ZipAirSetupFrame = this.ZipSetupFrame;
         this.ZipAirEnterFrame = this.ZipEnterFrame;
         this.PencilAirSetupFrame = this.PencilSetupFrame;
         this.PencilAirEnterFrame = this.PencilEnterFrame;
         super(rail);
         this.puppet = pup;
         this.ID = CharArray.length;
         CharN = this.ID + 1;
         this.b = this.ID * 10;
         CharArray.push(this);
         ActiveCharArray.push(this);
         springBounce = this.charSpringBounce;
         moveSpringBounce = this.charMoveSpringBounce;
         BallRes = 20;
         isTall = 25;
         isWide = 15;
         bounce = 0;
         mass = 40;
         bounceThresh = 50;
         springy = 2;
         springTall = isTall * 2;
         maxRL = 20;
         overReach = 10;
         rotPerc = 2.5;
         camDistR = camDistL = 400;
         camDistU = camDistD = 250;
         canBowlOver = true;
         health = healthMax = 100 + Main.world4Progress.healthLevel * 20;
         ItIs = "Char";
         overRatio = Main.overRatio;
         powerLevel = Main.world4Progress.powerLevel;
         power = 1 + powerLevel * 0.5;
         this.getKeyboardKeys(this.ID + 1);
         this.gamepadRL = this.gamepadUD = 0;
         this.canBuzzSaw = Boolean(Main.world4Progress.canBuzzSaw) || Main.world4Progress.threeLevel > 0;
         this.canPokeDown = Boolean(Main.world4Progress.canPokeDown) || Main.world4Progress.fourLevel > 0;
         this.canRising = Boolean(Main.world4Progress.canRising) || Main.world4Progress.fiveLevel > 0;
         this.checkAllMoves();
         this.smashLives = 3;
         this.lives = Main.localSettings.lives;
         if(Main.LoadIt == "Arena0" || Main.LoadIt == "Arena1" || true)
         {
            hasPencil = hasPencilAdv = true;
            this.AttackStuff = this.PencilAttackStuff;
            this.resetPencil = this.realResetPencil;
         }
         else if(Main.localSettings.W1RProgress > 7)
         {
            hasPencil = true;
            this.AttackStuff = this.PencilAttackStuff;
            this.resetPencil = this.realResetPencil;
         }
         else
         {
            hasPencil = false;
            this.AttackStuff = function():*
            {
            };
            this.resetPencil = function():*
            {
            };
         }
         resetOnPlatSides();
         this.x += this.ID * 20;
         theX = this.x;
         CheckGroundGround = CheckGroundGroundChar;
         container = new Sprite();
         container.addChild(this);
         this.boxMask = new boxInMask();
         parent.addChild(this.boxMask);
         this.boxMask.visible = false;
         this.setupVanity();
         gotoBuffer = "Idle";
         myClass = getDefinitionByName("Char" + gotoBuffer) as Class;
         this.char = new myClass();
         this.charClips[gotoBuffer] = this.char;
         addChild(this.char);
         this.forcingBitmap = forceBitmap;
         this.hasAnalogDpad = Main.deviceID != "PC";
         this.editSaveString("Hats",14);
         this.editSaveString("Hats",15);
      }
      
      public static function removeChar() : void
      {
         var char:Char = CharArray.pop();
         char.cleanChar();
         char = null;
         --CharN;
      }
      
      public static function shuffleControls() : void
      {
         var charB:int = 0;
         var i:int = 0;
         if(CharN == 1)
         {
            CharArray[0].getKeyboardKeys(1);
         }
         else
         {
            charB = 1;
            for(i = 0; i < CharArray.length; i++)
            {
               if(CharArray[i].hasGamepad)
               {
                  CharArray[i].getKeyboardKeys(0);
               }
               else
               {
                  CharArray[i].getKeyboardKeys(charB);
                  charB++;
               }
            }
         }
      }
      
      public static function CharEnterFrames() : *
      {
         for(var i:int = 0; i < ActiveCharArray.length; i++)
         {
            ActiveCharArray[i].myEnterFrames();
         }
         for(i = 0; i < InactiveCharArray.length; i++)
         {
            InactiveCharArray[i].CharEnterFrame();
         }
      }
      
      public static function getPuppet(i:uint) : Boolean
      {
         return Char.CharArray[i].puppet;
      }
      
      public static function fromNetwork(m:Array) : void
      {
         networkControls = m;
      }
      
      public static function HalfMoves() : *
      {
         for(var i:int = 0; i < ActiveCharArray.length; i++)
         {
            ActiveCharArray[i].myHalfMoves();
         }
      }
      
      public static function HalfRests() : *
      {
         for(var i:int = 0; i < ActiveCharArray.length; i++)
         {
            ActiveCharArray[i].myHalfRest();
         }
      }
      
      public static function scrollChars(ex:*, ey:*, ez:*, shakeX:*, shakeY:*) : void
      {
         for(var i:uint = 0; i < CharArray.length; i++)
         {
            CharArray[i].scrollChar(ex,ey,ez,shakeX,shakeY);
         }
      }
      
      public static function quickShowGamepads() : void
      {
         for(var i:int = 0; i < ActiveCharArray.length; i++)
         {
            ActiveCharArray[i].quickShowGamepad();
         }
      }
      
      public static function sendGamepadVectors(controls:Array) : void
      {
         for(var n:uint = 0; n < CharArray.length; n++)
         {
            if(CharArray[n].hasGamepad)
            {
               CharArray[n].gamepadControls = controls[CharArray[n].gamepadNum];
            }
         }
      }
      
      public static function addGamepads(gamepadid:String, gamepadname:String, gamepadnum:uint) : Boolean
      {
         var i:int = 0;
         if(CharN == 1)
         {
            if(!CharArray[0].hasGamepad)
            {
               if(CharArray[0].addGamepad(gamepadid,gamepadname,gamepadnum))
               {
                  return true;
               }
            }
         }
         else
         {
            for(i = 0; i < CharArray.length; i++)
            {
               if(!CharArray[i].hasGamepad)
               {
                  if(CharArray[i].addGamepad(gamepadid,gamepadname,gamepadnum))
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      public static function removeGamepads(gamepadnum:uint) : void
      {
         for(var i:int = 0; i < CharArray.length; i++)
         {
            if(CharArray[i].gamepadNum == gamepadnum)
            {
               CharArray[i].hasGamepad = false;
               break;
            }
         }
         shuffleControls();
      }
      
      public static function setupAllGamepads(id:uint) : void
      {
         for(var i:int = 0; i < CharArray.length; i++)
         {
            if(CharArray[i].hasGamepad)
            {
               CharArray[i].setupMyGamepad(CharArray[i].gamepadName);
            }
            else if(CharArray[i].addGamepad(Main.stageRoot.workerGamepadID[id],Main.stageRoot.workerGamepadName[id],id))
            {
               Main.stageRoot.workerGamepadBinded[id] = true;
               break;
            }
         }
      }
      
      public static function saveWallRots() : void
      {
         for(var i:int = 0; i < ActiveCharArray.length; i++)
         {
            if(ActiveCharArray[i].onGround)
            {
               ActiveCharArray[i].oldWallRot = ActiveCharArray[i].wallRot;
            }
         }
      }
      
      public static function EveryCollisions() : void
      {
         for(var i:int = 0; i < ActiveCharArray.length; i++)
         {
            ActiveCharArray[i].myCollisions();
         }
         for(i = 0; i < ActiveCharArray.length; i++)
         {
            ActiveCharArray[i].tickX = ActiveCharArray[i].x;
            ActiveCharArray[i].tickY = ActiveCharArray[i].y;
         }
      }
      
      public static function suppressAll() : *
      {
         for(var i:int = 0; i < ActiveCharArray.length; i++)
         {
            ActiveCharArray[i].suppressJump = true;
         }
      }
      
      public static function checkClosest(ex:int, ey:int, rail:uint) : int
      {
         var dist:int = 1000;
         var which:uint = 0;
         for(var i:uint = 0; i < ActiveCharArray.length; i++)
         {
            if(ActiveCharArray[i].onRail == rail && ActiveCharArray[i].y - ey < 500)
            {
               if(Math.abs(ActiveCharArray[i].x - ex) < Math.abs(dist))
               {
                  which = i;
                  dist = ActiveCharArray[i].x - ex;
               }
            }
         }
         return dist;
      }
      
      public static function findClosest(ex:int, ey:int, rail:uint) : Char
      {
         var which:uint = 0;
         var dist:int = 10000;
         for(var i:uint = 0; i < ActiveCharArray.length; i++)
         {
            if(ActiveCharArray[i].onRail == rail && Math.abs(ActiveCharArray[i].x - ex) < Math.abs(dist))
            {
               which = i;
               dist = ActiveCharArray[i].x - ex;
            }
         }
         return ActiveCharArray[which];
      }
      
      public static function checkAttackFromBad(ex:*, ey:*, distX:*, distY:*, facing:*, angle:*, power:*) : Boolean
      {
         var dist:int = 0;
         for(var i:uint = 0; i < ActiveCharArray.length; i++)
         {
            if(ActiveCharArray[i].alpha == 1 && ActiveCharArray[i].health > 0)
            {
               dist = ActiveCharArray[i].x - ex;
               if(dist * facing > 0)
               {
                  if(Math.abs(dist) < distX && Math.abs(ActiveCharArray[i].y - ey) < distY + ActiveCharArray[i].isTall)
                  {
                     StarlingEffect.Spawn("impactEffect",ActiveCharArray[i].x,ActiveCharArray[i].y,120 * facing,1,0,0,ActiveCharArray[i].onRail);
                     ActiveCharArray[i].hurtChar(25,30,7,ActiveCharArray[i].makeOne(dist) * power,10);
                     ActiveCharArray[i].head.transform.colorTransform = ActiveCharArray[i].transform.colorTransform = Main.getTint(1,-0.6,-0.6);
                     ActiveCharArray[i].RedHurt = 6;
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      public static function CharsCheckMoving() : *
      {
         for(var i:int = 0; i < CharArray.length; i++)
         {
            CharArray[i].CheckMovingStuff();
         }
      }
      
      public static function forceStopLoops() : void
      {
         for(var i:int = 0; i < ActiveCharArray.length; i++)
         {
            if(ActiveCharArray[i].currentSound != null)
            {
               Sounds.stopSound(ActiveCharArray[i].currentSound);
               ActiveCharArray[i].currentSound = null;
            }
         }
      }
      
      public static function HalfCharSwitchAnims() : *
      {
         for(var i:int = 0; i < ActiveCharArray.length; i++)
         {
            ActiveCharArray[i].Vanity(ActiveCharArray[i].coreSwitchAnim());
         }
      }
      
      public static function CharsFinishUp() : void
      {
         for(var i:uint = 0; i < ActiveCharArray.length; i++)
         {
            ActiveCharArray[i].coreSwitchAnim();
         }
         for(i = 0; i < ActiveCharArray.length; i++)
         {
            ActiveCharArray[i].charFinishUp();
         }
      }
      
      public static function shufflePlayers() : *
      {
         var temp:int = 0;
         for(var i:int = 0; i < CharArray.length; i++)
         {
            temp = CharArray[i].onRail;
            CharArray[i].onRail = -1;
            CharArray[i].changeRails(temp);
         }
      }
      
      public static function clearAllChars() : *
      {
         return false;
      }
      
      public static function checkActiveChars() : uint
      {
      }
      
      public static function findWinner() : int
      {
         var tempNode:int = -1;
         var winning:uint = 0;
         for(i = 0; i < Char.ActiveCharArray.length; ++i)
         {
            Char.ActiveCharArray[i].cameraMaster = false;
            if(i != winning && Char.ActiveCharArray[i].myNode == tempNode)
            {
               if(progressNode.findNextDist(Char.ActiveCharArray[i].x,Char.ActiveCharArray[i].y,Char.ActiveCharArray[i].myNode + 1) < progressNode.findNextDist(Char.ActiveCharArray[winning].x,Char.ActiveCharArray[winning].y,Char.ActiveCharArray[winning].myNode + 1))
               {
                  winning = uint(i);
               }
            }
            else if(Char.ActiveCharArray[i].myNode > tempNode)
            {
               winning = uint(i);
               tempNode = Char.ActiveCharArray[i].myNode;
            }
         }
         Char.ActiveCharArray[winning].cameraMaster = true;
         return winning;
      }
      
      public static function checkInactives() : void
      {
         if(Main.numPlayers == 1 && CharArray.length > 0)
         {
            ActiveCharArray = new Vector.<Char>(0);
            InactiveCharArray = new Vector.<Char>(0);
            ActiveCharArray[0] = CharArray[0];
         }
      }
      
      public static function checkHealths() : void
      {
         var i:* = 0;
         if(ActiveCharArray.length == 1)
         {
            if(ActiveCharArray[0].health < 0)
            {
               for(i = 0; i < InactiveCharArray.length; i++)
               {
                  if(InactiveCharArray[i].lives > -1)
                  {
                     ActiveCharArray.push(InactiveCharArray[i]);
                  }
               }
               InactiveCharArray = new Vector.<Char>(0);
            }
            for(i = 0; i < ActiveCharArray.length; i++)
            {
               if(ActiveCharArray[i].health < 0)
               {
                  ActiveCharArray[i].updateInk(ActiveCharArray[i].inkMax);
                  ActiveCharArray[i].health = ActiveCharArray[i].healthMax;
               }
            }
         }
         else
         {
            for(i = int(ActiveCharArray.length - 1); i > -1; i--)
            {
               if(ActiveCharArray[i].health <= 0)
               {
                  ActiveCharArray[i].gotoBuffer = "Dead";
                  ActiveCharArray[i].coreSwitchAnim();
               }
            }
         }
         for(i = int(CharArray.length - 1); i > -1; i--)
         {
            Char.CharArray[i].smashDamage = 0;
            Char.CharArray[i].smashLives = 3;
         }
      }
      
      public static function GameOver() : void
      {
         for(var i:int = 0; i < CharArray.length; i++)
         {
            CharArray[i].landSlow = true;
            Main.localSettings.lives = CharArray[i].lives = 3;
         }
         checkHealths();
         StarlingInteract.dontCheat = [];
         Main.GameOver();
      }
      
      public static function pauseCurrentLoop() : void
      {
         for(var i:int = 0; i < CharArray.length; i++)
         {
            if(CharArray[i].currentSound != null)
            {
               Sounds.stopSound(CharArray[i].currentSound);
               CharArray[i].currentSound = null;
            }
         }
      }
      
      public static function setAllSuperStill(still:Boolean) : *
      {
         for(var i:int = 0; i < CharArray.length; i++)
         {
            CharArray[i].Still = CharArray[i].superStill = still;
         }
      }
      
      public static function transOffsets(ex:Number, ey:Number, rail:int, delay:int, eRL:Number, eUD:Number) : void
      {
         for(var n:uint = 0; n < Char.ActiveCharArray.length; n++)
         {
            ActiveCharArray[n].transOffset(ex,ey,rail,delay,eRL,eUD);
         }
      }
      
      public static function givePens() : void
      {
         var i:int = 0;
         if(!hasPen)
         {
            hasPen = true;
            for(i = 0; i < CharArray.length; i++)
            {
               CharArray[i].givePen();
            }
         }
      }
      
      public static function takePens() : void
      {
         var i:int = 0;
         if(hasPen)
         {
            hasPen = false;
            for(i = 0; i < CharArray.length; i++)
            {
               CharArray[i].takePen();
            }
         }
      }
      
      public static function giveShoot() : void
      {
         rootHUD.HUD.showBars();
         Main.localSettings.hasShoot = hasShoot = true;
         Main.parse_saveSettings();
      }
      
      public static function giveZip() : void
      {
         Main.localSettings.hasZip = hasZip = true;
         if(!hasShoot)
         {
            giveShoot();
         }
         Main.parse_saveSettings();
      }
      
      public static function forceAllBitmaps(e:Boolean) : void
      {
         for(var i:int = 0; i < CharArray.length; i++)
         {
            CharArray[i].forcingBitmap = e;
         }
      }
      
      public static function countUnlockables(str:*) : *
      {
         var n:int = 0;
         for(var i:uint = 0; i < Main.localSettings["has" + str + "String"].length; i++)
         {
            if(Main.localSettings["has" + str + "String"].substr(i,1) == "y")
            {
               n++;
            }
         }
         Main.kongStats("has" + str,n);
         Achievements.SendScore("has" + str,n);
         if(str == "Hats")
         {
            if(n >= 9)
            {
               Main.achievement("hasAllHats");
            }
         }
         else if(str == "Pants" || str == "Patterns")
         {
            if(n >= 3)
            {
               Main.achievement("hasAll" + str);
            }
         }
      }
      
      override public function firstCircleCheck(ex:*, ey:*, eUD:*) : *
      {
         return testOnlyGround(ex,ey);
      }
      
      override public function secondCircleCheck(ex:*, ey:*, eUD:*) : *
      {
         return testAllGrounds(ex,ey);
      }
      
      public function getKeyboardKeys(id:*) : void
      {
         this.rootRightIsDown = [-1,39,72,102][id];
         this.rootLeftIsDown = [-1,37,70,100][id];
         this.rootUpIsDown = [-1,38,84,104][id];
         this.rootDownIsDown = [-1,40,71,101][id];
         this.rootJumpIsDown = [-1,83,76,107][id];
         this.rootAttackIsDown = [-1,65,75,109][id];
         this.rootSpecialIsDown = [-1,68,77,110][id];
         this.rootSpecial2IsDown = [-1,16,77,110][id];
      }
      
      private function cleanChar() : void
      {
         var i:String = null;
         DisabledArray.push(this);
         if(ActiveCharArray.indexOf(this) > -1)
         {
            ActiveCharArray.removeAt(ActiveCharArray.indexOf(this));
         }
         if(InactiveCharArray.indexOf(this) > -1)
         {
            InactiveCharArray.removeAt(InactiveCharArray.indexOf(this));
         }
         for(i in this.charClips)
         {
            this.charClips[i].parent.removeChild(this.charClips[i]);
         }
         this.charClips = new Object();
         parent.visible = false;
         parent.parent.removeChild(parent);
      }
      
      public function reEnableChar() : void
      {
         CharArray.push(this);
         ActiveCharArray.push(this);
         parent.visible = true;
         CharN = this.ID + 1;
         health = healthMax;
         this.landSlow = false;
      }
      
      internal function RightIsDown() : Boolean
      {
         return this.fakeRightIsDown && !this.fakeLeftIsDown;
      }
      
      internal function LeftIsDown() : Boolean
      {
         return this.fakeLeftIsDown && !this.fakeRightIsDown;
      }
      
      internal function UpIsDown() : Boolean
      {
         return this.fakeUpIsDown && !this.fakeDownIsDown || this.gamepadUD < -0.5;
      }
      
      internal function DownIsDown() : Boolean
      {
         return this.fakeDownIsDown && !this.fakeUpIsDown || this.gamepadUD > 0.5;
      }
      
      internal function JumpIsDown() : Boolean
      {
         return this.fakeJumpIsDown || Boolean(this.gamepadJump);
      }
      
      internal function AttackIsDown() : Boolean
      {
         return this.fakeAttackIsDown || Boolean(this.gamepadAttack);
      }
      
      internal function SpecialIsDown() : Boolean
      {
         return this.fakeSpecialIsDown || Boolean(this.gamepadSpecial);
      }
      
      internal function Special2IsDown() : Boolean
      {
         return this.fakeSpecial2IsDown || Boolean(this.gamepadSpecial2);
      }
      
      internal function drawWeapon(e:*) : *
      {
         return e;
      }
      
      internal function canAttackAgain(label:*, n:*) : *
      {
         var temp:int = 0;
         switch(label)
         {
            case "Swipe1":
               temp = 5;
               break;
            case "Swipe2":
               temp = 6;
               break;
            case "Swipe3":
               temp = 8;
               break;
            case "Swipe4":
               temp = 10;
               break;
            case "Medium1":
            case "Medium2":
            case "Rising":
               if(this.AisDown)
               {
                  temp = 100;
               }
               else if(this.justAttackHit)
               {
                  temp = 10;
               }
               else
               {
                  temp = 15;
               }
               break;
            case "Heavy1":
               if(this.justAttackHit)
               {
                  temp = 15;
               }
               else
               {
                  temp = 20;
               }
               break;
            case "HeavyUp":
            case "HeavyDown":
               if(this.justAttackHit)
               {
                  temp = 15;
               }
               else
               {
                  temp = 20;
               }
               break;
            case "SwipeUp":
               if(this.justAttackHit)
               {
                  temp = 10;
               }
               else
               {
                  temp = 15;
               }
               break;
            case "PokeDown":
               if(Status == "Pencil")
               {
                  temp = 32;
               }
               else
               {
                  temp = 18;
               }
               break;
            default:
               return false;
         }
         return n > temp;
      }
      
      internal function canMoveAgain(label:*, n:*) : *
      {
         var temp:int = 0;
         switch(label)
         {
            case "Swipe1":
            case "Swipe2":
            case "Swipe3":
            case "Swipe4":
            case "SwipeUp":
               temp = 10;
               break;
            case "Medium1":
            case "Medium2":
               if(this.justAttackQuick)
               {
                  temp = 8;
               }
               else if(this.justAttackHit)
               {
                  temp = 16;
               }
               else
               {
                  temp = 20;
               }
               break;
            case "Rising":
            case "BuzzSaw":
               temp = 0;
               break;
            case "Heavy1":
            case "HeavyUp":
               if(this.justAttackHit)
               {
                  temp = 18;
               }
               else
               {
                  temp = 25;
               }
               break;
            case "PokeDown":
               if(Status == "Pencil")
               {
                  temp = 25;
               }
               else
               {
                  temp = 16;
               }
               break;
            default:
               return false;
         }
         return n > temp;
      }
      
      private function canJumpFromStomp() : Boolean
      {
         if(StompedOn.ItIs == "Char")
         {
            return true;
         }
         if(StompedOn.springTall + StompedOn.spring > StompedOn.originalSpringTall * 1)
         {
            return true;
         }
         if(StompedOn.ItIs == "JumpPad")
         {
            return false;
         }
         if(!this.JumpIsDown() && this.char.currentFrame > 2)
         {
            return true;
         }
         if(this.char.currentFrame > 3)
         {
            return true;
         }
         return false;
      }
      
      private function myEnterFrames() : void
      {
         var temp:Boolean = false;
         if(RedHurt > 0)
         {
            if(RedHurt == 1)
            {
               transform.colorTransform = Main.getColorTransform(this.pantsN);
               this.head.transform.colorTransform = Main.getTint(0,0,0);
            }
            --RedHurt;
         }
         if(!this.puppet)
         {
            if(hitPause > 0)
            {
               if(Math.abs(shakeRL) > 1)
               {
                  if(Status == "Hurt")
                  {
                     if(this.hairGel < 157)
                     {
                        ++this.hairGel;
                        this.head.gotoAndStop(this.hairGel);
                        this.char.nextFrame();
                     }
                  }
                  this.char.x = shakeRL / 2;
                  this.placeHead(this.char);
                  this.headx += shakeRL / 2;
                  shakeRL *= -0.8;
               }
               if(Status == "Pencil" || Status == "PencilAir")
               {
                  if(this.AttackIsDown() && !this.AisDown)
                  {
                     this.quickAttack = true;
                  }
               }
            }
            else
            {
               if(shakeRL != 0)
               {
                  this.char.x = 0;
                  shakeRL = 0;
                  this.placeHead(this.char);
               }
               this.controlStuff();
               temp = this.cameraEnterFrame();
               this.slopeStuff(temp);
               if(this.SuperAction())
               {
                  if(!this.ActionStuff())
                  {
                     this.CharEnterFrame();
                  }
               }
               else
               {
                  this.CharEnterFrame();
               }
               if(temp)
               {
                  this.tiltChar();
               }
               springBounce();
               if(downTime > 0)
               {
                  --downTime;
               }
            }
         }
         if(Status != "Hurt" && alpha < 1 && alpha > 0.3)
         {
            alpha += 0.005;
            this.head.alpha += 0.005;
            if(alpha > 0.85)
            {
               alpha = 1;
               this.head.alpha = 1;
            }
         }
         if(pushingScreen)
         {
            if(Main.isOnStage(this.x,this.y,onRail))
            {
               this.offScreenCounter = 30;
            }
            else if(this.offScreenCounter > 0)
            {
               --this.offScreenCounter;
            }
            else if(Main.FadeClip != null)
            {
               this.offScreenCounter = 30;
            }
            else
            {
               this.offScreenCounter = 100;
               this.superHurtChar(0);
            }
         }
         else
         {
            this.offScreenCounter = 30;
         }
      }
      
      private function scrollChar(camX:*, camY:*, ez:*, shakeX:*, shakeY:*) : void
      {
         var ex:Number = NaN;
         var ey:Number = NaN;
         var mCos:Number = NaN;
         var mSin:Number = NaN;
         this.ratio = cameraFocalLength / (cameraFocalLength + this.cameraZ - ez);
         if(this.charVector)
         {
            parent.x = realStageX - camX * (this.ratio * overRatio) + shakeX;
            parent.y = realStageY - camY * (this.ratio * overRatio) + shakeY;
            parent.scaleX = parent.scaleY = this.ratio * overRatio;
         }
         else
         {
            ex = realStageX - (camX - this.x) * this.ratio * overRatio + shakeX;
            ey = realStageY - (camY - this.y) * this.ratio * overRatio + shakeY;
            StarlingBackgrounds.placeCharBitmap(ex,ey,rotation * this.quickRadian,this.ratio * overRatio,this.ID);
            if(this.Slash != null && this.Slash.scaleX * scaleX > 0)
            {
               this.Slash.x = ex;
               this.Slash.y = ey;
               this.Slash.scaleX = scaleX * this.ratio * overRatio;
               this.Slash.scaleY = this.ratio * overRatio;
               this.Slash.rotation = rotation * this.quickRadian;
            }
            angle = rotation * this.quickRadian;
            mCos = Math.cos(angle);
            mSin = Math.sin(angle);
            ex = camX - this.x - mCos * this.pencilX + mSin * this.pencilY;
            ey = camY - this.y - mCos * this.pencilY - mSin * this.pencilX;
            ex = realStageX - ex * this.ratio * overRatio + shakeX;
            ey = realStageY - ey * this.ratio * overRatio + shakeY;
            StarlingBackgrounds.placePencilBitmap(ex,ey,this.pencilRot * this.quickRadian + angle,this.ratio * overRatio,this.Pencil.scaleY * this.ratio * overRatio,this.ID);
         }
      }
      
      public function forceGamepads() : void
      {
         this.controlStuff();
         if(wantRL == 0)
         {
            wantRL = this.gamepadRL;
         }
      }
      
      public function quickShowGamepad() : void
      {
         if(this.hasGamepad)
         {
            axis.x = 50 + this.Gamepad.getControlAt(this.padX).value * 30;
            axis.y = 150 + this.Gamepad.getControlAt(this.padY).value * this.controlSwapY * 30;
            if(this.Gamepad.getControlAt(this.padAttack).value > 0)
            {
               this.gamepadAttack = true;
            }
            if(this.Gamepad.getControlAt(this.padJump).value > 0)
            {
               this.gamepadJump = true;
            }
            if(Boolean(this.gamepadAttack) || Boolean(this.gamepadJump))
            {
               Main.stageRoot.parent.axis.gotoAndStop(2);
            }
            else
            {
               Main.stageRoot.parent.axis.gotoAndStop(1);
            }
         }
      }
      
      private function CheckGamepads() : void
      {
         if(this.hasGamepad)
         {
            if(this.gamepadControls == null)
            {
               trace("controls missing");
               return;
            }
            if(!this.usingGamepad)
            {
               if(Math.abs(this.gamepadControls[this.padX] + this.gamepadControls[this.padRight] + this.gamepadControls[this.padLeft]))
               {
                  rootHUD.usingGamepad = this.usingGamepad = true;
                  rootHUD.HUD.buttonsVisible(false);
                  Main.switchTouchscreen(false);
               }
            }
            if(this.hasAnalog)
            {
               this.gamepadTempX = this.gamepadControls[this.padX];
               this.gamepadTempY = this.gamepadControls[this.padY] * this.controlSwapY;
               this.dpadTempX = Math.abs(this.gamepadControls[this.padRight]) - Math.abs(this.gamepadControls[this.padLeft]);
               this.dpadTempY = Math.abs(this.gamepadControls[this.padDown]) - Math.abs(this.gamepadControls[this.padUp]);
               if(Status == "InkBoard")
               {
                  if(this.dpadTempX != 0)
                  {
                     this.gamepadTempX = this.dpadTempX;
                  }
                  if(this.dpadTempY != 0)
                  {
                     this.gamepadTempY = this.dpadTempY;
                  }
                  if(Math.abs(this.gamepadTempX) > this.padDeadzone * 0.2 || Math.abs(this.gamepadTempY) > this.padDeadzone * 0.2)
                  {
                     this.gamepadRL = this.gamepadTempX;
                     this.gamepadUD = this.gamepadTempY;
                  }
               }
               else
               {
                  if(this.hasAnalogDpad)
                  {
                     if(this.dpadTempX != 0)
                     {
                        this.gamepadTempX = this.dpadTempX * 5 + makeOne(this.dpadTempX) * 0.2;
                     }
                     if(this.dpadTempY != 0)
                     {
                        this.gamepadTempY = this.dpadTempY * 5 + makeOne(this.dpadTempY) * 0.2;
                     }
                     if(Math.abs(this.dpadTempY) < this.dPadDeadzone)
                     {
                        this.dpadTempY = 0;
                     }
                  }
                  if(Math.abs(this.gamepadTempX) > this.padDeadzone || Math.abs(this.gamepadTempY) > this.padDeadzone)
                  {
                     if(onGround && Math.abs(wallRot) > 35 && wallRot * wantRL < 0 && this.gamepadTempY < 0)
                     {
                        this.followStick = true;
                     }
                     if(this.followStick)
                     {
                        this.gamepadRot = -Math.atan2(-this.gamepadTempX,-this.gamepadTempY) / this.quickRadian;
                        if(Math.abs(this.gamepadRot) < 65)
                        {
                           this.gamepadTempX = Math.sqrt(this.gamepadTempX * this.gamepadTempX + this.gamepadTempY * this.gamepadTempY) * makeOne(fakeRL);
                           this.gamepadTempY = 0;
                           this.controlSwap = 1;
                        }
                        else if(Math.abs(this.oGamepadRot) < 65)
                        {
                           this.controlSwap = -1;
                        }
                        if(Math.abs(rotCompare(this.oGamepadRot,this.gamepadRot)) > 20)
                        {
                           this.followStick = false;
                        }
                        this.oGamepadRot = this.gamepadRot;
                     }
                  }
                  else
                  {
                     this.followStick = false;
                  }
                  if(this.dpadTempX != 0)
                  {
                     this.gamepadRL = this.gamepadTempX;
                  }
                  else if(Math.abs(this.gamepadTempX) > this.padDeadzone)
                  {
                     this.gamepadRL = this.gamepadTempX / this.padRange * 1.5 - makeOne(this.gamepadTempX) * this.padDeadzone;
                  }
                  if(Math.abs(this.gamepadRL) > 1)
                  {
                     this.gamepadRL = makeOne(this.gamepadRL);
                  }
                  if(this.dpadTempY != 0)
                  {
                     this.gamepadUD = this.gamepadTempY;
                  }
                  else if(Math.abs(this.gamepadTempY) > this.padDeadzone)
                  {
                     this.gamepadUD = this.gamepadTempY / this.padRange * 1.5 - makeOne(this.gamepadTempY) * this.padDeadzone;
                  }
                  if(Math.abs(this.gamepadUD) > 1)
                  {
                     this.gamepadUD = makeOne(this.gamepadUD);
                  }
               }
            }
            if(this.hasDpad)
            {
               if(this.gamepadControls[this.padLeft] > 0)
               {
                  this.gamepadRL = -1;
               }
               if(this.gamepadControls[this.padRight] > 0)
               {
                  this.gamepadRL = 1;
               }
               if(this.gamepadControls[this.padUp] > 0)
               {
                  this.gamepadUD = -1;
               }
               if(this.gamepadControls[this.padDown] > 0)
               {
                  this.gamepadUD = 1;
               }
            }
            if(this.gamepadControls[this.padAttack] > 0)
            {
               this.gamepadAttack = true;
            }
            if(this.gamepadControls[this.padJump] > 0)
            {
               this.gamepadJump = true;
            }
            if(this.gamepadControls[this.padSpecial] > 0.2)
            {
               this.gamepadSpecial = true;
               this.attackUD = 0;
            }
            if(this.gamepadControls[this.padSpecial2] > 0.2)
            {
               this.gamepadSpecial2 = true;
               this.attackUD = 0;
            }
            if(this.gamepadControls[this.padStart] == 0)
            {
               this.padStartIsDown = false;
            }
            if(Main.pauseStatus == "nothing")
            {
               if(this.padStart > 0 && this.gamepadControls[this.padStart] > 0 && !this.padStartIsDown)
               {
                  this.padStartIsDown = true;
                  Main.PauseGame(true,this.ID);
               }
            }
            else
            {
               if(this.gamepadControls[this.padStart] > 0 && !this.padStartIsDown)
               {
                  this.padStartIsDown = true;
                  if(Main.pauseStatus == "Menu" && PauseMenu.bubble == null)
                  {
                     Main.unPauseGame();
                  }
                  else if(Main.pauseStatus == "tutorial")
                  {
                     Main.stageRoot.unTutorialGame();
                  }
                  else if(Main.pauseStatus == "Key")
                  {
                     Main.unKeyGame();
                  }
               }
               if(Main.pauseStatus == "Menu")
               {
                  if(this.gamepadControls[this.padJump] > 0)
                  {
                     if(!this.SisDown)
                     {
                        if(PauseMenu.pausemenu.selectorCat == "Map")
                        {
                           Main.LoadIt = "MapScreen";
                        }
                        Main.unPauseGame();
                        this.SisDown = true;
                     }
                  }
                  else
                  {
                     this.SisDown = false;
                  }
               }
            }
         }
      }
      
      public function addGamepad(gamepadid:String, gamepadname:String, gamepadnum:uint) : Boolean
      {
         if(!this.setupMyGamepad(gamepadname))
         {
            return false;
         }
         this.gamepadID = gamepadid;
         this.gamepadName = gamepadname;
         this.gamepadNum = gamepadnum;
         this.usingGamepad = this.hasGamepad = true;
         if(isTouchScreen)
         {
            rootHUD.HUD.buttonsVisible(false);
            Main.switchTouchscreen(false);
         }
         shuffleControls();
         return true;
      }
      
      public function removeGamepad() : *
      {
         trace(this.gamepadID + " unbinded from char # " + this.ID);
         rootHUD.spawnPopup("Gamepad Removed");
         if(isTouchScreen)
         {
            rootHUD.HUD.buttonsVisible(true);
            Main.switchTouchscreen(true);
         }
         this.Gamepad.enabled = this.hasGamepad = false;
         this.Gamepad = null;
         shuffleControls();
      }
      
      private function setupMyGamepad(padName:String) : Boolean
      {
         var controls:Array = setupGamepad.getLayout(padName);
         this.padRange = setupGamepad.getRange(padName);
         if(controls.length == 0)
         {
            return false;
         }
         for(var i:uint = 0; i < controls.length; i++)
         {
            this.gamepadButtons[i] = controls[i];
         }
         while(this.gamepadButtons.length < 13)
         {
            this.gamepadButtons[this.gamepadButtons.length] = undefined;
         }
         if(controls[0] != undefined)
         {
            this.hasAnalog = true;
         }
         if(this.hasAnalogDpad)
         {
            this.hasDpad = false;
         }
         else
         {
            this.hasDpad = controls[2] != undefined;
         }
         this.padDeadzone = this.padRange * 0.4;
         if(this.gamepadButtons[1] < 0)
         {
            this.controlSwapY = -1;
         }
         else
         {
            this.controlSwapY = 1;
         }
         if(Main.deviceID == "AppleTV")
         {
            this.dPadDeadzone = 0.6;
         }
         else
         {
            this.dPadDeadzone = 0;
         }
         this.padX = this.gamepadButtons[0];
         this.padY = Math.abs(this.gamepadButtons[1]);
         this.padUp = this.gamepadButtons[2];
         this.padDown = this.gamepadButtons[3];
         this.padLeft = this.gamepadButtons[4];
         this.padRight = this.gamepadButtons[5];
         this.padAttack = this.gamepadButtons[6];
         this.padJump = this.gamepadButtons[7];
         this.padSpecial = this.gamepadButtons[8];
         this.padSpecial2 = this.gamepadButtons[9];
         this.padStart = this.gamepadButtons[10];
         this.padReset = this.gamepadButtons[11];
         this.padRefresh = this.gamepadButtons[12];
         return true;
      }
      
      private function myCollisions() : void
      {
         if(!this.puppet)
         {
            if(!this.superHurt)
            {
               if(hitPause > 0)
               {
                  CheckAllPaused();
               }
               else
               {
                  canStatus = "nothing";
                  switch(Status)
                  {
                     case "Roll":
                        CheckAllAir();
                        if(!this.checkPit())
                        {
                           if(canStatus == "Hang" && gotoBuffer == "Duck")
                           {
                              rotation = wallRot;
                              rotter = 0;
                              fakeRL = moveRL;
                              gotoBuffer = "Hang";
                           }
                           else if(canStatus == "Grind")
                           {
                              if(landSpeed * 0.7 > Math.abs(moveRL))
                              {
                                 fakeRL = landSpeed * makeOne(moveRL) * 0.7;
                              }
                              rotation -= rotCompare(rotation,wallRot) * 0.5;
                              rotter = 0;
                              gotoBuffer = "GrindSlide";
                           }
                        }
                        break;
                     case "Stomp":
                        if(this.toOnRail > -1)
                        {
                           this.hitGround = 60;
                           this.RailGuide();
                        }
                        this.StompGuide();
                        break;
                     case "Jump":
                     case "Kick":
                     case "Hurt":
                     case "FallCat":
                     case "PencilAir":
                     case "ShootAir":
                        if(this.toOnRail > -1)
                        {
                           this.RailGuide();
                        }
                        this.JumpGuide();
                        break;
                     case "Zip":
                     case "ZipAir":
                        if(gotoBuffer == "nothing")
                        {
                           CheckAllZip();
                        }
                        else
                        {
                           CheckAllAir();
                        }
                        break;
                     case "DoorOut":
                        this.checkAfterMove();
                        break;
                     case "Disabled":
                        break;
                     case "LedgeHang":
                        this.LedgeHangGuide();
                        break;
                     case "InkBoard":
                        this.InkBoardGuide();
                        break;
                     case "SlidePole":
                        this.SlidePoleGuide();
                        break;
                     case "Skateboard":
                        this.SkateboardGuide();
                        break;
                     case "enterBox":
                     case "SlidePole":
                        this.CheckInteracts();
                     case "PencilGet":
                     case "Fly":
                        this.simpleGuide();
                        break;
                     case "Grabbed":
                        this.GrabbedGuide();
                        break;
                     default:
                        this.RLStatus = this.RLFunc(false,false,this.ledgeGrab,false);
                  }
                  if(netMaster)
                  {
                     this.deepArray = [];
                     this.goDeeper(this.char);
                     myNetwork.sendToNetwork([this.x,this.y,moveRL,moveUD,scaleX,rotation,this.headx,this.heady,this.headrot,this.head.scaleX,this.head.currentFrame,Status,this.char.currentFrame,this.deepArray]);
                  }
                  this.groundY += this.groundYUD * framin;
                  this.cameraStuff();
               }
            }
         }
      }
      
      private function goDeeper(mc:MovieClip) : void
      {
         for(var i:uint = 0; i < mc.numChildren; )
         {
            if(mc.getChildAt(i) is MovieClip && mc.getChildAt(i).totalFrames > 1)
            {
               this.deepArray.push(mc.getChildAt(i).name);
               this.deepArray.push(mc.getChildAt(i).currentFrame);
               this.goDeeper(mc.getChildAt(i));
               break;
            }
            i++;
         }
      }
      
      public function charCheckChars() : *
      {
         var char2:Char = null;
         if(isAttacking)
         {
            if(this.char.pencil == undefined)
            {
               trace("no pencil " + Status);
               this.stopAttacking();
               return;
            }
            this.pencilTipX = this.char.x + (this.char.pencil.x + rotX(50,this.char.pencil.rotation)) * scaleX;
         }
         for(var i:int = 0; i < ActiveCharArray.length; i++)
         {
            if(this.ID != ActiveCharArray[i].ID && onRail == ActiveCharArray[i].onRail && ActiveCharArray[i] != "Disabled")
            {
               if(isAttacking)
               {
                  if(this.justHitArray.indexOf(ActiveCharArray[i]) == -1 && this.CheckAttack(ActiveCharArray[i]))
                  {
                     this.justHitArray.push(ActiveCharArray[i]);
                     if(Status == "PencilAir" && moveUD > -5)
                     {
                        moveRL *= 0.5;
                        moveUD = -5;
                        initialFloat = FloatUp = 4;
                        this.FloatStill = true;
                     }
                     this.justAttackHit = true;
                  }
               }
               if(Math.abs(this.x - ActiveCharArray[i].x) < isWide + ActiveCharArray[i].isWide + 20 && Math.abs(this.y - ActiveCharArray[i].y) < isTall + ActiveCharArray[i].isTall)
               {
                  char2 = ActiveCharArray[i];
                  if(Status == "Roll")
                  {
                     if(char2.Status == "Duck")
                     {
                        char2.bounce = 0.5;
                        char2.bounceThresh = 10;
                        char2.Status = "Roll";
                        char2.changeFrame("Roll");
                        char2.char.gotoAndStop(1);
                        char2.CharEnterFrame = char2.RollEnterFrame;
                        char2.placeHead(char2.char);
                     }
                     if(char2.Status == "Roll")
                     {
                        solveBalls(this,char2);
                        return true;
                     }
                  }
                  else if(Status != "enterBox" && Status != "Hurt" && (char2.Status == "Roll" || char2.Status == "Duck" || char2.Status == "Hurt"))
                  {
                     if(char2.downTime == 0)
                     {
                        angle = char2.rotation * this.quickRadian;
                        distRL = char2.x - this.x;
                        distUD = char2.y - this.y;
                        ax = Math.cos(angle) * distRL + Math.sin(angle) * distUD;
                        ay = Math.cos(angle) * distUD - Math.sin(angle) * distRL;
                        if(char2.standardBeABall(this.x,this.y,moveRL,moveUD,ax,ay,this) == "Hit")
                        {
                           Main.popBetween(this,char2);
                           char2.springBounce();
                           Main.shakeRL *= 3;
                           char2.smokeN = 0;
                           char2.smokeB = 20;
                           char2.canQuickDrop = true;
                           Sounds.playSound("BadStomp",char2.x,getSpeed(char2.moveRL,char2.moveUD) * 0.03,onRail);
                           if(char2.Status == "Duck")
                           {
                              char2.bounce = 0.5;
                              char2.bounceThresh = 10;
                              char2.Status = "Roll";
                              char2.changeFrame("Roll");
                              char2.char.gotoAndStop(1);
                              char2.CharEnterFrame = char2.RollEnterFrame;
                              char2.placeHead(char2.char);
                           }
                        }
                     }
                  }
                  else if(Status == "DownSlide")
                  {
                     if(char2.downTime == 0)
                     {
                        char2.angle = wallAngle * 0.5;
                        char2.tempRL = 5 * makeOne(fakeRL);
                        char2.tempUD = -char2.smashKnockback(5 + Math.abs(fakeRL) * 1.5);
                        Main.shakeScreen(-char2.tempUD / 5,0,true);
                        char2.shakeRL = -char2.tempUD;
                        char2.damageChar(5 + Math.abs(fakeRL) * 1.5);
                        Sounds.playSound("BadStomp",this.x,Math.abs(fakeRL) * 0.2,onRail);
                        char2.rotter = -fakeRL * rotPerc;
                        char2.downTime = 5;
                        if(tempUD > -30)
                        {
                           char2.landQuick = true;
                        }
                        if(char2.Status == "DownSlide")
                        {
                           downTime = 5;
                           rotter = -char2.fakeRL * rotPerc;
                           shakeRL = -tempUD;
                           angle = char2.wallAngle * 0.5;
                           tempRL = 5 * makeOne(char2.fakeRL);
                           tempUD = -this.smashKnockback(5 + Math.abs(char2.fakeRL) * 1.5);
                           shakeRL = -tempUD;
                           this.damageChar(5 + Math.abs(fakeRL) * 1.5);
                           rotter = -char2.fakeRL * char2.rotPerc;
                           downTime = 5;
                           this.hurtChar(0,20,0,Math.cos(angle) * tempRL - Math.sin(angle) * tempUD,-(Math.cos(angle) * tempUD + Math.sin(angle) * tempRL),true,false,false);
                           if(tempUD > -30)
                           {
                              this.landQuick = true;
                           }
                        }
                        else
                        {
                           Main.shakeScreen(12,0,true);
                           if(Math.abs(fakeRL) < 15)
                           {
                              Jumper = 10;
                              fakeRL = -makeOne(scaleX) * 4;
                              FloatUp = 4;
                              gotoBuffer = "Jump";
                           }
                        }
                        Main.popBetween(this,char2);
                        char2.hurtChar(0,20,1,Math.cos(char2.angle) * char2.tempRL - Math.sin(char2.angle) * char2.tempUD,-(Math.cos(char2.angle) * char2.tempUD + Math.sin(char2.angle) * char2.tempRL),true,false,false);
                     }
                  }
                  else if(!(onGround && char2.onGround))
                  {
                     if(char2.downTime == 0 && Status != "Hurt" && Status != "enterBox" && Status != "Pencil" && Status != "PencilAir" && Status != "ShootAir" && Status != "ZipAir")
                     {
                        if(lastY - char2.lastY < -isTall * 2)
                        {
                           this.charStompChar(char2);
                        }
                        else if(lastY - char2.lastY > isTall * 2)
                        {
                           char2.charStompChar(this);
                        }
                     }
                  }
               }
            }
         }
      }
      
      private function charStompChar(char2:Char) : void
      {
         char2.spring = -15;
         char2.wallX = char2.x;
         char2.wallY = char2.y + char2.isTall;
         if(Status == "Skateboard")
         {
            this.char.gotoAndStop("ollie");
            this.placeHead(this.char);
         }
         else
         {
            gotoBuffer = "Jump";
         }
         FloatUp = 4;
         Jumper = char2.thrust - char2.moveUD * 0.5;
         moveRL = (moveRL + char2.moveRL) * 0.5;
         fakeRL = moveRL;
         moveUD = -Jumper;
         this.canQuickDrop = false;
         this.FloatLock = false;
         wallRot = wallAngle = 0;
         char2.springBounce();
         if(char2.moveUD < 0)
         {
            char2.moveUD += 5;
         }
         this.y = char2.y + char2.isTall - char2.springTall - isTall;
         Sounds.playSound("BadStomp",this.x,2,onRail);
      }
      
      private function CheckInteracts() : void
      {
         Main.refreshCamera();
         InteractObjects.charCheckObjects(this.x,this.y,isWide,isTall,onRail,this);
         StarlingInteract.charCheckObjects(this.x,this.y,isWide,isTall,onRail,this);
         staticInteractObjects.charCheckObjects(this.x,this.y,isWide,isTall,onRail,this);
         StarlingDecals.charCheckObjects(this.x,this.y,isWide + Math.abs(moveRL),isTall,onRail,this);
      }
      
      override public function checkAfterMove() : Boolean
      {
         var n:int = 0;
         var i:uint = 0;
         this.CheckInteracts();
         if(hasPencilAdv)
         {
            this.checkLedgeHang();
         }
         if(hitPause == 0)
         {
            this.charCheckChars();
         }
         if(gotoBuffer == "Hurt" || Status == "Die" || Status == "Disabled")
         {
            return true;
         }
         for(n = 0; n < Baddies.activeBaddieArray.length; n++)
         {
            if(onRail == Baddies.activeBaddieArray[n].onRail)
            {
               if(isAttacking)
               {
                  if(this.subStatus == "Charge1")
                  {
                     trace("-----------WTF");
                  }
                  if((this.subStatus == "BuzzSaw" && downTime == 0 || this.justHitArray.indexOf(Baddies.activeBaddieArray[n]) == -1) && this.CheckAttack(Baddies.activeBaddieArray[n]))
                  {
                     this.justHitArray.push(Baddies.activeBaddieArray[n]);
                     if(Baddies.activeBaddieArray[n].inky)
                     {
                        this.updateInk(this.chargePower);
                     }
                     if(Baddies.activeBaddieArray[n].health > 20)
                     {
                        this.justAttackQuick = true;
                     }
                     else
                     {
                        this.justAttackHit = true;
                     }
                  }
               }
               if(Baddies.activeBaddieArray[n].downTime == 0)
               {
                  distRL = Baddies.activeBaddieArray[n].x - this.x;
                  distUD = Baddies.activeBaddieArray[n].y - this.y;
                  if(Math.abs(distRL) < isTall + Baddies.activeBaddieArray[n].isWide + 50 && Math.abs(distUD) < isTall + Baddies.activeBaddieArray[n].isTall + 50)
                  {
                     angle = Baddies.activeBaddieArray[n].rotation * this.quickRadian;
                     ax = Math.cos(angle) * distRL + Math.sin(angle) * distUD;
                     ay = Math.cos(angle) * distUD - Math.sin(angle) * distRL;
                     if(Status == "Pencil" || Status == "PencilAir")
                     {
                        this.pushBack(Baddies.activeBaddieArray[n]);
                        if(this.char.currentFrame > 6)
                        {
                           Baddies.activeBaddieArray[n].baddieHitChar(this);
                        }
                     }
                     else
                     {
                        Baddies.activeBaddieArray[n].baddieHitChar(this);
                     }
                  }
               }
            }
         }
         if(isAttacking)
         {
            if(aWall.checkBreakables(this))
            {
               this.justAttackQuick = true;
            }
            if(StarlingInteract.checkAttackables(this,onRail))
            {
               this.justAttackQuick = true;
            }
            if(InteractObjects.checkAttackables(this,onRail))
            {
               this.justAttackQuick = true;
            }
            if(staticInteractObjects.checkAttackables(this,onRail))
            {
               this.justAttackQuick = true;
            }
            for(i = 0; this.char["pencilFake" + i] != undefined; i++)
            {
               this.char["pencilFake" + i].visible = false;
            }
         }
         return false;
      }
      
      private function footStep(ex:*, ey:*, esX:*, rot:*, eRL:*, eslip:*) : *
      {
         var rand:Number = NaN;
         Sounds.playSound("Footstep",ex,0.8 + Math.abs(eRL) * 0.02,onRail);
         if(onWall == 0)
         {
            if(Math.abs(eRL) > 20)
            {
               rand = Math.random() * 0.2 + (Math.abs(eRL) - 20) * 0.2;
               if(Math.random() > 0.5)
               {
                  rand *= -1;
               }
               if(Math.abs(rand) > 1.5)
               {
                  rand = makeOne(rand) * 1.5;
               }
               rot -= scaleX * (0.5 + Math.random() * 1);
               StarlingEffect.Spawn("smokePuff",ex,ey,rot,scaleX * rand,RLx(groundRL) + UDx(-3 * Math.abs(rand)),RLy(groundRL) + UDy(-3 * Math.abs(rand)),onRail);
            }
         }
         else if(eRL != 0)
         {
            rand = Math.random() * 0.4 + (20 - Math.abs(eRL)) * 0.03;
            StarlingEffect.Spawn("smokePuff",ex,ey,rot - (0.8 + Math.random() * 0.5) * onWall,scaleX * rand,RLx(rand * 20 * -onWall) + UDx(-3 * rand),UDy(-3 * rand),onRail);
         }
      }
      
      public function pushBack(bad:*) : void
      {
         if(bad.health == 0 || Math.abs(distRL) > 500 || Math.abs(distUD) > 500)
         {
            return;
         }
         if(distRL * moveRL > 0)
         {
            if(this.subStatus != "PokeDown" && this.subStatus != "SwipeUp" && this.subStatus != "BuzzSaw")
            {
               if(Math.abs(ax) < 50 + bad.isWide && Math.abs(ay) < isTall + bad.isTall * 1.2)
               {
                  if(Status == "Pencil")
                  {
                     fakeRL -= fakeRL * 0.5 * framin;
                  }
                  else
                  {
                     moveRL = 0;
                  }
               }
            }
         }
      }
      
      private function checkLedgeHang() : void
      {
         if(moveUD > 0 && !this.DownIsDown() && health > 0 && Status == "Jump")
         {
            if(Boolean(wallsHitTest(this.x + isWide + 20,this.y - 35)) || Boolean(wallsHitTest(this.x - isWide - 20,this.y - 35)))
            {
               if(!(Boolean(wallsHitTest(this.x + isWide + 20,lastY - 35)) || Boolean(wallsHitTest(this.x - isWide - 20,lastY - 35))))
               {
                  if(wallsHitTest(this.x + isWide + 20,this.y - 35))
                  {
                     onWall = 1;
                  }
                  else
                  {
                     onWall = -1;
                  }
                  if(onWall * wantRL < 0)
                  {
                     onWall = 0;
                  }
                  else
                  {
                     while(Boolean(wallsHitTest(this.x + isWide + 20,this.y - 35)) || Boolean(wallsHitTest(this.x - isWide - 20,this.y - 35)))
                     {
                        --this.y;
                     }
                     while(!wallsHitTest(this.x + (isWide + 1) * onWall,this.y - 30))
                     {
                        this.x += onWall;
                     }
                     this.ledgeHangIt();
                  }
               }
            }
         }
      }
      
      public function ledgeHangIt() : void
      {
         if(onWallPlat != 0)
         {
            scaleX = onWallPlat;
         }
         else
         {
            scaleX = onWall;
         }
         this.resetPencil();
         this.resetJumpStuff();
         moveRL = moveUD = fakeRL = fakeUD = wallRot = wallAngle = rotation = 0;
         gotoBuffer = "LedgeHang";
         this.coreSwitchAnim();
      }
      
      public function CheckAttack(bad:*) : Boolean
      {
         if(bad.downTime > 0)
         {
            return false;
         }
         if(this.CheckPencilOnBad(bad))
         {
            if(bad.currentGetAttacked(this.x,this.y,this.getAttackAngle(bad.x,bad.y,this.subStatus,bad.health - this.chargePower),this,this.subStatus,this.chargePower,power))
            {
               this.AttackEffects(bad.x,bad.y,bad.smashKnockback(this.chargePower),bad.backEffect,bad.inky);
               if(Status == "PencilAir" && this.subStatus == "Heavy1")
               {
                  moveRL = -5 * scaleX;
                  if(moveUD > -20)
                  {
                     moveUD = -20;
                  }
                  initialFloat = FloatUp = 6;
                  this.FloatLock = true;
               }
               else
               {
                  if(this.subStatus == "BuzzSaw")
                  {
                     moveRL = distRL;
                     moveUD = distUD - 100;
                     moveRL *= 20 / nowSpeed();
                     moveUD *= 20 / nowSpeed();
                     Still = this.TempStill = true;
                     rotter = makeOne(rotter) * 60;
                     return true;
                  }
                  if(Status == "PencilAir" && moveUD > -5)
                  {
                     moveRL *= 0.5;
                     if(Math.abs(moveRL) > 14)
                     {
                        moveUD = -5;
                     }
                     else
                     {
                        moveUD = -2;
                     }
                     initialFloat = FloatUp = 4;
                     this.FloatLock = true;
                     this.groundY += (this.y + isTall - this.groundY) * 0.4;
                  }
               }
               if(bad.health == 0)
               {
                  moveRL = fakeRL;
               }
               return true;
            }
            return false;
         }
         if(this.subStatus == "SwipeUp")
         {
            return false;
         }
      }
      
      private function CheckPencilOnBad(bad:*) : *
      {
         angle = (this.pencilRot + rotation) * this.quickRadian;
         distRL = this.x + this.pencilX - bad.x;
         distUD = this.y + this.pencilY - bad.y;
         ax = Math.cos(angle) * distRL + Math.sin(angle) * distUD;
         ay = Math.cos(angle) * distUD - Math.sin(angle) * distRL;
         if(Math.abs(this.pencilRot) - 90 < 45)
         {
            if(Math.abs(ax) < bad.isTall + 30 && ay > -(bad.isWide + 20) && ay < 70 * this.Pencil.scaleY + bad.isWide)
            {
               return true;
            }
         }
         else if(Math.abs(ax) < bad.isTall + 30 && ay > -(bad.isWide + 20) && ay < 50 + bad.isTall)
         {
            return true;
         }
         for(var i:uint = 0; this.char["pencilFake" + i] != undefined; i++)
         {
            angle = (this.char["pencilFake" + i].rotation * scaleX + rotation) * this.quickRadian;
            distRL = this.x + this.char["pencilFake" + i].x * scaleX - bad.x;
            distUD = this.y + this.char["pencilFake" + i].y - bad.y;
            ax = Math.cos(angle) * distRL + Math.sin(angle) * distUD;
            ay = Math.cos(angle) * distUD - Math.sin(angle) * distRL;
            if(Math.abs(ax) < bad.isTall + 30 && ay > -(bad.isWide + 20) && ay < 70 * this.char["pencilFake" + i].scaleY + bad.isWide)
            {
               return true;
            }
         }
         return false;
      }
      
      private function CheckAdvancedAttacks(bad:*, distRL:*, distUD:*) : void
      {
         if(Status == "PencilAir" && this.subStatus == "SawBlade")
         {
            if(Math.sqrt(distRL * distRL + distUD * distUD) < isTall + bad.isTall)
            {
               trace("hit");
            }
         }
      }
      
      private function getAttackAngle(ex:*, ey:*, hitMove:*, health:*) : Number
      {
         switch(hitMove)
         {
            case "Swipe1":
            case "Swipe2":
            case "Swipe3":
            case "Swipe4":
               if(health < -20)
               {
                  angle = (wallRot + 40 * makeOne(ex - this.x)) * this.quickRadian;
               }
               else
               {
                  angle = (wallRot * 0.35 + 10 * makeOne(ex - this.x)) * this.quickRadian;
               }
               break;
            case "Medium1":
               if(health > 0)
               {
                  angle = (wallRot * 0.35 + 40 * makeOne(ex - this.x)) * this.quickRadian;
               }
               else
               {
                  angle = (wallRot * 0.35 + 50 * makeOne(ex - this.x)) * this.quickRadian;
               }
               break;
            case "Medium2":
               if(health > 0)
               {
                  angle = (wallRot * 0.35 + 40 * makeOne(ex - this.x)) * this.quickRadian;
               }
               else
               {
                  angle = (wallRot * 0.35 + 15 * makeOne(ex - this.x)) * this.quickRadian;
               }
               break;
            case "Heavy1":
            case "BuzzSaw":
               angle = (wallRot * 0.35 + 55 * makeOne(ex - this.x)) * this.quickRadian;
               break;
            case "SwipeUp":
            case "HeavyUp":
            case "Rising":
               angle = -Math.atan2((this.x - ex) * 0.5,this.y - ey + 200);
               if(Math.abs(angle) > 0.5)
               {
                  angle = makeOne(angle) * 0.5;
               }
               break;
            case "HeavyDown":
            case "PokeDown":
               angle = -Math.atan2(this.x - ex,this.y - ey - 100);
               break;
            default:
               angle = (wallRot * 0.35 + 10 * makeOne(ex - this.x)) * this.quickRadian;
         }
         return angle;
      }
      
      public function currentGetAttacked(ex:Number, ey:Number, angle:Number, char:collision, hitMove:String, hitPower:Number, pow:Number = 1) : Boolean
      {
         this.damageChar(hitPower);
         getAttackedShared(ex,ey,angle,char,hitMove,hitPower);
         hitPause = char.hitPause = this.smashKnockback(hitPower) * 0.2;
         if(Math.abs(rotter) < 50 && moveUD > -20)
         {
            rotter *= 0.8;
            this.landQuick = true;
         }
         this.hurtChar(0,0,0,moveRL,-moveUD,false,false,false);
         this.head.transform.colorTransform = transform.colorTransform = Main.getTint(1,-0.6,-0.6);
         RedHurt = 2 + hitPause * 0.5;
         wallRot = wallAngle = 0;
         Sounds.playSound("Hit",this.x,1,onRail);
         return true;
      }
      
      public function AttackEffects(ex:*, ey:*, power:*, smoke:Boolean, inky:Boolean) : *
      {
         var rot:Number = NaN;
         if(this.subStatus == "PokeDown")
         {
            this.canQuickDrop = false;
            moveUD = -22;
         }
         else if(this.subStatus == "HeavyDown")
         {
            this.canQuickDrop = false;
            moveUD = -24;
         }
         downTime = 5;
         if(this.subStatus == "SwipeUp" || this.subStatus == "HeavyUp" || this.subStatus == "Rising" || this.subStatus == "BuzzSaw")
         {
            rot = -Math.atan2(this.x - ex,this.y - ey + 150);
         }
         else
         {
            switch(this.subStatus)
            {
               case "Swipe1":
               case "Swipe3":
                  rot = 110;
                  break;
               case "Swipe2":
               case "Swipe4":
                  rot = 45;
                  break;
               case "Medium1":
                  rot = 130;
                  break;
               case "Medium2":
                  rot = 40;
                  break;
               case "Heavy1":
                  rot = 140;
                  break;
               case "SwipeUp":
               case "HeavyUp":
               case "Rising":
                  break;
               case "PokeDown":
               case "HeavyDown":
                  rot = 180;
                  break;
               default:
                  rot = 0;
                  trace("default " + this.subStatus);
            }
            rot = (rot * scaleX + (rotation + Math.random() * 40 - 20)) * this.quickRadian;
         }
         if(power > 75)
         {
            Main.shakeScreen(power * 2,rot + 3.14,true);
         }
         else if(this.subStatus == "pokeDown")
         {
            Main.shakeScreen(power * 0.5,rot + 3.14,true);
         }
         else
         {
            Main.shakeScreen(power * 0.5,rot + 3.14);
         }
         if(smoke || !this.charVector)
         {
            StarlingEffect.Spawn("impactEffect",this.x * 0.2 + ex * 0.8,this.y * 0.2 + ey * 0.8,rot,1.3,0,0,onRail);
         }
         else
         {
            cachedEffects.spawnCachedEffect("Impact",this.x * 0.2 + ex * 0.8,this.y * 0.2 + ey * 0.8,rot,1,0,0,onRail,parent,true);
         }
         if(inky)
         {
            StarlingEffect.Spawn("Splat",this.x * 0.2 + ex * 0.8,this.y * 0.2 + ey * 0.8,Math.random() * 3.14,0.5,Math.sin(rot) * 20,-Math.cos(rot) * 20,onRail);
         }
      }
      
      private function shootInk() : void
      {
         angle = rotation * this.quickRadian;
         tempX = this.x + (Math.cos(angle) * this.pencilX - Math.sin(angle) * this.pencilY);
         tempY = this.y + (Math.cos(angle) * this.pencilY + Math.sin(angle) * this.pencilX);
         tempX -= Math.sin(this.shootAngle) * 60;
         tempY += Math.cos(this.shootAngle) * 60;
         if(this.shootSwitch == -2)
         {
            angle = this.shootAngle + (0.04 - Math.random() * 0.08);
         }
         else
         {
            angle = this.shootAngle + this.shootSwitch * 0.025 + (0.04 - Math.random() * 0.08);
         }
         --this.shootSwitch;
         if(this.shootSwitch == -3)
         {
            this.shootSwitch = 1;
         }
         Main.shakeScreen(1,this.shootAngle,false);
         this.updateInk(-5);
         Sounds.playSound("InkShot",this.x,1.3,onRail);
         StarlingInteract.Spawn("inkShot",tempX,tempY,angle,makeOne(scaleX),-Math.sin(angle) * 60,Math.cos(angle) * 60,onRail,12);
         StarlingEffect.Spawn("inkImpact" + int(Math.random() * 3),tempX,tempY,angle - 3.14,1 * scaleX,0,0,onRail);
      }
      
      public function updateInk(e:Number) : void
      {
         if(this.inkReserve + e < 0)
         {
            this.inkReserve = 0;
         }
         else if(this.inkReserve + e > this.inkMax)
         {
            this.inkReserve = this.inkMax;
         }
         else
         {
            this.inkReserve += e;
         }
         if(e < 4)
         {
            rootHUD.updateInk(this.ID,this.inkReserve / this.inkMax,e);
         }
         else
         {
            rootHUD.updateInk(this.ID,this.inkReserve / this.inkMax,4);
         }
      }
      
      public function coreSwitchAnim() : *
      {
         var oldGotoBuffer:String = null;
         if(gotoBuffer == "nothing")
         {
            return false;
         }
         if(currentSound != null)
         {
            Sounds.stopSound(currentSound);
            currentSound = null;
         }
         if(gotoBuffer != "Pencil" && gotoBuffer != "PencilAir")
         {
            this.changeFrame(gotoBuffer);
         }
         this.head.scaleX = scaleX;
         oldGotoBuffer = gotoBuffer;
         this[gotoBuffer + "SetupFrame"]();
         if(gotoBuffer != oldGotoBuffer)
         {
            this.changeFrame(gotoBuffer);
            this[gotoBuffer + "SetupFrame"]();
         }
         this.CharEnterFrame = this[gotoBuffer + "EnterFrame"];
         Status = gotoBuffer;
         this.char.stop();
         gotoBuffer = "nothing";
         return true;
      }
      
      private function charFinishUp() : void
      {
         if(this.squiggleBuffer > 0)
         {
            if(dontSquiggle)
            {
               this.squiggleGetFake(this.squiggleBuffer);
            }
            else
            {
               this.squiggleGet(this.squiggleBuffer);
            }
            this.squiggleBuffer = 0;
         }
         if(this.hasDoorIcon)
         {
            if(this.showDoorIcon)
            {
               this.showDoorIcon = false;
            }
            else if(this.myDoorIcon.currentFrame > 2)
            {
               --this.myDoorIcon.currentFrame;
            }
            else
            {
               this.myDoorIcon.goSwim();
               this.myDoorIcon = null;
               this.hasDoorIcon = false;
            }
         }
         if(hitPause)
         {
            --hitPause;
         }
         else
         {
            this.hairGuide();
         }
         this.Vanity(true);
      }
      
      public function startDoorIcon(ex:*, ey:*, rail:*) : void
      {
         if(this.hasDoorIcon)
         {
            if(this.myDoorIcon.currentFrame < 11)
            {
               ++this.myDoorIcon.currentFrame;
            }
         }
         else
         {
            this.myDoorIcon = StarlingSmoke.Spawn("doorPrompt",ex,ey - 90,0,0.6666,0,0,rail);
            this.hasDoorIcon = true;
         }
         this.showDoorIcon = true;
      }
      
      private function changeSubFrame(s:String, e:String) : void
      {
         this.subStatus = e;
         this.changeFrame(s + e);
      }
      
      public function changeFrame(e:String) : void
      {
         var myClass:Class = null;
         this.char.visible = false;
         if(this.charClips[e] == null)
         {
            myClass = getDefinitionByName("Char" + e) as Class;
            this.char = new myClass();
            this.charClips[e] = this.char;
            this.char.stop();
            addChild(this.char);
         }
         else
         {
            this.char = this.charClips[e];
            this.char.gotoAndStop(1);
            this.char.x = this.char.y = 0;
            this.char.visible = true;
         }
      }
      
      private function Vanity(tick:Boolean = true) : void
      {
         var mc:MovieClip = null;
         var i:uint = 0;
         var headMatrix:Matrix = null;
         moveSpringBounce();
         if(this.puppet)
         {
            this.x = networkControls[0];
            this.y = networkControls[1];
            moveRL = networkControls[2];
            moveUD = networkControls[3];
            scaleX = networkControls[4];
            rotation = networkControls[5];
            this.headx = networkControls[6];
            this.heady = networkControls[7];
            this.headrot = networkControls[8];
            this.head.scaleX = networkControls[9];
            this.head.gotoAndStop(networkControls[10]);
            if(Status != networkControls[11])
            {
               Status = networkControls[11];
               this.changeFrame(networkControls[11]);
            }
            this.char.gotoAndStop(networkControls[12]);
            this.deepArray = networkControls[13];
            for(mc = this.char; i < this.deepArray.length; )
            {
               mc[this.deepArray[i]].gotoAndStop(this.deepArray[i + 1]);
               mc = mc[this.deepArray[i]];
               i += 2;
            }
         }
         else if(this.hasGamepad)
         {
            this.gamepadRL = 0;
            this.gamepadUD = 0;
            this.gamepadAttack = false;
            this.gamepadJump = false;
            this.gamepadSpecial = false;
            this.gamepadSpecial2 = false;
         }
         if(tick && this.hatN > 0)
         {
            if(Status == "Jump")
            {
               if(this.char.currentFrameLabel != "longJump" && this.char.currentFrameLabel != "wallJump" && this.hairUD < 0)
               {
                  this.headrot += this.hairUD * 2.5;
               }
            }
            else if(this.hairUD < 0)
            {
               this.headrot += this.hairUD * 2.5;
            }
            if(Math.abs(this.headrot) > 60)
            {
               this.headrot = 60 * makeOne(this.headrot);
            }
            if(this.hatSym)
            {
               this.head.hat.scaleX = this.head.scaleX;
            }
            this.hatEffect();
         }
         angle = rotation * this.quickRadian;
         this.headX = this.x + (Math.cos(angle) * this.headx * scaleX - Math.sin(angle) * (this.heady + (isTall * 2 - springTall)));
         this.headY = this.y + (Math.cos(angle) * (this.heady + (isTall * 2 - springTall)) + Math.sin(angle) * this.headx * scaleX);
         if(this.charVector)
         {
            this.head.x = this.headX;
            this.head.y = this.headY;
            this.head.rotation = rotation + this.headrot * scaleX;
            if(hasPencil)
            {
               if(this.Pencil.visible)
               {
                  this.Pencil.x = this.x + (Math.cos(angle) * this.pencilX - Math.sin(angle) * this.pencilY);
                  this.Pencil.y = this.y + (Math.cos(angle) * this.pencilY + Math.sin(angle) * this.pencilX);
                  this.Pencil.rotation = rotation + this.pencilRot;
               }
            }
            if(this.Slash != null && this.Slash.scaleX * scaleX > 0)
            {
               this.Slash.x = this.x;
               this.Slash.y = this.y;
               this.Slash.scaleX = scaleX;
               this.Slash.rotation = rotation;
            }
            if(this.patternN > 0)
            {
               if(tick)
               {
                  this.charbit.fillRect(this.charbit.rect,4278190080);
                  if(Status == "DoorIn" || Status == "DoorOut")
                  {
                     this.pantsTextures.x = this.headx;
                     this.charmap.x = -25 + this.headx;
                     this.charbit.draw(this,new Matrix(2,0,0,2,50 - this.headx * 2,60));
                  }
                  else
                  {
                     this.pantsTextures.x = 0;
                     this.charmap.x = -25;
                     this.charbit.draw(this,new Matrix(2,0,0,2,50,60));
                  }
                  this.charbit.threshold(this.charbit,new Rectangle(0,0,1000,140),new Point(0,0),"==",4278190080,0);
               }
               this.maskContainer.x = this.x;
               this.maskContainer.y = this.y;
               this.maskContainer.scaleX = scaleX;
               this.maskContainer.rotation = rotation;
               this.maskContainer.alpha = alpha;
            }
         }
         else if(tick)
         {
            this.charBitmap.fillRect(this.charBitmap.rect,0);
            headMatrix = new Matrix();
            headMatrix.rotate(this.headrot * this.quickRadian);
            headMatrix.scale(this.head.scaleX * this.charRes,this.charRes);
            headMatrix.translate((66.66 + this.headx * scaleX) * this.charRes,(70 + this.heady + (isTall * 2 - springTall)) * this.charRes);
            this.charBitmap.draw(this.head,headMatrix,this.head.transform.colorTransform);
            this.charBitmap.draw(this,new Matrix(scaleX * this.charRes,0,0,scaleY * this.charRes,66 * this.charRes,70 * this.charRes),transform.colorTransform);
            if(this.patternN > 0)
            {
               this.pantsTextures.x = 0;
               this.charmap.x = -25;
               this.charbit.fillRect(this.charbit.rect,4278190080);
               this.charbit.draw(this,new Matrix(2,0,0,2,50,60));
               this.charbit.threshold(this.charbit,new Rectangle(0,0,1000,140),new Point(0,0),"==",4278190080,0);
               this.charBitmap.draw(this.maskContainer,new Matrix(scaleX * this.charRes,0,0,scaleY * this.charRes,66 * this.charRes,70 * this.charRes));
            }
            StarlingBackgrounds.pressCharBitmap(this.charBitmap,this.ID);
         }
      }
      
      public function squiggleGet(n:uint = 1) : void
      {
         Sounds.playSound("Coin",this.x,1,onRail);
         if(health + 5 * n > healthMax)
         {
            health = healthMax;
         }
         else
         {
            health += 5 * n;
         }
         rootHUD.restoreHealth(this.ID,health);
         Squiggles += n;
         Main.localSettings.squiggles = Squiggles;
         rootHUD.updateSquiggles(Squiggles);
         if(Squiggles * 0.01 == Math.round(Squiggles * 0.01))
         {
            Sounds.playSound("extraLife",this.x,1,onRail);
            ++this.lives;
            Main.localSettings.lives = this.lives;
            rootHUD.restoreLives(this.ID,this.lives);
         }
      }
      
      public function squiggleGetFake(n:uint = 1) : void
      {
         Sounds.playSound("Coin",this.x,1,onRail);
         if(health + 5 * n > healthMax)
         {
            health = healthMax;
         }
         else
         {
            health += 5 * n;
         }
         rootHUD.restoreHealth(this.ID,health);
         if(Squiggles * 0.01 == Math.round(Squiggles * 0.01))
         {
            Sounds.playSound("extraLife",this.x,1,onRail);
            ++this.lives;
            Main.localSettings.lives = this.lives;
            rootHUD.restoreLives(this.ID,this.lives);
         }
      }
      
      public function spendSquiggles(e:uint) : Boolean
      {
         if(e > Squiggles)
         {
            return false;
         }
         Squiggles -= e;
         Main.localSettings.squiggles = Squiggles;
         rootHUD.paySquiggles(e);
         return true;
      }
      
      public function hurtChar(e:*, shake:uint = 0, pause:uint = 0, eRL:Number = -100, eUD:Number = -100, turn:Boolean = false, shurt:Boolean = false, ow:Boolean = true) : Boolean
      {
         var n:uint = 0;
         var i:uint = 0;
         if(!shurt)
         {
            if(e != 0)
            {
               if(Status == "DoorIn" || Status == "DoorOut" || Status == "Hurt" || Status == "Celebrate" || Status == "Zip" || Status == "ZipAir" || downTime > 0 || alpha < 1)
               {
                  return false;
               }
            }
         }
         if(health < 0)
         {
            return false;
         }
         if(Boolean(inBonus) && ow)
         {
            shurt = true;
         }
         if(ow)
         {
            Sounds.playSound("Ow",this.x,0.4,onRail);
         }
         if(Main.LevelStatus == "Normal")
         {
            if(health - e <= 0)
            {
               health = 0;
               n = 0;
               for(i = 0; i < ActiveCharArray.length; i++)
               {
                  if(ActiveCharArray[i].ID != this.ID && ActiveCharArray[i].health > 0)
                  {
                     n++;
                     break;
                  }
               }
               if(n == 0)
               {
                  Sounds.fadeOutMusic("nothing",0.08);
               }
            }
            else
            {
               health -= e;
            }
         }
         Still = this.FloatLock = this.FloatStill = onGround = false;
         FloatUp = 0;
         downTime = 5;
         this.attackN = 0;
         if(e > 0)
         {
            this.head.alpha = alpha = 0.5;
            rootHUD.updateHealth(this.ID,health);
         }
         if(shake != 0)
         {
            shakeRL = shake;
            Main.shakeScreen(shake,0,true);
         }
         if(pause != 0)
         {
            hitPause = pause;
         }
         if(eRL != -100)
         {
            fakeRL = eRL;
         }
         if(eUD != -100)
         {
            Jumper = eUD;
         }
         moveRL = fakeRL;
         moveUD = -Jumper;
         if(Status == "InkBoard")
         {
            this.inkboardPointer.visible = false;
            rootHUD.HUD.switchInkboard(false);
         }
         if(turn)
         {
            scaleX = -makeOne(eRL);
            this.head.scaleX = scaleX;
         }
         if(shurt)
         {
            this.superHurt = true;
         }
         if(health == 0 || shurt)
         {
            gotoBuffer = "Hurt";
         }
         else if(CheckHead())
         {
            if(Status == "Roll" || !onGround)
            {
               moveRL = fakeRL;
            }
            else if(Status == "DownSlide")
            {
               gotoBuffer = "Roll";
            }
         }
         else if(e > 0)
         {
            gotoBuffer = "Hurt";
         }
         else if(Status == "Roll")
         {
            moveRL *= 0.8;
            moveUD *= 0.8;
         }
         else if(Status == "Duck")
         {
            fakeRL *= 0.8;
            Jumper *= 0.8;
            gotoBuffer = "Roll";
         }
         else
         {
            gotoBuffer = "Hurt";
         }
         return true;
      }
      
      public function superHurtChar(e:*, pause:Boolean = false, shake:uint = 40) : *
      {
         if(health <= 0)
         {
            Still = true;
            this.superHurt = true;
         }
         else if(Status == "Hurt")
         {
            this.superHurt = true;
         }
         else if(pause)
         {
            this.hurtChar(e,shake,5,0,20,false,true);
         }
         else if(staticInteractObjects.DoorArray[0].y < Main.MinY)
         {
            this.hurtChar(e,0,0,0,0,false,true);
         }
         else
         {
            this.hurtChar(e,0,0,0,20,false,true);
         }
         Status = "Disabled";
         rotter = -scaleX * 20;
      }
      
      private function superHurtReset(i:int = -1, resetAll:Boolean = false) : void
      {
         var n:uint = 0;
         onRail = this.toOnRail = -1;
         if(aPlatOn != null)
         {
            aPlat.aPlatOnClear(this);
         }
         if(aWallOn != null)
         {
            aWall.aWallOnClear(this);
         }
         if(i == -1)
         {
            if(Main.DirIt == "World 1" && Main.LevelLoaded == "Level3")
            {
               Main.quickResetLevel = true;
            }
            else
            {
               aPlat.resetAllPlats();
               aGround.resetAllGrounds();
            }
         }
         if(i > -1)
         {
            this.changeRails(ActiveCharArray[i].onRail);
            this.x = ActiveCharArray[i].x;
            this.y = ActiveCharArray[i].y;
            JustMove(-ActiveCharArray[i].scaleX * 50,-100);
            this.landQuick = true;
            springBounce = this.charSpringBounce;
            this.resetChar();
            moveRL = ActiveCharArray[i].moveRL;
            moveUD = -15;
            alpha = this.head.alpha = 0.5;
            FloatUp = 0;
            rotter = -scaleX * 20;
            this.superHurt = false;
            Status = "Hurt";
            this.myNode = ActiveCharArray[i].myNode;
         }
         else if(inBonus)
         {
            this.landQuick = true;
            this.x = staticInteractObjects.DoorArray[0].x + 80 * staticInteractObjects.DoorArray[0].scaleX;
            this.y = staticInteractObjects.DoorArray[0].y - isTall - 100;
            moveUD = 0;
            scaleX = this.head.scaleX = staticInteractObjects.DoorArray[0].scaleX;
            rotter = 20 * scaleX;
            this.changeRails(staticInteractObjects.DoorArray[0].onRail);
            this.myNode = 0;
         }
         else if(Checkpoint.getcurrentCheckpoint() > -1)
         {
            this.x = Checkpoint.checkpointX();
            this.y = Checkpoint.checkpointY() - isTall - 50;
            scaleX = this.head.scaleX = Checkpoint.checkpointScaleX();
            if(scaleX * rotter > 0)
            {
               rotter *= -1;
            }
            this.changeRails(Checkpoint.checkpointRail());
         }
         else if(this.charSetups[Main.LoadIt + "Setup"] != null)
         {
            this.x = staticInteractObjects.DoorArray[0].x;
            this.y = staticInteractObjects.DoorArray[0].y - isTall;
            this.charSetups[Main.LoadIt + "Setup"](this);
            this.changeRails(staticInteractObjects.DoorArray[0].onRail);
         }
         else
         {
            this.changeRails(staticInteractObjects.DoorArray[Main.DoorLoaded].onRail);
            if(staticInteractObjects.DoorArray[Main.DoorLoaded].quickDrop)
            {
               this.x = staticInteractObjects.DoorArray[Main.DoorLoaded].x;
               this.y = staticInteractObjects.DoorArray[Main.DoorLoaded].y - isTall - 50;
            }
            else
            {
               this.x = staticInteractObjects.DoorArray[Main.DoorLoaded].x + 40 * staticInteractObjects.DoorArray[Main.DoorLoaded].scaleX;
               this.y = staticInteractObjects.DoorArray[Main.DoorLoaded].y - isTall - 50;
            }
            this.head.scaleX = scaleX = staticInteractObjects.DoorArray[Main.DoorLoaded].scaleX;
            rotter = 10 * -scaleX;
            if(Jumper < staticInteractObjects.DoorArray[Main.DoorLoaded].jumper)
            {
               FloatUp = 6;
               Jumper = staticInteractObjects.DoorArray[Main.DoorLoaded].jumper;
               moveUD = -Jumper;
            }
            this.myNode = 0;
         }
         if(resetAll)
         {
            this.changeRails(staticInteractObjects.DoorArray[0].onRail);
            this.x -= this.ID * 60;
            springBounce = this.charSpringBounce;
            this.resetChar();
            if(Main.LevelStatus == "Race")
            {
               moveUD = -10;
            }
            else if(Jumper > 0)
            {
               moveUD = -Jumper;
            }
            else
            {
               moveUD = -20;
            }
            moveUD -= Math.random() * 5;
            alpha = this.head.alpha = 0.5;
            FloatUp = 0;
            rotter = -scaleX * 20;
            this.superHurt = false;
            Status = "Hurt";
         }
         if(InactiveCharArray.indexOf(this) > -1)
         {
            InactiveCharArray.splice(InactiveCharArray.indexOf(this),1);
         }
         if(ActiveCharArray.indexOf(this) == -1)
         {
            ActiveCharArray.push(this);
         }
         if(i <= -1)
         {
            if(inBonus)
            {
               Main.quickResetObjects = true;
            }
            else if(Main.LevelLoaded == "Lockd1")
            {
               Main.quickResetObjects = true;
            }
         }
         if(!resetAll && ActiveCharArray.length == 1)
         {
            for(n = 0; n < CharArray.length; n++)
            {
               if(CharArray[n].ID != this.ID)
               {
                  CharArray[n].superHurtReset(-1,true);
               }
            }
         }
         wallRL = wallUD = platRL = platUD = groundRL = groundUD = 0;
         aPlat.resetplatSides(this.x,this.y,this);
         lastGround = "nothing";
         this.resetCamera();
         Main.lockShiftBack();
         parent.mask = null;
      }
      
      public function respawnChar(i:uint = 1) : *
      {
         var char:Char = null;
         if(Main.LevelStatus == "Smash")
         {
            this.charOutDoor(this.ID);
         }
         else
         {
            this.resetChar();
            char = ActiveCharArray[i];
            gotoBuffer = "Jump";
            this.coreSwitchAnim();
            onRail = -1;
            this.changeRails(char.onRail);
            if(this.puppet)
            {
               this.x = char.x + char.scaleX * 50;
               theY = this.y = char.y;
               networkControls = [this.x,this.y,moveRL,moveUD,scaleX,rotation,this.headx,this.heady,this.headrot,this.head.scaleX,this.head.currentFrame,"Idle",1,[]];
            }
            else
            {
               this.x = char.x;
               this.y = char.y;
               scaleX = char.scaleX;
               this.head.scaleX = char.scaleX;
               JustMove(-(char.scaleX * 60 * this.ID),-200);
            }
            lastX = this.x;
            lastY = this.y;
            aPlat.resetplatSides(this.x,this.y,this);
            lastGround = "nothing";
            this.resetCamera();
         }
      }
      
      internal function SitIntroSetupFrame() : *
      {
         this.setIsTall(25);
         this.placeHead(this.char);
         vOffset = this.toVOffset = Main.vOffset = 108;
         this.zOffset = 75;
         wantUD = this.attackUD = 0;
      }
      
      internal function SitIntroEnterFrame() : *
      {
         if(this.char.currentFrameLabel == "a" || this.char.currentFrameLabel == "b" || this.char.currentFrameLabel == "c")
         {
            this.hairGel = this.hairGoTo = this.head.currentFrame;
            this.head.scaleX *= -1;
         }
         if(this.char.currentFrame == 1)
         {
            if(Main.cameraShiftRatio == 1 && (wantRL != 0 || this.JumpIsDown()))
            {
               this.char.nextFrame();
            }
         }
         else if(this.char.currentFrameLabel == "d")
         {
            this.zOffset = 60;
            scaleX = this.head.scaleX = 1;
            aPlatOn = null;
            aPlat.clearAllOns();
            aPlat.resetplatSides(this.x,this.y,this);
            Main.shakeScreen(5,0,true);
            this.char.nextFrame();
            this.placeHead(this.char);
            Sounds.playSound("JustHurtLand",this.x,1,onRail);
         }
         else if(this.char.currentFrame == this.char.totalFrames)
         {
            if(isTouchScreen)
            {
               Main.stageRoot.cinToMaster();
            }
            gotoBuffer = "Idle";
         }
         else
         {
            this.char.nextFrame();
         }
         this.placeHead(this.char);
      }
      
      internal function IdleSetupFrame() : *
      {
         this.justLanded = this.alreadyLanded = false;
         this.setIsTall(25);
         this.placeHead(this.char);
         this.placePencil(this.char);
      }
      
      internal function IdleEnterFrame() : *
      {
         this.char.nextFrame();
         this.controlGround(2);
         if(crossStatus != "nothing")
         {
            gotoBuffer = crossStatus;
         }
         else if(wantRL == 0)
         {
            if(Math.abs(fakeRL) > 5)
            {
               gotoBuffer = "Slide";
            }
         }
         else if(fakeRL * wantRL < -5)
         {
            gotoBuffer = "Slide";
         }
         else if(slippery && fakeRL * wantRL > 10)
         {
            gotoBuffer = "Slide";
         }
         else if(scaleX * wantRL > 0)
         {
            gotoBuffer = "Walk";
         }
         else
         {
            gotoBuffer = "Backpeddle";
         }
         switch(this.char.currentFrame)
         {
            case 10:
               this.attackN = 0;
               break;
            case 18:
               this.char.gotoAndStop(37);
               break;
            case 91:
               this.char.gotoAndStop(20);
         }
         if(this.pencilOut > 0)
         {
            this.placePencil(this.char);
         }
         this.placeHead(this.char);
      }
      
      internal function WalkSetupFrame() : *
      {
         this.setIsTall(25);
         this.headrot = 0;
         if(this.pencilOut > 0)
         {
            this.pencilOut = 15;
         }
         if(this.fromSlide && this.pencilOut == 0)
         {
            this.fromSlide = false;
            this.char.gotoAndStop("fromSlide");
            this.placeHead(this.char);
         }
         else
         {
            if(this.stepUp)
            {
               this.stepUp = false;
               this.char.gotoAndStop(6);
            }
            this.impact = false;
            this.frameSkip = 0;
            if((onWall + onWallPlat) * wantRL > 0)
            {
               this.char.torsoShell.gotoAndStop(2);
               this.char.torsoShell.torsoLand.gotoAndStop(this.char.currentFrame);
               this.char.torsoShell.torsoLand.landingTorso.gotoAndStop("push");
               this.headx = this.char.torsoShell.x + this.char.torsoShell.torsoLand.landingTorso.x + this.char.torsoShell.torsoLand.landingTorso.head.x;
               this.heady = this.char.torsoShell.y + this.char.torsoShell.torsoLand.landingTorso.y + this.char.torsoShell.torsoLand.landingTorso.head.y;
               this.headrot = this.char.torsoShell.torsoLand.landingTorso.head.rotation;
               this.char.torsoShell.torsoLand.landingTorso.head.visible = false;
               if(this.pencilOut > 0)
               {
                  this.resetPencil();
               }
            }
            else if(this.justLanded)
            {
               if(Math.abs(fakeRL) >= 4)
               {
                  if(Math.abs(fakeRL) <= 8)
                  {
                     this.char.gotoAndStop("walkLoopR");
                  }
                  else
                  {
                     this.char.gotoAndStop("jogLoopR");
                  }
               }
               this.impact = true;
               this.char.torsoShell.gotoAndStop(2);
               this.char.torsoShell.torsoLand.stop();
               if(this.landUD > 28 && Math.abs(fakeRL) > 10)
               {
                  this.hairGel = 13;
                  this.head.gotoAndStop(13);
                  this.head.hair.stop();
                  this.char.torsoShell.torsoLand.landingTorso.gotoAndStop("runLand");
                  this.char.torsoShell.torsoLand.landingTorso.y = -22;
               }
               else if(this.alreadyLanded)
               {
                  this.alreadyLanded = false;
                  this.char.torsoShell.torsoLand.landingTorso.gotoAndStop(this.landFrame);
               }
               else
               {
                  this.char.torsoShell.torsoLand.landingTorso.gotoAndStop(1);
               }
               this.headx = this.char.torsoShell.x + this.char.torsoShell.torsoLand.landingTorso.x + this.char.torsoShell.torsoLand.landingTorso.head.x;
               this.heady = this.char.torsoShell.y + this.char.torsoShell.torsoLand.landingTorso.y + this.char.torsoShell.torsoLand.landingTorso.head.y;
               this.headrot = this.char.torsoShell.torsoLand.landingTorso.head.rotation;
               this.char.torsoShell.torsoLand.landingTorso.head.visible = false;
            }
            else if(this.pencilOut > 0 && (this.pencilOut < 15 || Math.abs(fakeRL) > 4))
            {
               this.sheathing = false;
               this.impact = this.justLanded = false;
               this.char.torsoShell.gotoAndStop(2);
               this.char.torsoShell.torsoLand.gotoAndStop(this.char.currentFrame);
               this.char.torsoShell.torsoLand.landingTorso.gotoAndStop(23 + (16 - this.pencilOut));
               this.headx = this.char.torsoShell.x + this.char.torsoShell.torsoLand.landingTorso.x + this.char.torsoShell.torsoLand.landingTorso.head.x;
               this.heady = this.char.torsoShell.y + this.char.torsoShell.torsoLand.landingTorso.y + this.char.torsoShell.torsoLand.landingTorso.head.y;
               this.char.torsoShell.torsoLand.landingTorso.head.visible = false;
               this.pencilX = (this.char.torsoShell.x + this.char.torsoShell.torsoLand.landingTorso.x + this.char.torsoShell.torsoLand.landingTorso.pencil.x) * scaleX;
               this.pencilY = this.char.torsoShell.y + this.char.torsoShell.torsoLand.landingTorso.y + this.char.torsoShell.torsoLand.landingTorso.pencil.y;
               this.pencilRot = this.char.torsoShell.torsoLand.landingTorso.pencil.rotation * scaleX;
               this.char.torsoShell.torsoLand.landingTorso.pencil.visible = false;
            }
            else if(this.pencilOut > 0)
            {
               this.char.torsoShell.gotoAndStop(3);
               this.char.torsoShell.torsoPencil.gotoAndStop(this.char.currentFrame);
               this.headx = this.char.torsoShell.x + this.char.torsoShell.torsoPencil.head.x;
               this.heady = this.char.torsoShell.y + this.char.torsoShell.torsoPencil.head.y;
               this.char.torsoShell.torsoPencil.head.visible = false;
               this.pencilX = (this.char.torsoShell.x + this.char.torsoShell.torsoPencil.pencil.x) * scaleX;
               this.pencilY = this.char.torsoShell.y + this.char.torsoShell.torsoPencil.pencil.y;
               this.pencilRot = this.char.torsoShell.torsoPencil.pencil.rotation * scaleX;
               this.char.torsoShell.torsoPencil.pencil.visible = false;
            }
            else
            {
               this.char.torsoShell.gotoAndStop(1);
               this.char.torsoShell.torsoWalk.gotoAndStop(this.char.currentFrame);
               this.headx = this.char.torsoShell.x + this.char.torsoShell.torsoWalk.head.x;
               this.heady = this.char.torsoShell.y + this.char.torsoShell.torsoWalk.head.y;
               this.char.torsoShell.torsoWalk.head.visible = false;
            }
         }
         this.justLanded = false;
      }
      
      internal function WalkEnterFrame() : *
      {
         this.char.nextFrame();
         this.controlGround();
         if(wantRL == 0)
         {
            if(Math.abs(fakeRL) < 10 && Math.abs(rotation) < 2)
            {
               this.ledgeGrab = true;
            }
            else
            {
               this.ledgeGrab = false;
            }
            if(scaleX * fakeRL < -2)
            {
               this.runtoslide = true;
               gotoBuffer = "Slide";
            }
         }
         else
         {
            this.ledgeGrab = false;
            if(scaleX * wantRL < 0)
            {
               if(Math.abs(fakeRL) > 6)
               {
                  this.runtoslide = true;
                  gotoBuffer = "Slide";
               }
               else
               {
                  gotoBuffer = "Backpeddle";
               }
            }
            else if(Math.abs(fakeRL) < 5 && Math.abs(wallRot) > 80)
            {
               this.TempStillX = true;
               this.tempStilleX = this.x;
               this.runtoslide = true;
               gotoBuffer = "Slide";
            }
         }
         switch(this.char.currentFrame)
         {
            case 10:
               this.attackN = 0;
               break;
            case 11:
               if(this.pencilOut > 0)
               {
                  this.char.torsoShell.gotoAndStop(2);
                  this.char.torsoShell.torsoLand.gotoAndStop(this.char.currentFrame);
                  this.char.torsoShell.torsoLand.landingTorso.gotoAndStop("sheath");
               }
            case 24:
            case 37:
            case 46:
            case 55:
            case 77:
               this.footStep(footX(),footY(),scaleX,wallAngle,fakeRL,slippery);
            case 63:
               if(Math.abs(fakeRL) < 4 && wantRL == 0 && friction > 0.5 || this.RLStatus == "Wall")
               {
                  gotoBuffer = "Slow";
               }
               else if(wantRL * scaleX < 0)
               {
                  if(Math.abs(fakeRL) > 6)
                  {
                     this.runtoslide = true;
                     gotoBuffer = "Slide";
                  }
                  else
                  {
                     gotoBuffer = "Backpeddle";
                  }
               }
               else if(friction < 0.5 && wantRL == 0)
               {
                  this.runtoslide = true;
                  gotoBuffer = "Slide";
               }
               else if(Math.abs(fakeRL) > 18 && Math.abs(maxRL) > 18 && !this.impact)
               {
                  this.char.gotoAndStop("toRun");
                  this.char.torsoShell.stop();
               }
         }
         if(gotoBuffer == "nothing")
         {
            switch(this.char.currentFrame)
            {
               case 24:
               case 46:
                  if(Math.abs(fakeRL) > 8)
                  {
                     this.char.gotoAndStop("jogLoopL");
                  }
                  else
                  {
                     this.char.gotoAndStop("walkLoopL");
                  }
                  break;
               case 11:
               case 37:
               case 55:
                  if(Math.abs(fakeRL) > 8)
                  {
                     this.char.gotoAndStop("jogLoopR");
                  }
                  else
                  {
                     this.char.gotoAndStop("walkLoopR");
                  }
                  break;
               case 59:
                  gotoBuffer = "Run";
                  break;
               case 65:
                  this.char.gotoAndStop("jogLoopR");
                  this.WalkSetupFrame();
            }
         }
         if(this.char.currentFrame < 61)
         {
            switch(this.char.torsoShell.currentFrame)
            {
               case 1:
                  if(onWall * wantRL > 0 || onWallPlat * wantRL > 0)
                  {
                     this.char.torsoShell.gotoAndStop(2);
                     this.char.torsoShell.torsoLand.gotoAndStop(this.char.currentFrame);
                     this.char.torsoShell.torsoLand.landingTorso.gotoAndStop("push");
                     this.headx = this.char.torsoShell.x + this.char.torsoShell.torsoLand.landingTorso.x + this.char.torsoShell.torsoLand.landingTorso.head.x;
                     this.heady = this.char.torsoShell.y + this.char.torsoShell.torsoLand.landingTorso.y + this.char.torsoShell.torsoLand.landingTorso.head.y;
                     this.headrot = this.char.torsoShell.torsoLand.landingTorso.head.rotation;
                     this.char.torsoShell.torsoLand.landingTorso.head.visible = false;
                  }
                  else
                  {
                     this.char.torsoShell.torsoWalk.gotoAndStop(this.char.currentFrame);
                     this.headx = this.char.torsoShell.x + this.char.torsoShell.torsoWalk.head.x;
                     this.heady = this.char.torsoShell.y + this.char.torsoShell.torsoWalk.head.y;
                     this.headrot = 0;
                     this.char.torsoShell.torsoWalk.head.visible = false;
                  }
                  break;
               case 2:
                  if(this.char.torsoShell.torsoLand.landingTorso.currentFrame > 39 && this.char.torsoShell.torsoLand.landingTorso.currentFrame < 49)
                  {
                     if(!(onWall * wantRL > 0 || onWallPlat * wantRL > 0))
                     {
                        this.char.torsoShell.gotoAndStop(1);
                        this.char.torsoShell.torsoWalk.gotoAndStop(this.char.currentFrame);
                        this.headx = this.char.torsoShell.x + this.char.torsoShell.torsoWalk.head.x;
                        this.heady = this.char.torsoShell.y + this.char.torsoShell.torsoWalk.head.y;
                        this.headrot = 0;
                        this.char.torsoShell.torsoWalk.head.visible = false;
                        break;
                     }
                     if(this.char.torsoShell.torsoLand.landingTorso.currentFrame < 46)
                     {
                        this.char.torsoShell.torsoLand.landingTorso.nextFrame();
                     }
                  }
                  else if(this.pencilOut > 0)
                  {
                     this.char.torsoShell.torsoLand.landingTorso.gotoAndStop(23 + (16 - this.pencilOut));
                     --this.pencilOut;
                     this.char.torsoShell.torsoLand.landingTorso.pencil.gotoAndStop(1);
                  }
                  else if(onWall * wantRL > 0 || onWallPlat * wantRL > 0)
                  {
                     this.char.torsoShell.torsoLand.landingTorso.gotoAndStop("push");
                  }
                  else
                  {
                     this.char.torsoShell.torsoLand.landingTorso.nextFrame();
                  }
                  this.char.torsoShell.torsoLand.gotoAndStop(this.char.currentFrame);
                  if(this.char.torsoShell.torsoLand.landingTorso.currentFrame == 22 || this.char.torsoShell.torsoLand.landingTorso.currentFrame == 38 || this.char.torsoShell.torsoLand.landingTorso.currentFrame == this.char.torsoShell.torsoLand.landingTorso.totalFrames)
                  {
                     this.impact = false;
                     this.char.torsoShell.gotoAndStop(1);
                     this.char.torsoShell.torsoWalk.gotoAndStop(this.char.currentFrame);
                     this.headx = this.char.torsoShell.x + this.char.torsoShell.torsoWalk.head.x;
                     this.heady = this.char.torsoShell.y + this.char.torsoShell.torsoWalk.head.y;
                     this.char.torsoShell.torsoWalk.head.visible = false;
                     this.resetPencil(this.Pencil.visible);
                  }
                  else
                  {
                     this.headx = this.char.torsoShell.x + this.char.torsoShell.torsoLand.landingTorso.x + this.char.torsoShell.torsoLand.landingTorso.head.x;
                     this.heady = this.char.torsoShell.y + this.char.torsoShell.torsoLand.landingTorso.y + this.char.torsoShell.torsoLand.landingTorso.head.y;
                     this.headrot = this.char.torsoShell.torsoLand.landingTorso.head.rotation;
                     this.char.torsoShell.torsoLand.landingTorso.head.visible = false;
                     if(hasPencil)
                     {
                        if(this.pencilOut > 0)
                        {
                           this.pencilX = (this.char.torsoShell.x + this.char.torsoShell.torsoLand.landingTorso.x + this.char.torsoShell.torsoLand.landingTorso.pencil.x) * scaleX;
                           this.pencilY = this.char.torsoShell.y + this.char.torsoShell.torsoLand.landingTorso.y + this.char.torsoShell.torsoLand.landingTorso.pencil.y;
                           this.pencilRot = this.char.torsoShell.torsoLand.landingTorso.pencil.rotation * scaleX;
                           this.Pencil.scaleY = this.char.torsoShell.torsoLand.landingTorso.pencil.scaleY;
                           this.char.torsoShell.torsoLand.landingTorso.pencil.visible = false;
                        }
                     }
                  }
                  break;
               case 3:
                  this.char.torsoShell.torsoPencil.gotoAndStop(this.char.currentFrame);
                  this.headx = this.char.torsoShell.x + this.char.torsoShell.torsoPencil.head.x;
                  this.heady = this.char.torsoShell.y + this.char.torsoShell.torsoPencil.head.y;
                  this.char.torsoShell.torsoPencil.head.visible = false;
                  this.pencilX = (this.char.torsoShell.x + this.char.torsoShell.torsoPencil.pencil.x) * scaleX;
                  this.pencilY = this.char.torsoShell.y + this.char.torsoShell.torsoPencil.pencil.y;
                  this.pencilRot = this.char.torsoShell.torsoPencil.pencil.rotation * scaleX;
                  this.char.torsoShell.torsoPencil.pencil.visible = false;
            }
         }
         else
         {
            this.placeHead(this.char);
         }
      }
      
      internal function RunSetupFrame() : *
      {
         this.resetPencil();
         this.char.gotoAndStop([1,14,27][Math.floor(Math.random() * 3)]);
         this.placeHead(this.char);
         this.moveSound = -0.5;
         this.fadeInMoveSound("JumpWind",0.02,Math.abs(fakeRL) * 0.05);
      }
      
      internal function RunEnterFrame() : *
      {
         this.char.nextFrame();
         this.controlGround();
         if(Math.abs(wantRL) < 0.9 || scaleX * wantRL < 0 || maxRL < 20)
         {
            this.runtoslide = true;
            gotoBuffer = "Slide";
         }
         else if(slippery && scaleX * wantRL > 0)
         {
            this.runtoslide = true;
            gotoBuffer = "Slide";
         }
         else if(onWall != 0 || onWallPlat != 0)
         {
            this.stepUp = true;
            gotoBuffer = "Walk";
         }
         else if(Math.abs(fakeRL) < 18)
         {
            this.runtoslide = true;
            gotoBuffer = "Slide";
         }
         this.fadeInMoveSound("JumpWind",0.02,Math.abs(fakeRL) * 0.05);
         if(Math.abs(rotation) > 15)
         {
            this.hairRL = fakeRL;
            this.hairUD = 0;
         }
         switch(this.char.currentFrame)
         {
            case 5:
            case 11:
            case 18:
            case 24:
            case 31:
            case 37:
               this.footStep(footX(),footY(),scaleX,wallAngle,fakeRL,slippery);
               break;
            case 13:
            case 26:
            case 39:
               this.char.gotoAndStop([1,14,27][Math.floor(Math.random() * 3)]);
         }
      }
      
      internal function SlowSetupFrame() : *
      {
         this.resetPencil();
         this.placeHead(this.char);
      }
      
      internal function SlowEnterFrame() : *
      {
         this.char.nextFrame();
         this.controlGround();
         if(wantRL != 0)
         {
            if(scaleX * wantRL > 0)
            {
               gotoBuffer = "Walk";
            }
            else
            {
               gotoBuffer = "Backpeddle";
            }
         }
         switch(this.char.currentFrame)
         {
            case 1:
            case 9:
               this.footStep(footX(),footY(),scaleX,wallAngle,fakeRL,slippery);
               break;
            case 12:
               if(this.isCarrying == "pencil")
               {
                  gotoBuffer = "pencilIdle";
               }
               else
               {
                  gotoBuffer = "Idle";
               }
         }
         this.placeHead(this.char);
      }
      
      internal function BackpeddleSetupFrame() : *
      {
         this.placeHead(this.char);
         scaleX *= -1;
         this.head.scaleX = scaleX;
         this.headrot = 0;
         if(this.hairGel > 20)
         {
            this.hairGel = this.hairGoTo = 137;
            this.head.gotoAndStop(137);
         }
         if(scaleX * wantRL < 0 && fakeRL * wantRL < -10)
         {
            gotoBuffer = "Slide";
         }
         if(this.pencilOut < 5)
         {
            this.resetPencil();
         }
         this.placePencil(this.char);
         smokeN = 0;
         if(Status == "Slide")
         {
            this.fadeInMoveSound("InkBoardSliding",0.25,Math.abs(fakeRL) * 0.05);
         }
      }
      
      internal function BackpeddleEnterFrame() : *
      {
         this.char.nextFrame();
         this.controlGround();
         this.ledgeGrab = false;
         if(wantRL == 0)
         {
            if((Math.abs(fakeRL) > 3 || scaleX * fakeRL < 0 || this.char.currentFrame > 18) && fakeRL != 0)
            {
               fakeRL -= fakeRL / Math.abs(fakeRL);
            }
            else
            {
               fakeRL += scaleX / 400;
            }
            if(fakeRL != 0 && Math.abs(fakeRL) < 10 && Math.abs(rotation) < 2)
            {
               this.ledgeGrab = true;
            }
         }
         if(wantRL * scaleX < 0)
         {
            if(this.char.currentFrame < 16)
            {
               this.char.gotoAndStop(16);
            }
            this.char.nextFrame();
            if(this.char.currentFrame > 19)
            {
               this.footStep(footX(),footY(),scaleX,wallAngle,fakeRL,slippery);
               gotoBuffer = "Idle";
            }
         }
         else if(this.char.currentFrame == 23)
         {
            this.footStep(footX(),footY(),scaleX,wallAngle,fakeRL,slippery);
            gotoBuffer = "Idle";
         }
         switch(this.char.currentFrame)
         {
            case 9:
               this.footStep(footX(),footY(),scaleX,wallAngle,fakeRL,slippery);
               break;
            case 10:
               this.attackN = 0;
               break;
            case 11:
               if(wantRL == 0 || this.RLStatus == "Wall")
               {
                  this.char.gotoAndStop(17);
               }
               break;
            case 15:
               this.stepUp = true;
               gotoBuffer = "Walk";
         }
         this.placeHead(this.char);
         this.placePencil(this.char);
         this.headrot = 0;
         if(fakeRL * scaleX < 0 && Status == "SlideBackpeddle")
         {
            this.fadeInMoveSound("InkBoardSliding",0.25,Math.abs(fakeRL) * 0.05);
         }
         else if(currentSound != null)
         {
            Sounds.stopSound(currentSound);
         }
      }
      
      internal function SlideSetupFrame() : *
      {
         smokeN = 0;
         this.performN = 10;
         if(this.TempStill)
         {
            this.b = 3;
         }
         if(isTall < 25)
         {
            this.setIsTall(25);
            this.char.gotoAndStop(18);
         }
         else if(this.runtoslide)
         {
            this.runtoslide = false;
         }
         else
         {
            this.char.gotoAndStop(31);
         }
         if(Status != "DownSlide" && Status != "Land")
         {
            this.moveSound = 0;
         }
         this.fadeInMoveSound("InkBoardSliding",0.25,Math.abs(fakeRL) * 0.05);
         if(this.pencilOut < 7)
         {
            this.resetPencil();
         }
         this.placeHead(this.char);
         this.placePencil(this.char);
      }
      
      internal function SlideEnterFrame() : *
      {
         var temp:int = 0;
         var rand:Number = NaN;
         if(this.char.currentFrame > 10)
         {
            temp = 33 - Math.round(Math.abs(fakeRL) * 0.8);
            if(temp < 11)
            {
               temp = 11;
            }
            if(temp < this.char.currentFrame - 1)
            {
               this.char.prevFrame();
            }
            if(temp < this.char.currentFrame)
            {
               this.char.prevFrame();
            }
            if(temp > this.char.currentFrame + 1)
            {
               this.char.nextFrame();
            }
            if(temp > this.char.currentFrame)
            {
               this.char.nextFrame();
            }
         }
         else
         {
            this.char.nextFrame();
         }
         if(this.TempStillX)
         {
            if(Math.abs(this.tempStilleX - this.x) > 20)
            {
               this.TempStillX = false;
            }
            this.ledgeGrab = false;
         }
         else if(wantRL == 0 || Math.abs(wantRL) < 0.9 && fakeRL / wantRL > maxRL)
         {
            if(Still)
            {
               slideSlow(2);
            }
            else
            {
               slideSlow(1);
            }
            footSlide(footX(),footY(),scaleX,wallAngle,fakeRL,slippery);
            if(Math.abs(fakeRL) < 15 && Math.abs(rotation) < 5)
            {
               this.ledgeGrab = true;
            }
            else
            {
               this.ledgeGrab = false;
            }
         }
         else
         {
            this.controlGround();
            if(fakeRL * wantRL > -10)
            {
               this.ledgeGrab = false;
               if(scaleX * wantRL > 0)
               {
                  if((1 > rotAccel * wantRL && fakeRL * wantRL < 15 || !slippery) && (this.char.currentFrame > 9 || fakeRL / wantRL < maxRL) && (!sliding || wallRot * wantRL < 0))
                  {
                     if(this.char.currentFrame < 29)
                     {
                        this.fromSlide = true;
                     }
                     gotoBuffer = "Walk";
                  }
               }
               else
               {
                  if(smokeN <= 0)
                  {
                     rand = Math.random() * 0.5 + 0.5;
                     StarlingEffect.Spawn("smokePuff",footX() + RLx(fakeRL * 0.5),footY() + RLy(fakeRL * 0.5),wallAngle + Math.random() * 0.2 + scaleX,scaleX * rand,RLx(fakeRL * (0.5 + rand)) + UDx(-2 * (0.5 + rand)),RLy(fakeRL * (0.5 + rand)) + UDy(-2 * rand) - 1,onRail);
                  }
                  if(this.char.currentFrame > 27 || this.char.currentFrame == 1)
                  {
                     gotoBuffer = "Backpeddle";
                  }
                  else
                  {
                     gotoBuffer = "SlideBackpeddle";
                  }
               }
            }
            else
            {
               if(smokeN > 0)
               {
                  smokeN -= Math.abs(fakeRL);
               }
               else
               {
                  rand = 0.4 + Math.random() * 0.4 + Math.abs(fakeRL) * 0.02;
                  StarlingEffect.Spawn("smokePuff",footX() + RLx(fakeRL * 0.5),footY() + RLy(fakeRL * 0.5),wallAngle + Math.random() * 0.2 + scaleX,scaleX * rand,RLx(fakeRL * (1 + rand)) + UDx(-2 * (0.5 + rand)),RLy(fakeRL * (1 + rand)) + UDx(-2 * (0.5 + rand)) - 1,onRail);
                  smokeN = 20;
               }
               this.ledgeGrab = true;
               if(Math.abs(fakeRL) < 0.2)
               {
                  fakeRL = 0;
               }
               if(this.char.currentFrame > 5 && this.char.currentFrame < 10)
               {
                  this.char.gotoAndStop(10);
               }
            }
         }
         this.fadeInMoveSound("InkBoardSliding",0.25,Math.abs(fakeRL) * 0.05);
         switch(this.char.currentFrame)
         {
            case 10:
               this.char.gotoAndStop(21);
               break;
            case 33:
               gotoBuffer = "Idle";
         }
         if(Math.abs(rotation) > 15)
         {
            this.hairRL = fakeRL;
            this.hairUD = 0;
         }
         this.placePencil(this.char);
         this.placeHead(this.char);
      }
      
      internal function JumpSetupFrame() : *
      {
         if(Status == "Kick")
         {
            return false;
         }
         this.setIsTall(25);
         if((platRL + groundRL + wallRL) * fakeRL < -1 || (platRL + groundRL + wallRL) * wantRL < -1)
         {
            platRL *= 0.5;
            groundRL *= 0.5;
            wallRL *= 0.5;
         }
         else if(wantRL == 0 && fakeRL == 0)
         {
            platRL *= 0.6;
         }
         if(onWallPlat != 0)
         {
            fakeRL *= 0.5;
         }
         tempRL = fakeRL + platRL + groundRL + wallRL;
         tempUD = -Jumper;
         if(Status == "LedgeHang")
         {
            tempUD += wallUD;
         }
         else if(Status == "Hang")
         {
            tempUD += platUD;
         }
         else if(Jumper <= 2)
         {
            tempUD += platUD * 0.8;
            tempUD += wallUD * 0.8;
            tempUD += groundUD * 0.8;
         }
         else
         {
            if(platUD < 0)
            {
               tempUD += platUD * 0.8;
            }
            if(wallUD < 0)
            {
               tempUD += wallUD;
            }
            if(groundUD < 0)
            {
               tempUD += groundUD * 0.8;
            }
         }
         oldWallRot = tempRot = wallRot;
         oldFakeRL = tempRL;
         this.moveSound = -1;
         this.followStick = false;
         if(this.hitGround < 20)
         {
            this.hitGround = 20;
         }
         if(Status == "Zip" || Status == "ZipAir")
         {
            wallRot = 0;
         }
         else if(Jumper > 5 && Status != "Stomp" && (wantRL != 0 || Math.abs(fakeRL) > 10))
         {
            if(Math.abs(wallRot) < 90)
            {
               if(fakeRL * wallRot > 0)
               {
                  if(Math.abs(wallRot) < 20)
                  {
                     wallRot = tempRot = 0;
                  }
                  else
                  {
                     wallRot *= (Math.abs(wallRot) - 20) / 70;
                     tempRot = wallRot;
                  }
               }
               else if(wantRL * fakeRL > 0)
               {
                  if(Math.abs(wallRot) < 25)
                  {
                     wallRot *= 0.25;
                  }
                  else
                  {
                     wallRot *= 0.75;
                  }
               }
               else if(Math.abs(fakeRL) > 5)
               {
                  wallRot *= 0.8;
               }
            }
            else if(wantRL * fakeRL > 2)
            {
               if(wallRot > 0)
               {
                  wallRot = (90 + wallRot) / 2;
               }
               else
               {
                  wallRot = (-90 + wallRot) / 2;
               }
            }
         }
         if(aPlatOn != null)
         {
            if(aPlatOn.springY > -5)
            {
               aPlatOn.springY += 20;
            }
            aPlat.aPlatOnClear(this);
         }
         if(aWallOn != null)
         {
            if(aWallOn.getStatus() == "Mushy")
            {
               oldFakeUD = -12;
            }
            aWall.aWallOnClear(this);
         }
         angle = wallRot * Math.PI / 180;
         tempAngle = tempRot * Math.PI / 180;
         moveRL = Math.cos(angle) * tempRL - Math.sin(angle) * tempUD;
         moveUD = Math.cos(tempAngle) * tempUD + Math.sin(tempAngle) * tempRL;
         if(Math.abs(wallRot) > 45)
         {
            if(Math.abs(wallRot) > 90)
            {
               this.fliprot = -10;
            }
            else
            {
               this.fliprot = -5;
            }
            this.fliprot *= scaleX / Math.abs(scaleX);
         }
         else
         {
            this.fliprot = 0;
         }
         if(Status == "InkBoard" && Math.abs(wallRot) < 60)
         {
            rotation *= 0.5;
            this.char.gotoAndStop("longJump");
         }
         else if(Jumper <= 2)
         {
            if(scaleX * tempRL < 0)
            {
               if(Math.abs(wallRot) < 120)
               {
                  rotter = this.fliprot = 0;
               }
               this.char.gotoAndStop("dropJump");
               this.char.char.gotoAndStop(3);
            }
            else if(onWall + onWallPlat != 0 && moveUD < -5)
            {
               this.fliprot = 0;
               rotation *= 0.5;
               this.char.gotoAndStop("normal");
               this.char.char.gotoAndStop(2);
            }
            else if(moveUD < -2 && !this.TempStill && wantRL * scaleX < 0 && Math.abs(moveRL) > 10)
            {
               this.char.gotoAndStop("backflip");
            }
            else if(Math.abs(wallRot) > 45 && Math.abs(fakeRL) > 15 && this.fliprot != 0 && moveUD < 0)
            {
               this.frames = 4;
               this.char.gotoAndStop("Matrix");
               this.char.char.gotoAndPlay(4);
            }
            else if(Math.abs(wallRot) > 100)
            {
               this.frames = 4;
               this.char.gotoAndStop("Matrix");
               this.char.char.gotoAndStop(4);
            }
            else if(Status == "Walk")
            {
               this.fliprot = 0;
               this.char.gotoAndStop("runJump");
            }
            else if(Status == "Hang")
            {
               this.fliprot = 0;
               if(Math.abs(fakeRL) > 10)
               {
                  this.char.gotoAndStop("runJump");
                  this.legFrame = 59;
                  this.char.char.gotoAndStop(14);
               }
               else
               {
                  this.char.gotoAndStop("dropJump");
               }
            }
            else if((Math.abs(moveRL) > 18 || Status == "Run") && moveRL * scaleX > 0)
            {
               this.fliprot = 0;
               this.char.gotoAndStop("longJump");
               this.char.char.gotoAndStop(4);
            }
            else if(Status == "Idle" || Status == "Slow" || Status == "Land" || Status == "Slide" || Status == "DownSlide" || Status == "InkBoard")
            {
               if(Math.abs(wallRot) < 120)
               {
                  rotter = this.fliprot = 0;
               }
               this.char.gotoAndStop("dropJump");
            }
            else if(Math.abs(moveRL) < 5 && Math.abs(moveUD) < 10)
            {
               if(Math.abs(wallRot) < 120)
               {
                  this.fliprot = 0;
               }
               this.char.gotoAndStop("dropJump");
            }
            else if(Math.abs(tempRL) > Math.abs(Jumper) * 0.8 && moveRL * scaleX > 0)
            {
               this.fliprot = 0;
               this.char.gotoAndStop("runJump");
            }
            else
            {
               this.fliprot = 0;
               this.char.gotoAndStop("normal");
            }
         }
         else
         {
            tempRL = wantRL * 5;
            if(this.toPencil)
            {
               this.toPencil = false;
               gotoBuffer = "PencilAir";
               this.char.char.gotoAndStop(1);
            }
            else if(!this.TempStill && !Still && wantRL * scaleX < 0)
            {
               this.fliprot = rotter = -scaleX * 20;
               this.char.gotoAndStop("backflip");
               this.placeHead(this.char.char);
               this.char.char.gotoAndStop(1);
            }
            else if(Jumper < 18 && FloatUp == 0)
            {
               this.char.gotoAndStop("dropJump");
               this.char.char.gotoAndStop(3);
               rotter = fakeRL;
            }
            else if(Math.abs(moveRL) > 21 && moveRL * scaleX > 0)
            {
               this.fliprot = 0;
               this.char.gotoAndStop("longJump");
               this.char.char.gotoAndStop(1);
            }
            else if(Status == "Stomp" || Status == "PencilAir")
            {
               rotter = moveRL * 1.5;
               if(Math.abs(rotter) > 15)
               {
                  rotter = makeOne(rotter) * 15;
               }
               if(moveRL * scaleX < 0 && Math.abs(moveRL) > 5 && (Jumper < 15 || wallRot != 0))
               {
                  if(Math.abs(wallRot) > 60)
                  {
                     this.fliprot = rotter = 0;
                  }
                  else
                  {
                     rotter *= 0.5;
                  }
                  this.char.gotoAndStop("dropJump");
               }
               else
               {
                  this.char.gotoAndStop("normal");
               }
               this.char.char.gotoAndStop(1);
            }
            else if(Math.abs(wallRot) > 120 && this.fliprot != 0)
            {
               this.frames = 1;
               this.canQuickDrop = false;
               this.char.gotoAndStop("Matrix");
               this.char.char.gotoAndStop(1);
            }
            else if(Math.abs(wallRot) > 45 && wantRL == 0 && scaleX * wallRot < 0)
            {
               this.frames = 1;
               this.canQuickDrop = false;
               this.char.gotoAndStop("Matrix");
               this.char.char.gotoAndStop(1);
            }
            else if(Math.abs(wallRot) > 60)
            {
               this.frames = 1;
               this.canQuickDrop = false;
               this.char.gotoAndStop("Matrix");
               this.char.char.gotoAndStop(1);
            }
            else if(Jumper < 12)
            {
               this.char.gotoAndStop("dropJump");
               this.char.char.gotoAndStop(1);
            }
            else if(Jumper < 18 && FloatUp == 0)
            {
               this.char.gotoAndStop("dropJump");
               this.char.char.gotoAndStop(3);
            }
            else
            {
               if(this.pencilOut > 10)
               {
                  this.char.gotoAndStop("airSheath");
               }
               else
               {
                  this.char.gotoAndStop("normal");
               }
               this.fliprot = 0;
               rotter = moveRL * 1.3;
               if(Math.abs(rotter) > 17)
               {
                  rotter = makeOne(rotter) * 17;
               }
               if(Math.abs(moveRL) > 15)
               {
                  rotation += rotCompare(-Math.atan2(-makeOne(moveRL) * 15,-tempUD) / (Math.PI / 180),rotation) * 0.3;
               }
               else
               {
                  rotation += rotCompare(-Math.atan2(-moveRL,-tempUD) / (Math.PI / 180),rotation) * 0.3;
               }
               this.char.char.gotoAndStop(1);
            }
            if(Status != "Stomp")
            {
               this.x += -Math.sin(angle) * tempUD * Main.framin;
               this.y += Math.cos(angle) * tempUD * Main.framin;
            }
         }
         if(this.fliprot != 0)
         {
            rotter = this.fliprot;
         }
         this.smoothScroll = this.smoothScrollX;
         fakeRL = moveRL;
         fakeUD = moveUD;
         landSpeed = 0;
         this.flailing = false;
         bounce = onLedge = this.attackN = 0;
         this.char.char.stop();
         switch(this.char.currentFrameLabel)
         {
            case "airSheath":
               this.placePencil(this.char.char);
            case "normal":
               this.hairGel = 101;
               this.head.gotoAndStop(101);
               this.rightChar();
               if(this.canSpin)
               {
                  this.canSpin = false;
               }
               else if(moveUD > 20)
               {
                  this.char.char.gotoAndStop("felled");
               }
               else if(moveUD > 10)
               {
                  this.char.char.gotoAndStop("falling");
               }
               break;
            case "runJump":
               if(this.legFrame > 55)
               {
                  this.legFrame = 0;
               }
               else if(this.legFrame > 46)
               {
                  this.legFrame -= 46;
               }
               else if(this.legFrame > 37)
               {
                  this.legFrame -= 37;
               }
               else if(this.legFrame > 24)
               {
                  this.legFrame -= 24;
                  this.legFrame *= 0.666;
               }
               else if(this.legFrame > 11)
               {
                  this.legFrame -= 11;
                  this.legFrame *= 0.666;
               }
               if(this.legFrame == 8)
               {
                  this.legFrame = 1;
               }
               this.char.char.gotoAndStop(this.legFrame + 1);
               this.placePencil(this.char.char);
               break;
            case "longJump":
               this.moveSound = 0;
               this.rightChar();
               this.placePencil(this.char.char);
               if(this.canSpin)
               {
                  this.canSpin = false;
               }
               this.flailing = true;
               break;
            case "backflip":
               rotation = wallRot;
               this.hairRL = 0;
               this.fliprot = -scaleX * 5;
               this.canSpin = false;
               this.backFlipRot = rotation * scaleX;
               this.trueRot = 0;
               this.isDoubling = false;
               tempRot = -25;
               this.frames = 1;
               break;
            case "Matrix":
               this.startRot = this.backFlipRot = rotation;
               this.flipDir = -this.fliprot / Math.abs(this.fliprot);
               tempRot = -11 * this.flipDir;
         }
         if(this.char.currentFrameLabel != "airSheath" && this.char.currentFrameLabel != "runJump" && this.char.currentFrameLabel != "longJump" && this.pencilOut > 0)
         {
            this.resetPencil();
         }
         Jumper = 0;
         this.onWallN = 20;
         platRL = platUD = groundRL = groundUD = wallRL = wallUD = 0;
         wallRot = angle1 = angle2 = 0;
         this.clearStompedOn();
         initialFloat = FloatUp;
         if(this.FloatStill || Still)
         {
            this.wallJumped = true;
         }
         else
         {
            this.wallJumped = false;
         }
         wallHanging = false;
         this.alreadyPredicted = false;
         this.predictGround();
         this.placeHead(this.char.char);
      }
      
      internal function JumpEnterFrame() : *
      {
         this.controlAir();
         this.fancyGravity();
         switch(this.char.currentFrameLabel)
         {
            case "airSheath":
            case "normal":
               if(this.char.char.currentFrame > 31)
               {
                  this.rightChar();
               }
               else if(this.char.char.currentFrame > 7 || scaleX * moveRL < 0)
               {
                  rotter += (-rotation * 0.15 - rotter) * 0.5;
                  rotter *= 0.8;
               }
               else
               {
                  oldWallRot *= 0.75;
                  this.temp = (-rotation + oldWallRot * 0.8) * 0.3;
                  if(rotter * scaleX > 0)
                  {
                     rotter += (this.temp - rotter) / 10;
                  }
                  else
                  {
                     rotter += (this.temp - rotter) / -(moveUD - 40);
                  }
               }
               if(moveUD > -14 || this.char.char.currentFrame < 6)
               {
                  this.char.char.nextFrame();
               }
               switch(this.char.char.currentFrameLabel)
               {
                  case "1":
                     if(this.waterLanding)
                     {
                        this.char.gotoAndStop("cannonBall");
                        this.char.char.stop();
                     }
                     else if(!(Math.abs(rotation) > 45 && this.fliprot != 0))
                     {
                        if(Math.abs(moveRL) > 6 && moveRL * scaleX > 0)
                        {
                           this.char.char.gotoAndStop("longJump");
                        }
                     }
                     break;
                  case "2":
                     if(this.waterLanding)
                     {
                        this.char.gotoAndStop("cannonBall");
                     }
                     break;
                  case "3":
                     this.char.gotoAndStop("fallLoop");
                     this.char.char.stop();
                     break;
                  case "4":
                     this.char.gotoAndStop("longFall");
                     this.char.char.stop();
                     break;
                  case "5":
                     if(this.char.char.body.currentFrame == this.char.char.body.totalFrames)
                     {
                        this.char.char.body.gotoAndStop(1);
                     }
                     else
                     {
                        this.char.char.body.nextFrame();
                     }
               }
               break;
            case "fallLoop":
               this.char.char.nextFrame();
               if(this.char.char.currentFrame == this.char.char.totalFrames)
               {
                  this.char.char.gotoAndStop(1);
               }
               rotter += (-rotation * 0.15 - rotter) * 0.5;
               rotter *= 0.8;
               break;
            case "longJump":
               this.char.char.nextFrame();
               this.placePencil(this.char.char);
               this.rightChar();
               break;
            case "longFall":
               this.char.char.nextFrame();
               this.rightChar();
               switch(this.char.char.currentFrameLabel)
               {
                  case "1":
                     this.char.char.gotoAndStop("longLoop");
               }
               break;
            case "backflip":
               fakeRL = moveRL;
               if(this.fliprot != 0)
               {
                  this.shouldRot = -Math.atan2(-moveRL,-this.landUD) / (Math.PI / 180) * (scaleX / 1);
                  if(this.shouldRot > 0)
                  {
                     this.shouldRot -= 360;
                  }
                  this.targetRot = this.shouldRot - 180;
                  if(this.targetRot < -360)
                  {
                     this.targetRot = -360;
                  }
                  if(this.isDoubling)
                  {
                     if(this.hitGround < 6)
                     {
                        this.temp = (this.targetRot - this.backFlipRot) / 2;
                     }
                     else
                     {
                        this.temp = (this.targetRot - this.backFlipRot) / (this.hitGround - 4);
                     }
                  }
                  else if(this.hitGround > 3)
                  {
                     this.temp = (this.targetRot - this.backFlipRot) / this.hitGround;
                  }
                  else
                  {
                     this.temp = (this.targetRot - this.backFlipRot) / 3;
                  }
                  if(this.temp < -20)
                  {
                     tempRot += (-20 - tempRot) / 1;
                  }
                  else
                  {
                     tempRot += (this.temp - tempRot) / 1;
                  }
                  this.backFlipRot += tempRot;
                  rotter = tempRot * scaleX;
                  this.trueRot += tempRot;
                  ++this.frames;
                  this.temp = Math.floor(-this.trueRot / 11) + 1;
                  if(this.waterLanding)
                  {
                     if(this.isDoubling)
                     {
                        this.isDoubling = false;
                        this.backFlipRot -= 360;
                     }
                  }
                  else if(this.isDoubling)
                  {
                     if(this.hitGround + this.frames < 43 && this.temp < 23)
                     {
                        this.isDoubling = false;
                        this.backFlipRot -= 360;
                     }
                  }
                  else if(this.hitGround + this.frames >= 43)
                  {
                     this.isDoubling = true;
                     this.backFlipRot += 360;
                  }
                  if(this.temp > 23 && !this.isDoubling)
                  {
                     if(this.temp + 100 < 133 || this.waterLanding)
                     {
                        this.goFrame = this.temp + 100;
                     }
                     else
                     {
                        this.goFrame = 133;
                     }
                  }
                  else if(this.temp < 133 || this.waterLanding)
                  {
                     this.goFrame = this.temp;
                  }
                  else
                  {
                     this.goFrame = 133;
                  }
                  if(this.goFrame > 56 && this.waterLanding)
                  {
                     this.char.char.gotoAndStop(this.goFrame + 11);
                  }
                  else
                  {
                     this.char.char.gotoAndStop(this.goFrame);
                  }
               }
               break;
            case "runJump":
               this.char.char.nextFrame();
               this.rightChar();
               this.placePencil(this.char.char);
               switch(this.char.char.currentFrameLabel)
               {
                  case "1":
                     if(this.waterLanding)
                     {
                        this.char.gotoAndStop("cannonBall");
                        this.char.char.stop();
                     }
                     break;
                  case "2":
                     this.char.gotoAndStop("longFall");
                     this.char.char.stop();
               }
               break;
            case "Matrix":
               if(this.fliprot != 0)
               {
                  this.shouldRot = -Math.atan2(-moveRL,-this.landUD) / (Math.PI / 180);
                  if(this.flipDir > 0)
                  {
                     if(this.shouldRot > 0)
                     {
                        this.shouldRot -= 360;
                     }
                     this.targetRot = this.shouldRot - 180;
                  }
                  else
                  {
                     if(this.shouldRot < 0)
                     {
                        this.shouldRot += 360;
                     }
                     this.targetRot = this.shouldRot + 180;
                  }
                  if(Math.abs(this.backFlipRot) > 250)
                  {
                     this.backFlipRot += (360 * makeOne(this.backFlipRot) - this.backFlipRot) / 10;
                     rotter = (360 * makeOne(this.backFlipRot) - this.backFlipRot) / 10;
                  }
                  else
                  {
                     if(this.hitGround < 5)
                     {
                        this.temp = (this.targetRot - this.backFlipRot) / 5;
                     }
                     else
                     {
                        this.temp = (this.targetRot - this.backFlipRot) / this.hitGround;
                     }
                     if(Math.abs(this.temp) > 10)
                     {
                        tempRot += (makeOne(this.temp) * 10 - tempRot) / 10;
                     }
                     else
                     {
                        tempRot += (this.temp - tempRot) / 10;
                     }
                     this.backFlipRot += tempRot;
                     rotter = tempRot;
                  }
                  this.char.char.nextFrame();
               }
               break;
            case "wallOn":
               this.moveSound = -1;
               if(currentSound != null)
               {
                  Sounds.stopSound(currentSound);
                  currentSound = null;
               }
               if(wantRL != 0 && this.wallJumped)
               {
                  this.wallJumped = false;
               }
               if(this.canWallHang())
               {
                  if(this.char.char.currentFrame > 20)
                  {
                     this.char.char.prevFrame();
                  }
                  if(this.char.char.currentFrame > 20)
                  {
                     this.char.char.prevFrame();
                  }
                  if(this.char.char.currentFrame < 20)
                  {
                     this.char.char.nextFrame();
                  }
               }
               else if(this.char.char.currentFrame < 20)
               {
                  this.wallJumped = false;
                  wallHanging = false;
                  this.char.char.gotoAndStop("wallFrontFall");
               }
               else if(this.char.char.currentFrameLabel == "end")
               {
                  wallHanging = false;
                  this.wallJumped = false;
                  this.char.gotoAndStop("dropJump");
                  this.char.char.gotoAndStop(10);
               }
               else
               {
                  this.wallJumped = false;
                  wallHanging = false;
                  this.char.char.nextFrame();
               }
               if(Math.abs(landSpeed) > 1)
               {
                  landSpeed -= makeOne(landSpeed);
               }
               wallRot = 0;
               this.tiltChar();
               break;
            case "wallJump":
               this.rightChar();
               this.char.char.nextFrame();
               if(this.char.char.currentFrame == 32)
               {
                  this.char.gotoAndStop("longJump");
                  this.char.char.gotoAndStop(20);
                  this.placePencil(this.char.char);
               }
               break;
            case "dropJump":
               if(this.char.char.currentFrame < 15 || moveUD > -15)
               {
                  this.char.char.nextFrame();
               }
               if(!((Math.abs(rotation) > 90 || this.char.char.currentFrame < 5) && Math.abs(rotter) > 1))
               {
                  this.rightChar();
               }
               switch(this.char.char.currentFrameLabel)
               {
                  case "2":
                     this.char.gotoAndStop("fallLoop");
                     this.char.char.gotoAndStop(1);
               }
         }
         if(this.char.currentFrameLabel == "airSheath")
         {
            this.placePencil(this.char.char);
            if(this.char.char.currentFrame == 19 || this.char.char.currentFrame == 35)
            {
               this.resetPencil();
            }
         }
         if(onWall + onWallPlat != 0 && this.char.currentFrameLabel != "wallJump")
         {
            if(!this.JumpIsDown() && !(isTouchScreen && this.DownIsDown()))
            {
               this.SisDown = false;
            }
            if((this.JumpIsDown() || isTouchScreen && this.DownIsDown()) && !this.SisDown && !suppressJump)
            {
               this.SisDown = true;
               rotter = 0;
               if(onWall == 0)
               {
                  onWall = onWallPlat;
               }
               this.alreadyPredicted = false;
               if(this.hairGel > 20)
               {
                  this.hairGel = this.hairGoTo = 137;
                  this.head.gotoAndStop(137);
               }
               this.char.gotoAndStop("wallJump");
               this.char.char.stop();
               if((wallRL + platRL) * scaleX < 0)
               {
                  moveRL = -onWall * 16 + moveRL * 0.6 + (wallRL + platRL) * 0.5;
               }
               else
               {
                  moveRL = -onWall * 16 + moveRL * 0.6;
               }
               if(Math.abs(moveRL) < Math.abs(landSpeed) * 0.9)
               {
                  moveRL = -landSpeed * 0.9;
               }
               landSpeed = 0;
               if(this.DownIsDown())
               {
                  FloatUp = 0;
               }
               else if(-16 + (moveUD + platUD + wallUD) * 0.25 < moveUD)
               {
                  moveUD = -16 + (moveUD + platUD + wallUD) * 0.25;
                  FloatUp = 5;
               }
               this.canQuickDrop = false;
               this.head.scaleX = scaleX = -onWall;
               Still = this.TempStill = true;
               this.wallJumped = true;
               wallHanging = false;
               platRL = platUD = groundRL = groundUD = wallRL = wallUD = 0;
               this.resetPencil();
               Sounds.playSound("Jump",this.x,0.6,onRail);
               if(aPlatOn != null)
               {
                  aPlatOn.springY -= 30;
                  aPlat.aPlatOnClear(this);
               }
               if(aWallOn != null)
               {
                  aWall.aWallOnClear(this);
               }
               this.onWallN = 20;
               this.Vanity();
            }
         }
         this.placeHead(this.char.char);
         this.fadeInMoveSound("JumpWind",0.05);
         this.AttackStuff();
         this.SpecialStuff();
      }
      
      private function LedgeHangSetupFrame() : *
      {
         this.placeHead(this.char);
         this.hairGel = 121;
         this.head.gotoAndStop(121);
         Sounds.playSound("HangLand",this.x,0.8,onRail);
      }
      
      private function LedgeHangEnterFrame() : *
      {
         this.char.nextFrame();
         this.placeHead(this.char);
         if(!this.JumpListener())
         {
            if(this.DownIsDown())
            {
               this.y += 10;
               this.SisDown = true;
               Jumper = 0;
               gotoBuffer = "Jump";
            }
            else if(wallRL * onWall > 0)
            {
               fakeRL = wallRL = 0;
               gotoBuffer = "Jump";
            }
         }
      }
      
      private function enterBoxEnterFrame() : void
      {
         ex = this.x - this.inBox.x;
         ey = this.y - this.inBox.y;
         angle = this.inBox.rotation * (Math.PI / 180);
         ax = Math.cos(angle) * ex + Math.sin(angle) * ey;
         ay = Math.cos(angle) * ey - Math.sin(angle) * ex;
         aRL = Math.cos(angle) * moveRL + Math.sin(angle) * moveUD;
         aUD = Math.cos(angle) * moveUD - Math.sin(angle) * moveRL;
         if(Math.abs(ax) > this.inBox.isWide - 40)
         {
            aRL += -ax / 8;
            aRL *= 0.5;
         }
         if(aUD < 20)
         {
            aUD += 1.5;
         }
         ax += aRL;
         ay += aUD;
         if(ay > this.inBox.isTall + 50)
         {
            this.inBox.clearChar();
            if(this.inBox.Status == "trigger")
            {
               gotoBuffer = "Disabled";
               if(this.inBox.stringVar == "EndGame")
               {
                  Main.lockShiftX = this.inBox.x;
                  Main.lockShiftY = this.inBox.y;
                  Main.lockShiftZ = 88;
                  Main.switchScroll("EndGameLockScroll");
               }
            }
            else if(this.inBox.Status == "door")
            {
               alpha = 0;
               this.head.alpha = 0;
               if(Main.crossLevelStatus == "fromLevelBonus5")
               {
                  Main.FadeItOut("Bonus5",0);
               }
               else
               {
                  Main.FadeItOut(this.inBox.stringVar,this.inBox.numVar);
               }
               this.CharEnterFrame = function():*
               {
                  return null;
               };
            }
            else if(this.inBox.Status == "vase")
            {
               if(Sounds.musicPlaying == "Cave_Mystery")
               {
                  Sounds.fadeOutMusic("Cave_Wah",0.2);
               }
               parent.mask = null;
               Main.enterVase(this,this.inBox);
            }
            else
            {
               this.exitBox(this.outBox,false);
            }
         }
         else
         {
            angle = this.inBox.rotation * (Math.PI / 180);
            moveRL = Math.cos(angle) * aRL - Math.sin(angle) * aUD;
            moveUD = Math.cos(angle) * aUD + Math.sin(angle) * aRL;
            if(isTall < 15)
            {
               this.placeHead(this.char);
            }
            else
            {
               rotter = -rotation * 0.2;
               this.char.char.nextFrame();
               this.placeHead(this.char.char);
            }
         }
      }
      
      private function exitBoxEnterFrame() : void
      {
         if(this.outBox.stayStraight)
         {
            angle = 0;
         }
         else
         {
            angle = this.outBox.rotation * (Math.PI / 180);
         }
         if(ay < -15 - isTall)
         {
            aUD += Math.cos(angle) * 1.5;
         }
         fakeUD = aUD;
         if(ay + isTall < 20)
         {
            ax += aRL;
         }
         ay += aUD;
         moveRL = Math.cos(angle) * aRL - Math.sin(angle) * aUD;
         moveUD = Math.cos(angle) * aUD + Math.sin(angle) * aRL;
         if(ay < -this.outBox.isTall - isTall - 40 || aUD > 0)
         {
            this.outBox.clearChar();
            moveRL = Math.cos(angle) * aRL - Math.sin(angle) * aUD;
            moveUD = Math.cos(angle) * aUD + Math.sin(angle) * aRL;
            this.setupVisibles(onRail);
            if(isTall < 15)
            {
               this.CharEnterFrame = this.RollEnterFrame;
               Status = "Roll";
               this.placeHead(this.char);
            }
            else if(Boolean(this.outBox.tumble) || this.superTumble)
            {
               this.superTumble = false;
               this.CharEnterFrame = this.HurtEnterFrame;
               Status = "Hurt";
               this.placeHead(this.char);
            }
            else
            {
               this.rightChar();
               this.CharEnterFrame = this.JumpEnterFrame;
               Status = "Jump";
               this.placeHead(this.char.char);
            }
            parent.mask = null;
         }
         else if(isTall < 15)
         {
            this.placeHead(this.char);
         }
         else if(Boolean(this.outBox.tumble) || this.superTumble)
         {
            this.char.nextFrame();
            this.placeHead(this.char);
         }
         else
         {
            this.char.char.nextFrame();
            this.placeHead(this.char.char);
            if(this.char.char.currentFrame == 6)
            {
               if(this.char.char.body.currentFrame == this.char.char.body.totalFrames)
               {
                  this.char.char.body.gotoAndStop(1);
               }
               else
               {
                  this.char.char.body.nextFrame();
               }
            }
         }
      }
      
      private function WaitAfterTransLevel() : void
      {
         this.setupVisibles(onRail);
         this[Status + "EnterFrame"]();
         this.CharEnterFrame = this[Status + "EnterFrame"];
      }
      
      internal function LandSetupFrame() : *
      {
         this.placeHead(this.char);
         this.placePencil(this.char);
         smokeN = 5;
         this.moveSound = 0;
         this.fadeInMoveSound("InkBoardSliding",0.25,Math.abs(fakeRL) * 0.05);
      }
      
      internal function LandEnterFrame() : *
      {
         this.char.nextFrame();
         this.controlGround(1);
         if(slippery || sliding)
         {
            if(this.char.currentFrame > 3 && this.char.currentFrame < 11)
            {
               this.char.gotoAndStop("landToSlide");
            }
         }
         else if(wantRL == 0)
         {
            if(this.char.currentFrame > 3 && this.char.currentFrame < 11 && Math.abs(fakeRL) > 5)
            {
               this.char.gotoAndStop("landToSlide");
            }
            if(Math.abs(rotation) < 2 && Math.abs(fakeRL) < 10)
            {
               this.ledgeGrab = true;
            }
            else
            {
               this.ledgeGrab = false;
            }
         }
         else
         {
            if(fakeRL * wantRL < -5)
            {
               if(this.char.currentFrame > 5 && this.char.currentFrame < 11)
               {
                  this.char.gotoAndStop("landToSlide");
               }
            }
            else if(scaleX * wantRL > 0)
            {
               if(this.char.currentFrame < 7)
               {
                  this.justLanded = true;
                  this.alreadyLanded = true;
                  this.landFrame = this.char.currentFrame;
                  gotoBuffer = "Walk";
               }
            }
            else
            {
               gotoBuffer = "Backpeddle";
            }
            if(fakeRL * wantRL > 0 || Math.abs(rotation) >= 2)
            {
               this.ledgeGrab = false;
            }
            else
            {
               this.ledgeGrab = true;
            }
         }
         footSlide(footX(),footY(),scaleX,wallAngle,fakeRL,slippery);
         this.fadeInMoveSound("InkBoardSliding",0.25,Math.abs(fakeRL) * 0.05);
         switch(this.char.currentFrame)
         {
            case 10:
               gotoBuffer = "Idle";
               break;
            case 13:
               this.hairRL = 0;
               break;
            case 18:
               this.setIsTall(24);
               gotoBuffer = "Slide";
         }
         this.placeHead(this.char);
         this.placePencil(this.char);
         if(this.ActionStuff())
         {
            this.justLanded = this.alreadyLanded = false;
         }
      }
      
      internal function LandQuickSetupFrame() : *
      {
         this.placeHead(this.char);
         smokeN = 5;
      }
      
      internal function LandQuickEnterFrame() : *
      {
         this.char.nextFrame();
         if(this.char.currentFrame < 6)
         {
            slideSlow(2);
         }
         else
         {
            this.controlGround(1.5);
            if(wantRL == 0)
            {
               if(Math.abs(rotation) < 2 && Math.abs(fakeRL) < 10)
               {
                  this.ledgeGrab = true;
               }
               else
               {
                  this.ledgeGrab = false;
               }
            }
            else
            {
               if(fakeRL * wantRL >= -5)
               {
                  if(scaleX * wantRL > 0)
                  {
                     this.justLanded = true;
                     this.alreadyLanded = true;
                     this.landFrame = int(this.char.currentFrame * 0.5);
                     gotoBuffer = "Walk";
                  }
                  else
                  {
                     gotoBuffer = "Backpeddle";
                  }
               }
               if(fakeRL * wantRL > 0 || Math.abs(rotation) >= 2)
               {
                  this.ledgeGrab = false;
               }
               else
               {
                  this.ledgeGrab = true;
               }
            }
         }
         footSlide(footX(),footY(),scaleX,wallAngle,fakeRL,slippery);
         if(this.char.currentFrame == this.char.totalFrames)
         {
            gotoBuffer = "Idle";
         }
         this.placeHead(this.char);
         if(this.ActionStuff())
         {
            this.justLanded = this.alreadyLanded = false;
         }
      }
      
      internal function LandSlowSetupFrame() : *
      {
         this.placeHead(this.char);
      }
      
      internal function LandSlowEnterFrame() : *
      {
         this.char.nextFrame();
         this.placeHead(this.char);
         slideSlow(1.5);
         if(this.char.currentFrame == this.char.totalFrames)
         {
            gotoBuffer = "Idle";
         }
      }
      
      internal function StompSetupFrame() : *
      {
         this.resetJumpStuff();
         this.resetPencil();
         this.setIsTall(25);
         ex = this.x - StompedOn.wallX;
         ey = this.y - StompedOn.wallY;
         wallAngle = StompedOn.rotation * Math.PI / 180;
         stompedOnX = Math.cos(wallAngle) * ex + Math.sin(wallAngle) * ey;
         stompedOnY = Math.cos(wallAngle) * ey - Math.sin(wallAngle) * ex;
         this.lastBouncedY = StompedOn.y;
         Jumper = StompedOn.thrust;
         this.predictJumpToY(-Jumper,StompedOn.float,this.y + isTall - Jumper);
         this.head.gotoAndStop("forwardWindHair");
         this.hairGel = this.head.currentFrame;
         this.head.hair.stop();
         if(StompedOn.ItIs == "JumpPad")
         {
            if(StompedOn.float > 0)
            {
               FloatUp = StompedOn.float;
               this.FloatLock = true;
            }
            else
            {
               FloatUp = 0;
               this.FloatLock = false;
            }
            if(StompedOn.forceStill)
            {
               moveRL = 0;
            }
            fakeRL = (Math.cos(wallAngle) * moveRL + Math.sin(wallAngle) * moveUD) * 0.75 - StompedOn.moveRL * 0.5;
            if(StompedOn.forceStill)
            {
               fakeRL *= 0.5;
            }
         }
         else
         {
            this.FloatLock = false;
            fakeRL = moveRL;
         }
         moveUD = -StompedOn.spring;
         this.placeHead(this.char);
      }
      
      internal function StompEnterFrame() : *
      {
         if(this.char.currentFrame < 4 || StompedOn.springTall > StompedOn.isTall && StompedOn.spring > 0)
         {
            this.char.nextFrame();
         }
         if(this.JumpIsDown())
         {
            this.SisDown = true;
         }
         if(StompedOn == null)
         {
            trace("null");
            gotoBuffer = "Jump";
         }
         else
         {
            if(StompedOn.ItIs != "Char" && StompedOn.ItIs != "JumpPad")
            {
               if(wantRL == 0)
               {
                  if(fakeRL == 0)
                  {
                     if(scaleX * StompedOn.facing < 0)
                     {
                        StompedOn.facing *= -1;
                     }
                  }
                  else if(fakeRL * StompedOn.facing < 0)
                  {
                     StompedOn.facing *= -1;
                  }
               }
               else if(wantRL * StompedOn.facing < 0)
               {
                  StompedOn.facing *= -1;
               }
            }
            if(this.canJumpFromStomp())
            {
               this.canQuickDrop = false;
               if(StompedOn.ItIs == "JumpPad")
               {
                  if(StompedOn.hopRail > -1 && StompedOn.hopRail != onRail)
                  {
                     this.canAutoLook = false;
                     fakeRL *= 0.2;
                     this.wasOnRail = onRail;
                     this.toOnRail = StompedOn.hopRail;
                     if(Main.stageRoot.simpleBackgrounds)
                     {
                        if(this.toOnRail > 1)
                        {
                           this.toOnRail = 1;
                        }
                     }
                     ground = Main.fauxContainer;
                     platforms = Main.fauxContainer;
                     walls = Main.fauxContainer;
                  }
                  if(Math.abs(StompedOn.rotation) > 35)
                  {
                     this.FloatStill = true;
                  }
                  wallRot = StompedOn.rotation = StompedOn.springRot;
                  if(StompedOn.forceStill)
                  {
                     Still = true;
                     fakeRL = 0;
                  }
               }
               else
               {
                  if(this.DownIsDown())
                  {
                     this.FloatLock = true;
                  }
                  if(this.JumpIsDown())
                  {
                     Jumper *= 1.5;
                     FloatUp = 0;
                     if(StompedOn.ItIs != "Char")
                     {
                        StompedOn.hurtBaddie(50);
                     }
                  }
                  else if(StompedOn.ItIs != "Char")
                  {
                     StompedOn.hurtBaddie(10);
                  }
                  wallRot *= 0.5;
                  StompedOn.rotter = StompedOn.fakeRL * 10;
                  StompedOn.downTime = 5;
               }
               fakeRL += StompedOn.moveRL * 0.5;
               downTime = 5;
               rotter = 0;
               aPlat.resetplatSides(this.x,this.y,this);
               gotoBuffer = "Jump";
            }
            else
            {
               if(StompedOn.spring >= 0 && this.char.currentFrame < 4)
               {
                  this.char.gotoAndStop(4);
               }
               if(wantRL == 0 || Boolean(StompedOn.forceStill))
               {
                  if(Math.abs(fakeRL) > maxRL * 0.6)
                  {
                     fakeRL -= fakeRL / Math.abs(fakeRL) * 1;
                  }
               }
               else if(fakeRL * wantRL < -maxRL * 0.6)
               {
                  fakeRL *= 0.95;
               }
               else if(fakeRL * RLx(wantRL) < 0)
               {
                  fakeRL += RLx(wantRL);
               }
               else
               {
                  fakeRL += RLx(wantRL) * 0.5;
               }
               if(StompedOn.ItIs == "JumpPad")
               {
                  if(StompedOn.spring > 0 && StompedOn.hopRail > -1 && StompedOn.hopRail != onRail)
                  {
                     this.toOnRail = StompedOn.hopRail;
                     if(Main.stageRoot.simpleBackgrounds)
                     {
                        if(this.toOnRail > 1)
                        {
                           this.toOnRail = 1;
                        }
                     }
                  }
                  rotation += (StompedOn.springRot - StompedOn.rotation) * 0.15;
                  StompedOn.rotation += (StompedOn.springRot - StompedOn.rotation) * 0.15;
                  wallRot = StompedOn.rotation;
                  wallAngle = StompedOn.rotation * Math.PI / 180;
                  StompedOn.updateRotation();
                  if(StompedOn.hopRail > -1 && StompedOn.hopRail != onRail)
                  {
                     fakeRL *= 0.8;
                  }
               }
               if(StompedOn.forceStill)
               {
                  stompedOnX *= 0.8;
               }
               this.tiltChar();
               this.placeHead(this.char);
            }
         }
      }
      
      internal function GrabbedSetupFrame() : *
      {
         this.resetPencil();
         this.char.gotoAndStop(7);
         this.placeHead(this.char);
      }
      
      internal function GrabbedEnterFrame() : *
      {
         this.placeHead(this.char);
      }
      
      internal function HurtSetupFrame() : *
      {
         this.setIsTall(25);
         bounce = 0.5;
         bounceThresh = 20;
         this.b = 0;
         if(this.superHurt)
         {
            this.head.gotoAndStop("hurt");
         }
         else if(-moveUD > 5)
         {
            this.head.gotoAndStop("hurt");
            if(Math.abs(rotter) > 20)
            {
               rotter;
            }
            else if(Math.abs(moveRL) < 1)
            {
               rotter = scaleX * -moveUD;
            }
            else if(Math.abs(rotter) < Math.abs(moveRL * 1.5))
            {
               rotter = moveRL * 1.5;
            }
         }
         else
         {
            this.head.gotoAndStop("hurtLoop");
            this.char.gotoAndStop(10);
            if(Math.abs(moveRL * 1.5) > Math.abs(rotter))
            {
               rotter = moveRL * 1.5;
            }
         }
         if(this.head.hair != null)
         {
            this.head.hair.stop();
         }
         this.hairGel = this.head.currentFrame;
         platUD = wallUD = Jumper = this.canQuickDrop = FloatUp == 0;
         wallRot = 0;
         this.placeHead(this.char);
         this.resetPencil();
         this.clearStompedOn();
         onGround = false;
         if(aPlatOn != null)
         {
            aPlat.aPlatOnClear(this);
         }
         if(aWallOn != null)
         {
            aWall.aWallOnClear(this);
         }
      }
      
      internal function HurtEnterFrame() : *
      {
         var n:uint = 0;
         var i:uint = 0;
         if(this.superHurt)
         {
            if(ActiveCharArray.length > 1)
            {
               if(ActiveCharArray.indexOf(this) > -1)
               {
                  ActiveCharArray.splice(ActiveCharArray.indexOf(this),1);
               }
               if(InactiveCharArray.indexOf(this) == -1)
               {
                  InactiveCharArray.push(this);
               }
            }
            n = 0;
            i = 0;
            if(Main.pauseStatus == "finishRace")
            {
               Status = "Disabled";
               this.hideAll();
               this.superHurt = false;
               return;
            }
            if(useNodes && ActiveCharArray.length > 1)
            {
               i = uint(Char.findWinner());
               if(ActiveCharArray[i].onGround)
               {
                  this.superHurtReset(i);
                  return;
               }
               n = 1;
            }
            else
            {
               for(i = 0; i < ActiveCharArray.length; i++)
               {
                  if(ActiveCharArray[i].health > 0 && ActiveCharArray[i].ID != this.ID)
                  {
                     n++;
                     if(ActiveCharArray[i].onGround)
                     {
                        this.superHurtReset(i);
                        return;
                     }
                  }
               }
            }
            if(n > 0)
            {
               Status = "Disabled";
               this.hideAll();
            }
            else
            {
               this.superHurt = false;
               Status = "Hurt";
               moveRL = 0;
               FloatUp = 0;
               this.superHurtReset();
               if(inRange())
               {
                  if(Main.LevelStatus == "Race")
                  {
                     moveUD = -10;
                  }
                  else if(Jumper > 10)
                  {
                     moveUD = -Jumper;
                  }
                  else
                  {
                     moveUD = -20;
                  }
               }
               else
               {
                  moveUD = 0;
                  this.b = 15;
                  this.hideAll();
               }
            }
         }
         else if(this.b > 0)
         {
            if(this.b == 1)
            {
               if(Main.LevelStatus == "Race")
               {
                  moveUD = -10;
               }
               else if(Jumper > 10)
               {
                  moveUD = -Jumper;
               }
               else
               {
                  moveUD = -20;
               }
               rotation = 0;
               this.setupVisibles(onRail);
            }
            --this.b;
         }
         else
         {
            if(this.char.currentFrameLabel == "loop")
            {
               this.char.gotoAndStop(16);
            }
            else
            {
               this.char.nextFrame();
            }
            if(this.superStill)
            {
               moveRL -= makeOne(moveRL) * 0.2;
            }
            else if(moveRL * wantRL < 0)
            {
               if(moveUD > 0)
               {
                  moveRL += wantRL * 1;
               }
               else
               {
                  moveRL += wantRL * 0.5;
               }
            }
            else if(moveRL * wantRL < maxRL * 0.5)
            {
               if(moveUD > 0)
               {
                  moveRL += wantRL * 0.5;
               }
               else
               {
                  moveRL += wantRL * 0.3;
               }
            }
            if(Math.abs(moveRL) > maxRL * 0.6 && moveUD > 0)
            {
               moveRL -= moveRL / Math.abs(moveRL) * 0.5;
            }
            if(FloatUp > 0)
            {
               --FloatUp;
            }
            else
            {
               if(moveUD < 30)
               {
                  moveUD += 1.5;
               }
               if(this.canQuickDrop && moveUD < -20)
               {
                  moveUD *= 0.95;
               }
               else if(moveUD > 30)
               {
                  moveUD *= 0.9;
               }
            }
            if(Math.abs(rotter) < 15)
            {
               if(rotter * moveRL > 0)
               {
                  rotter += makeOne(moveRL) / 2;
               }
               else if(Math.abs(moveRL) < 5)
               {
                  rotter += -scaleX / 2;
               }
            }
            else if(Math.abs(rotter) > 20)
            {
               rotter *= 0.95;
            }
            fakeRL = moveRL;
            fakeUD = moveUD;
            this.placeHead(this.char);
         }
      }
      
      public function SuperFallEnterFrame() : *
      {
         if(this.char.currentFrameLabel == "loop")
         {
            this.char.gotoAndStop(16);
         }
         else
         {
            this.char.nextFrame();
         }
         if(moveUD < 30)
         {
            ++moveUD;
         }
         if(this.y > 500)
         {
            Status = "Hurt";
         }
      }
      
      internal function GetUpSetupFrame() : *
      {
         fakeRL *= 0.8;
         this.placeHead(this.char);
         this.head.gotoAndStop("hurt");
         this.hairGel = this.head.currentFrame;
      }
      
      internal function GetUpEnterFrame() : *
      {
         this.char.nextFrame();
         slideSlow(1.5);
         this.placeHead(this.char);
         if(this.char.currentFrame == 12)
         {
            this.head.gotoAndStop("getUp");
            this.hairGel = this.head.currentFrame;
         }
         if(this.char.currentFrame > 18)
         {
            if(this.char.currentFrame == this.char.totalFrames)
            {
               gotoBuffer = "Idle";
            }
            if(wantRL != 0)
            {
               this.controlGround();
               if(fakeRL * wantRL < -5)
               {
                  gotoBuffer = "Slide";
               }
               else if(slippery && fakeRL * wantRL > 10)
               {
                  gotoBuffer = "Slide";
               }
               else if(scaleX * wantRL > 0)
               {
                  gotoBuffer = "Walk";
               }
               else
               {
                  gotoBuffer = "Backpeddle";
               }
            }
            this.placeHead(this.char);
            this.ActionStuff();
            this.JumpListener(false);
         }
      }
      
      internal function LongGetUpSetupFrame() : *
      {
         fakeRL *= 0.8;
         this.placeHead(this.char);
         this.head.gotoAndStop("hurt");
         this.hairGel = this.head.currentFrame;
      }
      
      internal function LongGetUpEnterFrame() : *
      {
         this.char.nextFrame();
         slideSlow(2);
         this.placeHead(this.char);
         if(this.char.currentFrame == 12)
         {
            this.head.gotoAndStop("getUp");
            this.hairGel = this.head.currentFrame;
         }
         if(this.char.currentFrame == this.char.totalFrames)
         {
            gotoBuffer = "Idle";
         }
      }
      
      internal function DieSetupFrame() : *
      {
         var n:uint = 0;
         var i:uint = 0;
         if(health >= 0)
         {
            n = 0;
            if(Main.LevelStatus == "Smash")
            {
               this.smashLives = -2;
               for(i = 0; i < ActiveCharArray.length; i++)
               {
                  if(ActiveCharArray[i].smashLives > -2)
                  {
                     n++;
                  }
               }
               rootHUD.HUD.centerText.text = n;
               if(n == 1)
               {
                  Main.stageRoot.finishSmash();
               }
            }
            else
            {
               for(i = 0; i < ActiveCharArray.length; i++)
               {
                  if(ActiveCharArray[i].ID != this.ID && ActiveCharArray[i].health > 0)
                  {
                     n++;
                  }
               }
               --this.lives;
               health = -1;
               if(n == 0)
               {
                  Sounds.playSound("deathStrings",this.x,1,onRail);
               }
            }
            downTime = 300;
         }
         if(this.ID == 0)
         {
            Main.localSettings.lives = this.lives;
         }
         this.placeHead(this.char);
         this.b = 130;
      }
      
      internal function DieEnterFrame() : *
      {
         var n:uint = 0;
         var i:uint = 0;
         n = 0;
         for(i = 0; i < ActiveCharArray.length; i++)
         {
            if(ActiveCharArray[i].ID != this.ID && ActiveCharArray[i].health > 0)
            {
               n++;
               break;
            }
         }
         if(false && Main.LevelStatus == "Smash")
         {
            if(this.char.currentFrame < this.char.totalFrames)
            {
               this.char.nextFrame();
            }
         }
         else if(this.b == 85 && n > 0)
         {
            gotoBuffer = "Dead";
            this.coreSwitchAnim();
            springBounce = function():*
            {
            };
         }
         else if(this.b > 0)
         {
            --this.b;
            if(this.char.currentFrame < this.char.totalFrames)
            {
               this.char.nextFrame();
            }
         }
         else
         {
            if(this.lives < 0)
            {
               GameOver();
            }
            else if(inBonus)
            {
               Main.FadeItOut("return",0);
            }
            else
            {
               Main.FadeItOut("Respawn",0);
            }
            this.CharEnterFrame = function():*
            {
               slideSlow(2);
            };
            Status = "Die";
         }
         slideSlow(2);
         this.placeHead(this.char);
      }
      
      internal function DeadSetupFrame() : *
      {
         this.placeHead(this.char);
         this.Vanity(true);
         if(ActiveCharArray.length > 1)
         {
            if(ActiveCharArray.indexOf(this) > -1)
            {
               ActiveCharArray.removeAt(ActiveCharArray.indexOf(this));
            }
            if(InactiveCharArray.indexOf(this) == -1)
            {
               InactiveCharArray.push(this);
            }
         }
         if(health > 0)
         {
            this.hideAll();
         }
         if(Main.LevelStatus == "Smash" && ActiveCharArray.length == 1)
         {
            Main.setScrollAfterRace(ActiveCharArray[0],80);
         }
      }
      
      internal function DeadEnterFrame() : *
      {
         var i:uint = 0;
         this.CheckGamepads();
         if(!this.JumpIsDown())
         {
            this.SisDown = false;
         }
         if(this.lives > -1 && this.JumpIsDown() && gotoBuffer == "nothing")
         {
            this.SisDown = true;
            for(i = 0; i < ActiveCharArray.length; i++)
            {
               if(ActiveCharArray[i].health > 0 && ActiveCharArray[i].onGround)
               {
                  InactiveCharArray.removeAt(InactiveCharArray.indexOf(this));
                  ActiveCharArray.push(this);
                  springBounce = this.charSpringBounce;
                  rootHUD.updateLives(this.ID,this.lives);
                  health = healthMax;
                  rootHUD.restoreHealth(this.ID,health);
                  this.respawnChar(i);
                  break;
               }
            }
         }
      }
      
      public function FallCatSetupFrame() : *
      {
         this.head.gotoAndStop("hurtLoop");
         this.hairGel = this.head.currentFrame;
         this.head.hair.stop();
         this.placeHead(this.char);
      }
      
      public function FallCatEnterFrame() : *
      {
         if(moveUD < 30)
         {
            moveUD += 1.3;
         }
         if(this.char.currentFrameLabel == "loop")
         {
            this.char.gotoAndStop(16);
         }
         else
         {
            this.char.nextFrame();
         }
         this.placeHead(this.char);
      }
      
      public function HoldCatSetupFrame() : *
      {
         this.zOffset = 60;
         rotation = 0;
         this.placeHead(this.char);
      }
      
      public function HoldCatEnterFrame() : *
      {
         if(this.char.currentFrameLabel != "a")
         {
            if(this.char.currentFrameLabel != "b")
            {
               if(this.char.currentFrameLabel == "e")
               {
                  this.char.nextFrame();
               }
               else if(this.char.currentFrame == this.char.totalFrames)
               {
                  this.changeFrame("GetUp");
                  this.CharEnterFrame = this.GetUpEnterFrame;
                  this.char.gotoAndStop(5);
                  this.GetUpSetupFrame();
                  this.zOffset = 0;
                  Main.switchScroll("scrollChars");
               }
               else
               {
                  this.char.nextFrame();
               }
            }
         }
         slideSlow(2);
         this.placeHead(this.char);
      }
      
      internal function PencilGetSetupFrame() : *
      {
         fakeRL = fakeUD = moveRL = moveUD = rotter = 0;
         this.setIsTall(25);
         this.placeHead(this.char);
         this.hairGel = 24;
         this.head.gotoAndStop(24);
         this.b = 180;
         Main.localSettings.W1RProgress = 8;
         Main.localSettings.W1RContProg = 0;
         Main.parse_saveSettings();
         Main.achievement("BeatGame");
         if(this.Slash != null)
         {
            if(this.Slash.parent != null)
            {
               this.Slash.goSwim();
            }
            this.Slash = null;
         }
         takePens();
         this.showPencil(1);
         Sounds.playSound("fanfare",this.x,1,onRail);
         if(Status == "Jump" || Status == "Hurt" || Status == "PencilAir")
         {
            this.char.gotoAndStop(1);
         }
         else
         {
            this.char.gotoAndStop(2);
         }
         this.placePencil(this.char);
         downTime = 500;
      }
      
      internal function PencilGetEnterFrame() : *
      {
         this.tiltChar();
         this.placePencil(this.char);
         fakeRL = fakeUD = moveRL = moveUD = rotter = 0;
         if(this.b > 0)
         {
            --this.b;
         }
         else
         {
            givePens();
            Main.leaveArcade();
            this.b = 1000;
         }
      }
      
      public function PenGetSetupFrame() : *
      {
         scaleX = 1;
         this.head.scaleX = -1;
         this.setIsTall(25);
         Main.switchScroll("hangOnCatScroll");
         this.zOffset = 60;
         this.placeHead(this.char);
         this.placePencil(this.char);
      }
      
      public function PenGetEnterFrame() : *
      {
         var temp:WarpBox = null;
         this.char.nextFrame();
         fakeRL = (fakeX - this.x + 30) * 0.1;
         if(this.char.currentFrameLabel == "a")
         {
            givePens();
            if(!Main.localSettings.hasPen)
            {
               Main.localSettings.hasPen = true;
               Main.parse_saveSettings();
            }
            this.showPencil();
         }
         else if(this.char.currentFrameLabel == "b")
         {
            this.head.gotoAndStop("turnHair");
            this.hairGel = this.hairGoTo = this.head.currentFrame;
            this.head.scaleX *= -1;
            Sounds.fadeOutMusic("Cave_Moving",0.01);
         }
         else if(this.char.currentFrame == 30)
         {
            Sounds.playSound("PenCharge",this.x,1.5,onRail);
         }
         else if(this.char.currentFrame == 50)
         {
            Sounds.playSoundSimple("success");
         }
         else if(this.char.currentFrame == this.char.totalFrames)
         {
            Main.switchScroll("scrollChars");
            this.zOffset = 0;
            gotoBuffer = "Idle";
            temp = staticInteractObjects.findByUnique(0);
            temp.x = -115.8;
            temp.updateCache();
            temp.changeProperties("nothing",1);
            rootHUD.HUD.shoutTheBox("continuePen");
         }
         this.placeHead(this.char);
         this.placePencil(this.char);
      }
      
      public function PenUpgradeStabSetupFrame() : *
      {
         scaleX = this.head.scaleX = 1;
         this.setIsTall(25);
         this.resetPencil();
         this.placeHead(this.char);
         this.placePencil(this.char);
      }
      
      public function PenUpgradeStabEnterFrame() : *
      {
         this.char.nextFrame();
         fakeRL = (fakeX - this.x) * 0.2;
         if(this.char.currentFrameLabel == "a")
         {
            this.showPencil();
         }
         else if(this.char.currentFrameLabel == "b")
         {
            Main.justSetShifts(fakeX + 60,this.y,40);
            Main.setNullScroll();
            staticInteractObjects.clearByID(0);
            Main.switchScroll("simpleScroll");
            Main.shakeScreen(5,Math.random(),true);
            StarlingEffect.Spawn("Splat",this.x + 50,this.y + 15,Math.random() * 3.14,0.5,0,0,onRail);
            Sounds.playSound("InkRocket",this.x,1.5,onRail);
            staticInteractObjects.findByName("inkVein").finishSound();
            Sounds.fadeOutMusic("nothing",0.1);
            staticInteractObjects.findByName("inkVein").gotoAndStop("b");
         }
         else if(this.char.currentFrameLabel == "c")
         {
            if(Main.LevelLoaded == "Level2-j")
            {
               this.char.prevFrame();
            }
            else
            {
               moveUD = -60;
               Status = "Fly";
               aPlatOn = null;
               Main.shakeScreen(40,0,true);
               staticInteractObjects.findByName("inkVein").gotoAndStop("c");
               Main.saveProgress("defeatBoss1",true);
            }
         }
         else if(this.char.currentFrame > 110 && this.char.currentFrame < 187)
         {
            --Main.cameraShiftZ;
            Main.cameraShiftY -= 2;
            Main.shakeScreen((this.char.currentFrame - 110) * Math.random() * 0.4,Math.random(),true);
         }
         if(this.y < -4200)
         {
            Main.LoadIt = "Villa0-e";
            Main.DoorIt = 1;
         }
         this.placeHead(this.char);
         this.placePencil(this.char);
      }
      
      public function PenShowOffSetupFrame() : *
      {
         this.setIsTall(25);
         this.showPencil();
         this.placeHead(this.char);
         this.placePencil(this.char);
      }
      
      public function PenShowOffEnterFrame() : *
      {
         this.char.nextFrame();
         slideSlow(2);
         if(this.char.currentFrameLabel == "a")
         {
            this.resetPencil();
         }
         if(this.char.currentFrame == this.char.totalFrames)
         {
            gotoBuffer = "Idle";
         }
         if(this.char.currentFrame < 88)
         {
            this.placePencil(this.char);
         }
         this.placeHead(this.char);
      }
      
      internal function DuckSetupFrame() : *
      {
         if(isTall < 25)
         {
            this.char.gotoAndStop(4);
         }
         this.resetPencil();
         this.setIsTall(12);
         rotter = 0;
         this.isCarrying = "nothing";
         ++this.rockOutCounter;
         if(this.rockOutCounter > 5)
         {
            this.rockingOut = 15;
         }
         this.char.rockOut.stop();
         this.ledgeTil = 0;
         this.rockingOut = 0;
         this.hairGel = 12;
         this.head.gotoAndStop(12);
         this.placeHead(this.char);
      }
      
      internal function DuckEnterFrame() : *
      {
         if(this.char.currentFrame < 8 || this.char.currentFrame > 18 && this.char.currentFrame < 27)
         {
            if(this.rockingOut > 0)
            {
               --this.rockingOut;
               this.char.rockOut.nextFrame();
            }
            else
            {
               if(this.char.rockOut.currentFrame == 3)
               {
                  this.rockOutCounter = 0;
               }
               this.char.rockOut.prevFrame();
            }
         }
         slideSlow(1);
         if(!this.SpecialStuff())
         {
            if(this.DownIsDown() || CheckHead())
            {
               this.setIsTall(12);
               this.char.y = 0;
               this.fallView += (300 - this.fallView) / 10;
               if(Math.abs(wallRot) < 5)
               {
                  this.ledgeGrab = true;
               }
               else
               {
                  this.ledgeGrab = false;
               }
               if(Math.abs(fakeRL) > 5 || Math.abs(rotAccel) > 0.5)
               {
                  this.rockOutCounter = 0;
                  gotoBuffer = "Roll";
               }
               if(this.char.currentFrame > 5)
               {
                  this.char.gotoAndStop(1);
                  this.char.rockOut.stop();
                  ++this.rockOutCounter;
                  this.hairGel = 12;
                  this.head.gotoAndStop(12);
                  if(this.rockOutCounter > 5)
                  {
                     ++Main.rockonsSession;
                     if(this.rockingOut > 0)
                     {
                        this.char.rockOut.gotoAndStop("rockOut");
                     }
                     this.rockingOut = 15;
                  }
               }
               else if(this.char.currentFrame < 4)
               {
                  this.char.nextFrame();
               }
            }
            else
            {
               this.setIsTall(25);
               this.controlGround();
               this.char.y = 13;
               if(this.char.currentFrame == 17 || this.char.currentFrame == 33)
               {
                  gotoBuffer = "Idle";
               }
               else if(this.char.currentFrame < 4 && this.char.currentFrame > 1)
               {
                  this.hairGel = 127;
                  this.head.gotoAndStop(127);
                  this.char.gotoAndStop(5);
               }
               else
               {
                  if(this.char.currentFrame == 4)
                  {
                     this.hairGel = 125;
                     this.head.gotoAndStop(125);
                  }
                  this.char.nextFrame();
               }
               this.ledgeGrab = false;
               if(Math.abs(fakeRL) > 10)
               {
                  if(this.char.currentFrame > 6)
                  {
                     gotoBuffer = "Slide";
                  }
               }
               else if(wantRL * scaleX > 0)
               {
                  if(this.char.currentFrame < 6)
                  {
                     this.justLanded = true;
                     this.alreadyLanded = true;
                     this.landFrame = 4;
                  }
                  gotoBuffer = "Walk";
               }
               else if(wantRL * scaleX < 0)
               {
                  gotoBuffer = "Backpeddle";
               }
            }
         }
         switch(this.char.currentFrameLabel)
         {
            case "1":
               if(this.rockOutCounter > 5)
               {
                  this.char.gotoAndStop(19);
                  this.char.rockOut.gotoAndStop("rockOut");
               }
               else
               {
                  this.char.gotoAndStop(9);
               }
               break;
            case "4":
               Main.sendSessions();
            case "2":
               this.rockOutCounter = 0;
         }
         this.headrot = this.char.head.rotation;
         this.headx = this.char.x + this.char.head.x;
         this.heady = this.char.y + this.char.head.y;
         this.char.head.visible = false;
         if(!this.JumpListener(false))
         {
            if(this.AttackStuff())
            {
               this.hairGoTo = this.hairGel = 24;
               this.head.gotoAndStop(24);
               this.setIsTall(25);
            }
         }
      }
      
      internal function DownSlideSetupFrame() : *
      {
         smokeN = 0;
         this.performN = 10;
         this.fliprot = 1;
         if(isTall < 25)
         {
            this.char.gotoAndStop(6);
         }
         this.isCarrying = "nothing";
         this.setIsTall(12);
         this.resetPencil();
         this.placeHead(this.char);
         if(Status != "Slide" && Status != "Land")
         {
            this.moveSound = 0;
         }
         this.fadeInMoveSound("InkBoardSliding",0.25,Math.abs(fakeRL) * 0.05);
      }
      
      internal function DownSlideEnterFrame() : *
      {
         footSlide(footX(),footY(),scaleX,wallAngle,fakeRL,slippery);
         if(CheckHead())
         {
            if(!(this.RLStatus == "ledgeGrab" || this.RLStatus == "Fall"))
            {
               if(this.char.currentFrame > 6 && this.char.currentFrame < 15 && (Math.abs(wallRot) > 20 || Math.abs(fakeRL) < 10))
               {
                  this.char.gotoAndStop("rollup");
               }
               else if(this.char.currentFrame > 14)
               {
                  this.char.nextFrame();
               }
               else if(fakeRL * scaleX < 0)
               {
                  gotoBuffer = "Roll";
               }
               else
               {
                  if(this.char.currentFrame < 7)
                  {
                     this.char.nextFrame();
                  }
                  if(slippery)
                  {
                     if(Math.abs(fakeRL) > 0.1)
                     {
                        fakeRL -= fakeRL / Math.abs(fakeRL) * 0.1;
                     }
                     else
                     {
                        fakeRL = 0;
                     }
                  }
                  else if(Math.abs(fakeRL) > 0.3)
                  {
                     fakeRL -= fakeRL / Math.abs(fakeRL) * 0.3;
                  }
                  else
                  {
                     fakeRL = 0;
                  }
               }
               if(this.char.currentFrameLabel == "duck")
               {
                  gotoBuffer = "Roll";
               }
            }
         }
         else if(!(!Still && Boolean(this.JumpListener(false))))
         {
            if(Still)
            {
               if(onLedge == 0)
               {
                  if(Math.abs(fakeRL) > 2)
                  {
                     fakeRL -= fakeRL / Math.abs(fakeRL) * 2;
                  }
               }
               else
               {
                  fakeRL = 0;
               }
            }
            else if(slippery)
            {
               if(Math.abs(fakeRL) > 0.1)
               {
                  fakeRL -= fakeRL / Math.abs(fakeRL) * 0.1;
               }
               else
               {
                  fakeRL = 0;
               }
            }
            else if(Math.abs(fakeRL) > 0.4)
            {
               fakeRL -= fakeRL / Math.abs(fakeRL) * 0.4;
            }
            if(!(this.RLStatus == "ledgeGrab" || this.RLStatus == "Fall"))
            {
               if(!this.AttackStuff())
               {
                  if(this.char.currentFrame < 14)
                  {
                     if(onWall != 0)
                     {
                        this.char.gotoAndStop("rollup");
                     }
                     if(!this.AttackIsDown())
                     {
                        this.AisDown = false;
                     }
                     if(this.DownIsDown())
                     {
                        if(fakeRL * scaleX < -1)
                        {
                           gotoBuffer = "Roll";
                        }
                        else
                        {
                           if(Math.abs(fakeRL) < 5)
                           {
                              if(this.char.currentFrame < 15)
                              {
                                 this.char.gotoAndStop("rollup");
                              }
                           }
                           if(this.char.currentFrame < 7 || this.char.currentFrame > 14)
                           {
                              this.char.nextFrame();
                           }
                        }
                     }
                     else
                     {
                        this.char.nextFrame();
                        if(this.char.currentFrame == 10)
                        {
                           if(wantRL * fakeRL > 0 && wantRL * scaleX > 0)
                           {
                              this.fromSlide = true;
                              gotoBuffer = "Walk";
                           }
                           else
                           {
                              gotoBuffer = "Slide";
                           }
                        }
                     }
                  }
                  else if(this.char.currentFrameLabel == "duck")
                  {
                     if(this.DownIsDown() && (Math.abs(fakeRL) > 5 || Math.abs(rotAccel) > 0.5))
                     {
                        gotoBuffer = "Roll";
                     }
                     else
                     {
                        gotoBuffer = "Duck";
                     }
                  }
                  else
                  {
                     this.char.nextFrame();
                  }
               }
            }
         }
         if(this.char.currentFrame == 7)
         {
            this.char.char.gotoAndStop(int(this.fliprot));
            this.fliprot += Math.abs(fakeRL) * 0.08;
            if(this.fliprot > 10)
            {
               this.fliprot -= 10;
            }
         }
         this.fadeInMoveSound("InkBoardSliding",0.25,Math.abs(fakeRL) * 0.05);
         if(gotoBuffer == "nothing")
         {
            this.placeHead(this.char);
         }
      }
      
      internal function RollSetupFrame() : *
      {
         this.b = 3;
         smokeN = 5;
         this.performN = 50;
         bounce = 0.5;
         bounceThresh = 10;
         this.placeHead(this.char);
         angle = wallRot * Math.PI / 180;
         if(Status != "Jump")
         {
            moveRL = Math.cos(angle) * (fakeRL + platRL) - Math.sin(angle) * (-Jumper + platUD);
            moveUD = Math.cos(angle) * (-Jumper + platUD) + Math.sin(angle) * (fakeRL + platRL);
            Jumper = 0;
            currentSound = Sounds.playSoundContinuous("Rolling",this.x,Math.abs(fakeRL) * 0.1,onRail);
         }
         this.canQuickDrop = false;
         moveRL += groundRL;
         moveUD += groundUD;
         groundRL = groundUD = 0;
         if(Math.abs(moveUD) > Math.abs(moveRL))
         {
            rotter = Math.abs(moveUD) * makeOne(moveRL) * rotPerc;
         }
         else
         {
            rotter = moveRL * rotPerc;
         }
         trace("roll setup");
      }
      
      internal function RollEnterFrame() : *
      {
         var tempRL:Number = NaN;
         var rand:Number = NaN;
         trace("roll enter");
         if(CheckHead())
         {
            if(Math.abs(moveRL) > maxRL * 0.6)
            {
               moveRL -= moveRL / Math.abs(moveRL) * 0.1;
            }
            else if(moveRL == 0)
            {
               moveRL += scaleX * 0.1;
            }
            else
            {
               moveRL += moveRL / Math.abs(moveRL) * 0.1;
            }
         }
         else if(moveRL != 0)
         {
            moveRL -= moveRL / Math.abs(moveRL) * 0.1;
         }
         if(CheckHead() || this.DownIsDown())
         {
            if(Math.abs(rotation) < 5)
            {
               this.ledgeGrab = true;
            }
            else
            {
               this.ledgeGrab = false;
            }
            this.temp = 1;
         }
         else
         {
            this.ledgeGrab = false;
            this.temp = 0;
         }
         if(onGround || almostGround || almostPlat)
         {
            footSlide(footX(),footY(),scaleX,wallAngle,fakeRL,slippery);
            FloatUp = 0;
            FloatUp += Math.abs(moveRL / 5);
            if(moveUD > 0)
            {
               moveUD += 1.5;
            }
            else
            {
               moveUD += 1;
            }
            this.canQuickDrop = false;
            tempRL = nowSpeed();
            if(tempRL > 30)
            {
               moveRL *= (tempRL - 0.1) / tempRL;
               moveUD *= (tempRL - 0.1) / tempRL;
            }
            this.fadeInMoveSound("Rolling",0.25,Math.abs(tempRL) * 0.1);
            if(!CheckHead())
            {
               if(this.JumpListener())
               {
                  Sounds.stopSound(currentSound);
                  currentSound = null;
                  rotation = wallRot;
                  return;
               }
            }
            if(this.temp == 0)
            {
               if(this.char.currentFrame > 14 && false)
               {
                  this.JumpLand();
               }
               else
               {
                  rotation = (wallRot + rotation) * 0.5;
                  this.resetJumpStuff();
                  fakeRL = Math.cos(wallAngle) * moveRL + Math.sin(wallAngle) * moveUD;
                  gotoBuffer = "Duck";
               }
            }
            else if(this.char.currentFrame < 13)
            {
               this.char.nextFrame();
            }
            else if(this.char.currentFrame > 15)
            {
               this.char.gotoAndStop(13);
            }
         }
         else
         {
            if(currentSound != null)
            {
               Sounds.stopSound(currentSound);
               currentSound = null;
            }
            if(this.temp == 0)
            {
               if(this.char.currentFrame < 15)
               {
                  bounce = 0;
                  this.char.gotoAndStop("airUnroll");
               }
               else
               {
                  this.char.nextFrame();
               }
            }
            else if(this.char.currentFrame > 15)
            {
               this.char.prevFrame();
            }
            else if(this.char.currentFrame == 15)
            {
               bounce = 0.5;
               this.char.gotoAndStop(13);
            }
            else if(this.char.currentFrame < 13)
            {
               this.char.nextFrame();
            }
            if(this.char.currentFrame > 20)
            {
               this.controlAir();
               this.AttackStuff();
            }
            else if(moveRL * wantRL < 0)
            {
               moveRL += wantRL * 0.5;
            }
            else if(moveRL * wantRL < maxRL * 0.6)
            {
               moveRL += wantRL * 0.25;
            }
            wallRot = wallAngle = 0;
            if(this.canQuickDrop)
            {
               if(Math.abs(moveRL) > 20)
               {
                  moveRL *= 0.96;
               }
               if(Math.abs(moveUD) > 25)
               {
                  moveUD *= 0.9;
               }
            }
            if(FloatUp > 0)
            {
               --FloatUp;
            }
            else if(moveUD < 30)
            {
               moveUD += 1;
            }
            if(this.char.currentFrame > 14)
            {
               if(Math.abs(rotter) < 40)
               {
                  if(Math.abs(rotation) < 65 && rotation * rotter <= 0 && Math.abs(rotter) < 15)
                  {
                     rotation *= 0.8;
                  }
                  else if(Math.abs(rotter) > 15)
                  {
                     rotter *= 0.9;
                  }
               }
               else
               {
                  rotter *= 0.9;
               }
               if(this.char.currentFrame == this.char.totalFrames)
               {
                  this.setIsTall(25);
                  this.changeFrame("Jump");
                  Status = "Jump";
                  this.CharEnterFrame = this.JumpEnterFrame;
                  this.char.gotoAndStop("normal");
                  this.char.char.gotoAndStop("falling");
                  this.placeHead(this.char.char);
                  return false;
               }
            }
            else if(Math.abs(rotter) > 30)
            {
               rotter *= 0.95;
            }
         }
         this.placeHead(this.char);
         if(smokeB > 0)
         {
            --smokeB;
            if(smokeN > 0)
            {
               --smokeN;
            }
            else
            {
               rand = nowSpeed() / 20 - 0.5;
               smokeN = 1;
            }
         }
      }
      
      internal function KickSetupFrame() : *
      {
         this.setIsTall(25);
         this.resetPencil();
         tempRL = fakeRL * 0.8;
         tempUD = -Jumper;
         Jumper = 0;
         this.flailing = true;
         angle = wallRot * Math.PI / 180;
         moveRL = Math.cos(angle) * tempRL - Math.sin(angle) * tempUD;
         moveUD = Math.cos(angle) * tempUD + Math.sin(angle) * tempRL;
         this.placeHead(this.char);
      }
      
      internal function KickEnterFrame() : *
      {
         this.rightChar();
         this.char.nextFrame();
         if(moveRL * wantRL < 0)
         {
            moveRL += wantRL * 1;
         }
         else if(moveRL * wantRL < maxRL * 0.6)
         {
            moveRL += wantRL * 0.5;
         }
         if(FloatUp > 0)
         {
            --FloatUp;
         }
         else
         {
            moveUD += 1;
         }
         fakeRL = moveRL;
         fakeUD = moveUD;
         if(this.char.currentFrame == 28)
         {
            this.changeFrame("Jump");
            this.char.gotoAndStop("longJump");
            this.char.char.gotoAndStop(19);
            this.CharEnterFrame = this.JumpEnterFrame;
            Status = "Jump";
            this.placeHead(this.char.char);
            this.placePencil(this.char.char);
         }
         else
         {
            this.placeHead(this.char);
         }
      }
      
      internal function DoorOutSetupFrame() : *
      {
         this.char.gotoAndStop(2);
         this.warpDoor.openDoor();
         downTime = 30;
         this.b = this.warpDoor.delay;
         this.forcingBitmap = false;
         this.setupVisibles(0);
         this.head.alpha = alpha = 0;
         this.placeHead(this.char.char);
         this.headx += this.char.char.x;
         this.heady += this.char.char.y;
      }
      
      internal function DoorOutEnterFrame() : *
      {
         if(this.b > 0)
         {
            --this.b;
         }
         else
         {
            if(this.char.currentFrame == 2)
            {
               this.resetPencil();
            }
            this.char.nextFrame();
            if(this.char.currentFrame < 15)
            {
               this.hairGel = 2;
            }
            else if(this.char.currentFrame == 25)
            {
               fakeRL = (Main.numPlayers - (this.ID + 1)) * 3 * scaleX;
               gotoBuffer = "Slow";
            }
            else
            {
               if(this.char.currentFrame == 20)
               {
                  this.RLFunc(true,false,false,false);
                  Jumper = 0;
                  if(wantRL != 0)
                  {
                     this.x -= scaleX * 20;
                     fakeRL = scaleX * 7;
                     this.stepUp = true;
                     gotoBuffer = "Walk";
                  }
               }
               this.char.char.gotoAndStop(this.char.currentFrame);
               if(alpha + 0.5 < 1)
               {
                  alpha += 0.5;
                  this.head.alpha = alpha;
               }
               else
               {
                  this.head.alpha = alpha = 1;
               }
               this.placeHead(this.char.char);
               this.headx += this.char.char.x;
               this.heady += this.char.char.y;
            }
            if(gotoBuffer != "nothing")
            {
               this.forcingBitmap = forceBitmap;
               this.setupVisibles(onRail);
            }
         }
      }
      
      internal function DoorInSetupFrame() : *
      {
         rotter = 0;
         this.setIsTall(25);
         fakeRL = moveRL = 0;
         if(scaleX * this.warpDoor.scaleX < 0)
         {
            this.head.gotoAndStop("turnHair");
            this.hairGel = this.head.currentFrame;
         }
         this.head.scaleX = scaleX = this.warpDoor.scaleX;
         downTime = 300;
         this.placeHead(this.char);
         this.resetPencil();
         this.forcingBitmap = false;
         this.setupVisibles(0);
      }
      
      internal function DoorInEnterFrame() : *
      {
         this.char.nextFrame();
         this.x += (this.warpDoor.x - this.x) / 5;
         if(this.char.currentFrame != this.char.totalFrames)
         {
            this.placeHead(this.char);
         }
         if(this.warpDoor.currentFrame == 34)
         {
            this.setupVisibles(onRail);
            if(Main.LevelLoaded == "Trans1" && this.warpDoor.ID == 1 && !(Boolean(Main.hasFull()) || Main.debug || Main.kongregate != null))
            {
               if(Main.DirIt == "World 1")
               {
                  this.LoadIt = "Level1";
               }
               else
               {
                  this.LoadIt = "Trans1";
               }
               this.DoorIt = 0;
            }
            if(this.LoadIt == "MoreGames")
            {
               if(Main.onSite == "MiniClip")
               {
                  Main.launchURL("http://www.miniclip.com");
               }
               else
               {
                  Main.launchURL("http://www.kongregate.com?haref=fpa_remix&src=spon&cm=fpa_remix");
               }
               Main.LoadIt = Main.LevelLoaded;
               Main.DoorIt = this.warpDoor.ID;
            }
            else if(this.LoadIt == "SoundtrackDownload")
            {
               if(Main.hasKey())
               {
                  InterDecal.theThing.visible = true;
                  Main.parse_ExtrasDownload("Soundtrack");
                  Main.LoadIt = "Lockd0";
                  Main.DoorIt = this.warpDoor.ID;
               }
               else
               {
                  Main.LoadIt = "Menus0";
                  Main.DoorIt = 0;
                  Main.stageRoot.visible = false;
               }
            }
            else if(this.LoadIt == "Level5")
            {
               if(Main.hasKey())
               {
                  Main.FadeItOut(this.LoadIt,this.DoorIt);
               }
               else
               {
                  Main.LoadIt = "Menus0";
                  Main.DoorIt = 0;
                  Main.stageRoot.visible = false;
               }
            }
            else if(Main.LevelLoaded == this.LoadIt)
            {
               Main.DoorIt = this.DoorIt;
            }
            else
            {
               Main.FadeItOut(this.LoadIt,this.DoorIt);
            }
         }
         if(this.char.currentFrame == 33)
         {
            this.head.gotoAndStop("turnHair");
            this.hairGel = this.head.currentFrame;
         }
         if(this.char.currentFrame > 50)
         {
            this.head.alpha = 0;
            this.headrot = 0;
            this.head.scaleX = -scaleX;
         }
         else if(this.char.currentFrame > 32)
         {
            this.headrot = 0;
            this.head.scaleX = -scaleX;
         }
         if(this.char.currentFrame == 18)
         {
            this.warpDoor.openDoor();
         }
      }
      
      internal function DropSetupFrame() : *
      {
         Status = "Fly";
         this.changeFrame("Jump");
         this.char.gotoAndStop("fallLoop");
         this.placeHead(this.char.char);
      }
      
      internal function DropEnterFrame() : *
      {
         this.char.char.nextFrame();
         if(this.char.char.currentFrame == this.char.char.totalFrames)
         {
            this.char.char.gotoAndStop(1);
         }
         if(this.y > 2230)
         {
            Status = "Jump";
         }
      }
      
      internal function SkateboardSetupFrame() : *
      {
         this.hairGel = 122;
         this.head.gotoAndStop(122);
         this.head.scaleX = scaleX = 1;
         this.placeHead(this.char);
         this.char.gotoAndStop(4);
         isWide = 30;
         this.fromLedge = true;
         rotter = 0;
         this.resetPencil();
      }
      
      internal function SkateboardEnterFrame() : *
      {
         var temp:int = 0;
         if(wantRL != 0 && (Math.abs(moveRL) < maxRL || wantRL * moveRL < 0))
         {
            moveRL += (wantRL * maxRL - moveRL) * 0.025;
         }
         if(onGround || almostGround || almostPlat)
         {
            if(!this.JumpIsDown())
            {
               this.SisDown = false;
            }
            if(this.JumpIsDown() && !this.SisDown)
            {
               this.char.gotoAndStop("ollie");
               this.SisDown = true;
               moveRL += -Math.sin(wallAngle) * -16;
               moveUD += Math.cos(wallAngle) * -16;
               this.fromLedge = false;
               FloatUp = 6;
               this.FloatLock = false;
               Sounds.playSound("Jump",this.x,0.6,onRail);
            }
            else
            {
               if(this.char.currentFrame > 29)
               {
                  this.char.gotoAndStop(4);
                  this.hairGel = 122;
                  this.head.gotoAndStop(122);
               }
               else if(this.char.currentFrame < 25)
               {
                  temp = 17 - Math.round(Math.abs(fakeRL) * 0.5);
                  if(temp < this.char.currentFrame - 1)
                  {
                     this.char.prevFrame();
                  }
                  if(temp < this.char.currentFrame)
                  {
                     this.char.prevFrame();
                  }
                  if(temp > this.char.currentFrame + 1)
                  {
                     this.char.nextFrame();
                  }
                  if(temp > this.char.currentFrame)
                  {
                     this.char.nextFrame();
                  }
               }
               else
               {
                  this.char.nextFrame();
               }
               if(moveUD > 0)
               {
                  moveUD += 2;
               }
               else
               {
                  moveUD += 1;
               }
               if(FloatUp == 0)
               {
                  this.fromLedge = true;
               }
            }
            if(Math.abs(rotation - wallRot) > 180)
            {
               if(wallRot > rotation)
               {
                  wallRot -= 360;
               }
               else
               {
                  wallRot += 360;
               }
            }
            rotter = (wallRot - rotation) * 0.5;
         }
         else
         {
            if(this.fromLedge && moveUD < 0)
            {
               FloatUp = 6;
               this.FloatLock = true;
               this.fromLedge = false;
            }
            if(this.char.currentFrame < 25)
            {
               this.char.gotoAndStop("rollOff");
            }
            else
            {
               this.char.nextFrame();
            }
            if(this.char.currentFrameLabel == "1" || this.char.currentFrameLabel == "2")
            {
               this.char.gotoAndStop("loop");
            }
            if(FloatUp > 0)
            {
               --FloatUp;
               if(!this.JumpIsDown() && !this.FloatLock)
               {
                  FloatUp = 0;
               }
            }
            else
            {
               moveUD += 1.5;
            }
            fakeRL = moveRL;
            fakeUD = moveUD;
            if(Math.abs(rotation - wallRot) > 180)
            {
               if(wallRot > rotation)
               {
                  wallRot -= 360;
               }
               else
               {
                  wallRot += 360;
               }
            }
            rotter = (wallRot - rotation) * 0.1;
         }
         this.placeHead(this.char);
      }
      
      internal function DisabledSetupFrame() : *
      {
         this.placeHead(this.char);
         fakeRL = fakeUD = moveRL = moveUD = rotation = 0;
         this.resetPencil();
         alpha = this.head.alpha = 0;
      }
      
      internal function DisabledEnterFrame() : *
      {
      }
      
      internal function DelaySetupFrame() : *
      {
         Status = "Disabled";
         this.hideAll();
      }
      
      internal function DelayEnterFrame() : *
      {
         if(this.b > 0)
         {
            --this.b;
         }
         else
         {
            this.setupVisibles(onRail);
            gotoBuffer = "Jump";
         }
      }
      
      internal function CelebrateSetupFrame() : *
      {
         this.resetPencil();
         this.placeHead(this.char);
      }
      
      internal function CelebrateEnterFrame() : *
      {
         this.char.nextFrame();
         this.placeHead(this.char);
         slideSlow(2);
         if(this.char.currentFrame == 10)
         {
            Main.switchScroll("zoomOut");
         }
         if(this.char.currentFrame == this.char.totalFrames)
         {
            this.CharEnterFrame = function():*
            {
            };
            Status = "Disabled";
            Main.FadeItOut("return",-1);
         }
      }
      
      internal function PencilSetupFrame() : *
      {
         wallHanging = false;
         if(Math.abs(wantRL) > 0.5)
         {
            this.head.scaleX = scaleX = makeOne(wantRL);
         }
         if(this.attackN == 4)
         {
            this.attackN = 0;
         }
         else if(Status != "Idle" && Status != "Walk" && Status != "Backpeddle")
         {
            this.attackN = 0;
         }
         if(Status == "DownSlide" && hasPencilAdv && Boolean(this.canRising))
         {
            dontLand = true;
            this.changeSubFrame(gotoBuffer,"Rising");
            moveUD = -18;
            this.chargePower = 20;
         }
         else if(this.UpIsDown() || this.attackUD < 0)
         {
            this.attackUD = 0;
            this.changeSubFrame(gotoBuffer,"Charge2");
         }
         else if(this.attackN == 5)
         {
            this.attackN = 6;
            this.chargePower = 20;
            this.changeSubFrame(gotoBuffer,"Medium2");
         }
         else if(this.attackN == 6)
         {
            this.attackN = 5;
            this.chargePower = 20;
            this.changeSubFrame(gotoBuffer,"Medium1");
         }
         else if(this.attackN > 0)
         {
            ++this.attackN;
            if(this.attackN == 5)
            {
               this.attackN = 1;
            }
            this.changeSubFrame(gotoBuffer,"Swipe" + this.attackN);
            this.char.gotoAndStop(1);
         }
         else
         {
            this.changeSubFrame(gotoBuffer,"Charge1");
         }
         this.AisDown = true;
         this.hairGel = 2;
         this.head.gotoAndStop(2);
         this.head.hair.stop();
         this.char.stop();
         this.placeHead(this.char);
         this.quickAttack = false;
         this.justAttackHit = this.justAttackQuick = false;
         tempUD = 1;
         this.setIsTall(25);
         this.showPencil();
         this.placePencil(this.char);
         parent.addChild(this.Pencil);
      }
      
      internal function PencilEnterFrame() : *
      {
         var temp:int = 0;
         var tempS:String = null;
         this.char.nextFrame();
         if(this.AttackIsDown())
         {
            ++this.chargeN;
         }
         else
         {
            this.chargeN = 0;
            this.AisDown = false;
         }
         if(!this.JumpIsDown())
         {
            this.SisDown = false;
         }
         if(this.subStatus == "Charge1" || this.subStatus == "Charge2")
         {
            if(!this.AttackIsDown())
            {
               if(this.char.currentFrame < 8)
               {
                  if(this.attackN <= 0)
                  {
                     if(this.UpIsDown() || this.attackUD < 0 || this.subStatus == "Charge2")
                     {
                        this.changeSubFrame(Status,"SwipeUp");
                        this.attackN = this.attackUD = 0;
                        this.chargePower = 15;
                     }
                     else if(Status == "PencilAir")
                     {
                        if(Boolean(this.canPokeDown) && (this.DownIsDown() || this.attackUD > 0))
                        {
                           this.changeSubFrame(Status,"PokeDown");
                           this.attackN = this.attackUD = 0;
                           this.chargePower = 40;
                        }
                        else if(moveUD < -12 && Boolean(this.canRising))
                        {
                           this.changeSubFrame(Status,"Rising");
                           this.FloatLock = true;
                           this.canQuickDrop = false;
                           this.attackN = 0;
                           this.chargePower = 30;
                           this.hairGel = this.hairGoTo = 13;
                           this.char.gotoAndStop(1);
                        }
                        else if(moveUD > 15)
                        {
                           this.changeSubFrame(Status,"Medium1");
                           this.attackN = 0;
                           this.chargePower = 30;
                           this.hairGel = this.hairGoTo = 13;
                           this.char.gotoAndStop(5);
                        }
                        else
                        {
                           this.changeSubFrame(Status,"Swipe1");
                           this.attackN = 1;
                           this.chargePower = 15;
                           this.char.gotoAndStop(1);
                        }
                     }
                     else
                     {
                        this.changeSubFrame(Status,"Swipe1");
                        this.attackN = 1;
                        this.chargePower = 15;
                        this.char.gotoAndStop(1);
                     }
                  }
               }
               else
               {
                  if(this.char.currentFrame < 40)
                  {
                     this.chargePower = this.char.currentFrame + 20;
                  }
                  else
                  {
                     this.chargePower = 70;
                  }
                  if(this.subStatus == "Charge2" || this.UpIsDown() || this.attackUD < 0)
                  {
                     this.attackUD = 0;
                     this.changeSubFrame(Status,"HeavyUp");
                  }
                  else if(Boolean(this.canPokeDown) && Status == "PencilAir" && (this.DownIsDown() || this.attackUD > 0))
                  {
                     this.attackUD = 0;
                     this.changeSubFrame(Status,"HeavyDown");
                  }
                  else if(Boolean(this.canBuzzSaw) || Status == "Pencil")
                  {
                     this.changeSubFrame(Status,"Heavy1");
                     this.char.gotoAndStop(2);
                  }
                  else
                  {
                     this.changeSubFrame(Status,"Medium1");
                     this.char.gotoAndStop(4);
                     if(Math.abs(moveRL) < 18 * 0.75)
                     {
                        moveRL = scaleX * 18 * 0.75;
                     }
                  }
               }
               this.justAttackHit = this.justAttackQuick = false;
               this.placeHead(this.char);
               this.char.stop();
            }
            if(Status == "Pencil")
            {
               if(this.char.currentFrame > 8)
               {
                  slideSlow(2);
               }
               else
               {
                  slideSlow(1);
               }
            }
         }
         else
         {
            if(gotoBuffer != "nothing")
            {
               isAttacking = false;
            }
            else if((Boolean(this.quickAttack) || this.chargeN > 8) && Boolean(this.canAttackAgain(this.subStatus,this.char.currentFrame)))
            {
               if(wantRL != 0)
               {
                  this.head.scaleX = scaleX = makeOne(wantRL);
               }
               if(this.chargeN > 8)
               {
                  this.attackN = 0;
                  this.stopAttacking();
                  Sounds.playSound("PenCharge",this.x,0.75,onRail);
                  if(this.UpIsDown() || this.attackUD < 0)
                  {
                     this.attackUD = 0;
                     this.changeSubFrame(Status,"Charge2");
                  }
                  else
                  {
                     this.changeSubFrame(Status,"Charge1");
                  }
                  this.char.gotoAndStop(8);
               }
               else if(this.attackN == 0)
               {
                  Sounds.playSound("PenCharge",this.x,0.75,onRail);
                  if(this.UpIsDown() || this.attackUD < 0)
                  {
                     this.attackUD = 0;
                     this.changeSubFrame(Status,"Charge2");
                  }
                  else
                  {
                     this.changeSubFrame(Status,"Charge1");
                  }
               }
               else if(this.UpIsDown() || this.attackUD < 0)
               {
                  this.changeSubFrame(Status,"Charge2");
                  this.attackN = this.attackUD = 0;
               }
               else if(this.justAttackHit && this.attackN > 1)
               {
                  this.chargePower = 20;
                  if(this.attackN == 3 || this.attackN == 5)
                  {
                     this.attackN = 6;
                     this.changeSubFrame(Status,"Medium2");
                  }
                  else
                  {
                     this.attackN = 5;
                     this.changeSubFrame(Status,"Medium1");
                  }
                  this.char.gotoAndStop(1);
               }
               else
               {
                  ++this.attackN;
                  if(this.attackN > 4)
                  {
                     this.attackN = 1;
                  }
                  this.hairGel = 2;
                  this.head.gotoAndStop(2);
                  this.head.hair.stop();
                  this.changeSubFrame(Status,"Swipe" + this.attackN);
                  this.char.gotoAndStop(1);
               }
               this.AisDown = true;
               this.char.stop();
               this.quickAttack = false;
               this.justAttackHit = this.justAttackQuick = false;
            }
            else if((Math.abs(wantRL) > 0.5 || this.JumpIsDown() || this.DownIsDown()) && Status == "Pencil" && Boolean(this.canMoveAgain(this.subStatus,this.char.currentFrame)))
            {
               if(this.Slash != null)
               {
                  if(this.Slash.parent != null)
                  {
                     this.Slash.goSwim();
                  }
                  this.Slash = null;
               }
               if(this.JumpListener(false))
               {
                  fakeRL *= 0.2;
                  fakeRL += wantRL * 5;
                  this.stopAttacking();
                  return false;
               }
               this.pencilOut = 15;
               if(!this.ActionStuff())
               {
                  if(scaleX * wantRL > 0)
                  {
                     gotoBuffer = "Walk";
                  }
                  else
                  {
                     gotoBuffer = "Backpeddle";
                  }
               }
            }
            else if(this.JumpIsDown() && Status == "Pencil" && Boolean(this.canMoveAgain(this.subStatus,this.char.currentFrame + 4)))
            {
               if(this.Slash != null)
               {
                  if(this.Slash.parent != null)
                  {
                     this.Slash.goSwim();
                  }
                  this.Slash = null;
               }
               if(this.JumpListener(false))
               {
                  fakeRL *= 0.2;
                  fakeRL += wantRL * 5;
                  this.stopAttacking();
                  return false;
               }
            }
            else if(this.char.currentFrame > 2 && this.AttackIsDown() && !this.AisDown)
            {
               this.AisDown = this.quickAttack = true;
            }
            if(Status == "PencilAir")
            {
               this.controlAir();
            }
            else if(this.char.currentFrame > 5 && !isAttacking)
            {
               slideSlow(2);
            }
            else
            {
               slideSlow(1);
            }
         }
         if(this.char.currentFrame == 2)
         {
            if(this.subStatus == "SwipeUp" || this.subStatus == "HeavyUp")
            {
               if(Status == "PencilAir")
               {
                  moveRL *= 0.4;
                  if(moveUD > -8)
                  {
                     moveUD = -8;
                  }
               }
            }
            else
            {
               if(this.subStatus == "Heavy1" || this.subStatus == "Heavy2")
               {
                  temp = 18;
               }
               else if(this.subStatus == "Medium1" || this.subStatus == "Medium2")
               {
                  temp = 10;
               }
               else if(this.attackN > 0)
               {
                  temp = 6;
               }
               else
               {
                  temp = 0;
               }
               if(temp > 0)
               {
                  if(Status == "Pencil")
                  {
                     if(Math.abs(fakeRL) < temp)
                     {
                        fakeRL = scaleX * temp;
                     }
                  }
                  else if(Math.abs(moveRL) < temp * 0.75)
                  {
                     moveRL = scaleX * temp * 0.75;
                  }
               }
            }
         }
         if(this.char.currentFrameLabel == "Swosh")
         {
            if(this.subStatus == "Medium1" || this.subStatus == "Medium2")
            {
               Sounds.playSound("MedSwosh",this.x,1.5,onRail);
            }
            else if(this.subStatus == "Heavy1" || this.subStatus == "Heavy2" || this.subStatus == "HeavyUp")
            {
               Sounds.playSound("HeavySwosh",this.x,1.5,onRail);
            }
            else
            {
               Sounds.playSound("Swosh",this.x,1.5,onRail);
            }
         }
         if(Status == "PencilAir")
         {
            this.fancyGravity();
         }
         if(this.char.currentFrame == this.char.totalFrames)
         {
            this.attackN = 0;
            if(this.subStatus.substr(0,6) != "Charge")
            {
               if(Status == "Pencil")
               {
                  this.pencilOut = 15;
                  gotoBuffer = "Idle";
               }
               else if(this.subStatus != "BuzzSaw")
               {
                  Status = "Jump";
                  this.CharEnterFrame = this.JumpEnterFrame;
                  tempS = this.subStatus;
                  if(this.subStatus == "PokeDown")
                  {
                     this.changeFrame("Jump");
                     this.char.gotoAndStop("dropJump");
                     this.char.char.gotoAndStop(3);
                  }
                  else
                  {
                     this.changeFrame("Jump");
                     this.char.gotoAndStop("runJump");
                     this.char.char.gotoAndStop(16);
                  }
                  if(this.Pencil.scaleY < 0.01)
                  {
                     this.resetPencil();
                  }
                  else
                  {
                     this.placePencil(this.char.char);
                  }
                  this.placeHead(this.char.char);
                  return;
               }
            }
         }
         else if(this.char.currentFrameLabel == "stopAttack")
         {
            this.stopAttacking();
         }
         if(gotoBuffer != "nothing" && gotoBuffer != "Pencil" && gotoBuffer != "PencilAir")
         {
            if(this.Slash != null)
            {
               if(this.Slash.parent != null)
               {
                  this.Slash.goSwim();
               }
               this.Slash = null;
            }
         }
         else if(this.Slash != null)
         {
            if(this.Slash.isVector)
            {
               if(this.Slash.EffectEnterFrame())
               {
                  this.Slash.goSwim();
                  this.Slash = null;
               }
            }
            else
            {
               if(this.Slash != null)
               {
                  if(this.Slash.currentFrame == this.Slash.numFrames)
                  {
                     this.Slash.goSwim();
                  }
                  else
                  {
                     ++this.Slash.currentFrame;
                  }
               }
               if(!this.Slash.visible)
               {
                  this.Slash = null;
               }
            }
         }
         if(gotoBuffer == "nothing" && this.char.currentFrameLabel != null)
         {
            if(this.char.currentFrameLabel.substr(0,6) == "effect")
            {
               if(this.Slash != null)
               {
                  if(this.Slash.parent != null)
                  {
                     this.Slash.goSwim();
                  }
                  this.Slash = null;
               }
               this.stopAttacking();
               isAttacking = true;
               if(this.charVector)
               {
                  this.Slash = cachedEffects.spawnCachedEffect(this.char.currentFrameLabel.substr(6,this.char.currentFrameLabel.length - 6),this.x,this.y,rotation * (Math.PI / 180),scaleX,0,0,onRail,parent,false);
               }
               else
               {
                  this.Slash = StarlingSmoke.SpawnSlash(this.char.currentFrameLabel.substr(6,this.char.currentFrameLabel.length - 6),0,0,rotation * (Math.PI / 180),scaleX,0,0,onRail,false);
               }
            }
            else if(this.char.currentFrameLabel == "toBuzzSaw" && Boolean(this.canBuzzSaw))
            {
               if(this.canBuzzSaw)
               {
                  this.changeSubFrame(Status,"BuzzSaw");
                  this.char.gotoAndStop(1);
                  this.Slash.goSwim();
                  this.Slash = null;
                  if(this.charVector)
                  {
                     this.Slash = cachedEffects.spawnCachedEffect("BuzzSaw",0,0,rotation,scaleX,0,0,onRail,parent,false);
                  }
                  else
                  {
                     this.Slash = StarlingSmoke.SpawnSlash("BuzzSaw",0,0,rotation * (Math.PI / 180),scaleX,0,0,onRail,false);
                  }
                  rotter = 80 * scaleX;
               }
               else
               {
                  this.changeSubFrame(Status,"Swipe1");
                  this.char.gotoAndStop(1);
               }
            }
         }
         if(Status == "PencilAir" && gotoBuffer == "nothing")
         {
            if(this.subStatus == "BuzzSaw")
            {
               if(Math.abs(rotter) > 30)
               {
                  rotter -= makeOne(rotter) * 1;
               }
               if(rotation * (rotation + rotter) < 0)
               {
                  Sounds.playSound("Swosh",this.x,1,onRail);
               }
               if(this.Slash.isVector)
               {
                  this.Slash.changeFrame(1);
               }
               else
               {
                  this.Slash.currentFrame = 1;
               }
            }
            else
            {
               this.rightChar();
               if(this.subStatus == "Rising" && this.char.currentFrame > 8 && this.char.currentFrame < 18)
               {
                  this.head.scaleX = scaleX * -1;
               }
               else
               {
                  this.head.scaleX = scaleX;
               }
               if(this.subStatus == "Rising" && this.char.currentFrame < 25)
               {
                  dontLand = true;
               }
               else
               {
                  dontLand = false;
               }
            }
         }
         if(this.SpecialStuff())
         {
            if(this.Slash != null)
            {
               if(this.Slash.parent != null)
               {
                  this.Slash.goSwim();
               }
               this.Slash = null;
            }
         }
         this.placePencil(this.char);
         this.placeHead(this.char);
      }
      
      public function ShootSetupFrame() : void
      {
         this.setIsTall(25);
         this.showPencil();
         parent.addChild(this.Pencil);
         this.attackN = rotter = 0;
         wallHanging = false;
         if(onGround && Math.abs(wallRot) < 90)
         {
            rotation = wallRot;
         }
         else
         {
            rotation = 0;
         }
         this.hairGoTo = this.hairGel = 13;
         this.head.gotoAndStop(13);
         this.head.hair.stop();
         this.placeHead(this.char);
         this.placePencil(this.char);
         if(Math.abs(this.springWantRL) > 0.1 && scaleX * this.springWantRL < 0)
         {
            scaleX *= -1;
            this.head.scaleX *= -1;
         }
         if(this.attackUD != 0)
         {
            wantUD = this.attackUD * 0.01;
         }
         if(Math.abs(wantUD) > 1)
         {
            wantUD = makeOne(wantUD);
         }
         this.inkAim = wantUD * 0.2;
         this.char.arms.gotoAndStop(1);
         this.char.arms.x = this.char.head.x - 4;
         this.char.arms.y = this.char.head.y + 4;
         this.shootAngle = Baddies.findClosestCast(this.x,this.y,(rotation - scaleX * 90) * (Math.PI / 180) + this.inkAim * scaleX,onRail);
         this.shootAngle = staticInteractObjects.findClosestCast(this.x,this.y,this.shootAngle,onRail);
         this.shootAngle = aWall.findClosestCast(this.x,this.y,this.shootAngle,onRail);
         this.shootInk();
         this.char.arms.rotation = this.shootAngle * scaleX * (180 / Math.PI) + 90 - rotation * scaleX;
      }
      
      public function ShootEnterFrame() : void
      {
         this.char.nextFrame();
         if(this.attackUD != 0)
         {
            wantUD = this.attackUD * 0.01;
         }
         if(Math.abs(wantUD) > 1)
         {
            wantUD = makeOne(wantUD);
         }
         if(Status == "Shoot")
         {
            slideSlow(2);
         }
         else
         {
            this.controlAir();
            this.fancyGravity();
         }
         this.placePencil(this.char);
         if(this.Special2IsDown())
         {
            if(!this.SpIsDown)
            {
               if(hasZip && this.canZip)
               {
                  if(Status == "ShootAir")
                  {
                     gotoBuffer = "ZipAir";
                  }
                  else
                  {
                     gotoBuffer = "Zip";
                  }
                  this.SpIsDown = true;
               }
            }
         }
         else if(this.char.currentFrame > 7 - this.inkReserve * 0.05)
         {
            if(this.SpecialIsDown() && this.inkReserve > 0)
            {
               if(Math.abs(this.inkAim) < Math.abs(wantUD) * 0.2 || this.inkAim * wantUD < 0)
               {
                  this.inkAim = wantUD * 0.2;
               }
               this.char.gotoAndStop(1);
               this.shootAngle = Baddies.findClosestCast(this.x,this.y,(rotation - scaleX * 90) * (Math.PI / 180) + this.inkAim * scaleX,onRail);
               this.shootAngle = staticInteractObjects.findClosestCast(this.x,this.y,this.shootAngle,onRail);
               this.shootAngle = aWall.findClosestCast(this.x,this.y,this.shootAngle,onRail);
               this.shootInk();
            }
         }
         else
         {
            this.inkAim += (wantUD * 0.4 - this.inkAim) * 0.5;
            this.shootAngle = (rotation - scaleX * 90) * (Math.PI / 180) + this.inkAim * scaleX;
         }
         if(this.char.currentFrame >= 9)
         {
            if(!this.AttackStuff())
            {
               if(!(Status == "Shoot" && Boolean(this.JumpListener(false))))
               {
                  if(Status == "Shoot" && this.DownIsDown())
                  {
                     gotoBuffer = "Duck";
                  }
                  else if(wantRL != 0)
                  {
                     if(Status == "Shoot")
                     {
                        gotoBuffer = "Idle";
                     }
                  }
                  else
                  {
                     this.inkAim += -this.inkAim * 0.1;
                     this.shootAngle = (rotation - scaleX * 90) * (Math.PI / 180) + this.inkAim * scaleX;
                  }
               }
            }
         }
         this.placeHead(this.char);
         this.placePencil(this.char);
         this.char.arms.gotoAndStop(this.char.currentFrame);
         this.char.arms.rotation = this.shootAngle * scaleX * (180 / Math.PI) + 90 - rotation * scaleX;
         this.pencilX += Math.cos(this.inkAim) * 15 - 15;
         this.pencilY -= Math.sin(this.inkAim) * 15 - this.inkAim * 6;
         this.headrot += this.inkAim * (180 / Math.PI);
         this.pencilRot += this.shootAngle * (180 / Math.PI) + scaleX * 90 - rotation;
         if(this.char.currentFrame == this.char.totalFrames)
         {
            if(Status != "Shoot")
            {
               this.changeFrame("Jump");
               Status = "Jump";
               this.CharEnterFrame = this.JumpEnterFrame;
               this.char.gotoAndStop("dropJump");
               this.char.char.gotoAndStop(3);
            }
         }
      }
      
      internal function ZipSetupFrame() : *
      {
         this.setIsTall(25);
         this.showPencil();
         parent.addChild(this.Pencil);
         this.attackN = rotter = 0;
         rotation = wallRot;
         this.hairGoTo = this.hairGel = 13;
         this.head.gotoAndStop(13);
         this.head.hair.stop();
         this.justAttackHit = this.justAttackQuick = false;
         this.canZip = false;
         this.pencilRL = moveRL;
         if(scaleX * this.attackRL < 0)
         {
            scaleX *= -1;
            this.head.scaleX *= -1;
            this.attackRL = 0;
         }
         else if(scaleX * wantRL < 0)
         {
            scaleX *= -1;
            this.head.scaleX *= -1;
         }
         moveRL /= 5;
         moveUD /= 5;
         facing = makeOne(scaleX);
         this.placeHead(this.char);
         this.placePencil(this.char);
         this.updateInk(-35);
         smokeB = 0;
         Sounds.playSound("HeavySwosh",this.x,1,onRail);
      }
      
      internal function ZipEnterFrame() : *
      {
         this.char.nextFrame();
         if(smokeB < 7)
         {
            ++smokeB;
         }
         this.placeHead(this.char);
         this.placePencil(this.char);
         this.attackRL = [5,10,30,60,80,50,20,20][smokeB] * facing;
         fakeRL = this.attackRL / 5;
         if(Status == "Zip")
         {
            rotation = wallRot;
         }
         moveRL = Math.cos(rotation * (Math.PI / 180)) * fakeRL;
         moveUD = Math.sin(rotation * (Math.PI / 180)) * fakeRL;
         if(this.justAttackQuick)
         {
            if(this.Special2IsDown())
            {
               this.char.gotoAndStop(4);
               if(smokeB > 4)
               {
                  smokeB = 4;
               }
               this.attackRL = 80 * facing;
               fakeRL = this.attackRL / 5;
               moveRL = Math.cos(rotation * (Math.PI / 180)) * fakeRL;
               moveUD = Math.sin(rotation * (Math.PI / 180)) * fakeRL;
            }
            this.justAttackQuick = false;
         }
         else if(this.justAttackHit && this.JumpIsDown())
         {
            this.canZip = true;
            this.jumpFromZip(false);
         }
         else if(smokeB > 6 || onWall + onWallPlat != 0 || this.justAttackHit && Math.abs(fakeRL) < this.pencilRL * 0.2)
         {
            downTime = 30;
            fakeRL = moveRL = 18 * facing;
            if(Status == "Zip")
            {
               this.runtoslide = true;
               gotoBuffer = "Slide";
               this.canZip = true;
            }
            else
            {
               if(this.justAttackHit)
               {
                  fakeRL = moveRL = 22 * facing;
                  initialFloat = FloatUp = 2;
                  this.FloatLock = true;
               }
               this.canZip = false;
               this.canQuickDrop = false;
               this.changeFrame("Jump");
               this.char.gotoAndStop("runJump");
               this.char.char.gotoAndStop(5);
               this.CharEnterFrame = this.JumpEnterFrame;
               Status = "Jump";
               this.placeHead(this.char.char);
               this.placePencil(this.char.char);
            }
            moveUD = this.attackRL = 0;
            this.justAttackHit = false;
         }
      }
      
      internal function InkBoardSetupFrame() : *
      {
         if(moveRL != 0)
         {
            scaleX = this.head.scaleX = makeOne(moveRL);
         }
         this.showPencil(1);
         this.placePencil(this.char);
         this.placeHead(this.char);
         rotter = fakeUD = 0;
         if(this.Slash != null)
         {
            if(this.Slash.parent != null)
            {
               this.Slash.goSwim();
            }
            this.Slash = null;
         }
         this.hairGel = this.hairGoTo = 13;
         angle = -Math.atan2(-moveRL,-moveUD);
         wantRot = angle / (Math.PI / 180);
         this.cameraThresh = 30;
         this.holdInkRot = this.lastInkboardRot = 0;
         if(isTouchScreen && !this.usingGamepad || true)
         {
            this.inkboardPointer.rotation = wantRot;
            this.inkboardPointer.x = this.x;
            this.inkboardPointer.y = this.y;
            this.inkboardPointer.visible = true;
         }
         this.resetJumpStuff();
         Sounds.playSound("InkBoardStart",this.x,1,onRail);
         this.moveSound = 0.5;
         this.fadeInMoveSound("InkBoardSliding",0.25,Math.abs(fakeRL) * 0.05);
         rootHUD.HUD.switchInkboard(true);
      }
      
      internal function InkBoardEnterFrame() : *
      {
         var ns:Number = NaN;
         var tempX:Number = NaN;
         var tempY:Number = NaN;
         var tempMatrix:Matrix = null;
         var b:* = undefined;
         this.char.nextFrame();
         this.pencilOut = 1;
         this.placePencil(this.char);
         this.placeHead(this.char);
         if(this.char.currentFrame > 8)
         {
            if(this.char.sparks.currentFrame == 6)
            {
               this.char.sparks.gotoAndStop(1);
            }
            else
            {
               this.char.sparks.nextFrame();
            }
            this.char.sparks.rotation = Math.random() * 360;
         }
         wallRot = -Math.atan2(-moveRL,-moveUD) / (Math.PI / 180);
         ns = nowSpeed();
         if(ns < 25)
         {
            ns += 0.5;
         }
         else if(ns > 25)
         {
            ns -= 0.1;
         }
         angle = wantRot * (Math.PI / 180);
         tempX = Math.sin(angle) * 1.5;
         tempY = -Math.cos(angle) * 1.5;
         tempX += wantRL;
         tempY += wantUD;
         wantRL = wantUD = 0;
         this.temp = wantRot;
         wantRot = -Math.atan2(-tempX,-tempY) / (Math.PI / 180);
         this.temp = rotCompare(wantRot,this.temp);
         if(this.holdInkRot == 0)
         {
            this.lastInkboardRot = this.temp;
            this.temp = rotCompare(wantRot,wallRot) * 0.1;
            f = makeOne(this.temp);
            if(this.temp != 0)
            {
               if(this.temp * f > 11)
               {
                  this.temp = 11 * f;
                  if(Math.abs(this.lastInkboardRot) > 11)
                  {
                     this.holdInkRot = 3;
                     this.lastInkboardRot = this.temp;
                  }
               }
            }
         }
         else
         {
            if((this.lastInkboardRot * this.temp < 0 || Math.abs(this.temp) < 11 && rotCompare(wantRot,wallRot) * this.lastInkboardRot > 0) && Math.abs(rotCompare(wantRot,wallRot)) < 80)
            {
               --this.holdInkRot;
            }
            this.temp = this.lastInkboardRot;
         }
         wallRot += this.temp * (ns / 23);
         wallAngle = wallRot * Math.PI / 180;
         moveRL = Math.sin(wallAngle) * ns;
         moveUD = -Math.cos(wallAngle) * ns;
         wallRot -= 90 * scaleX;
         fakeRL = ns * scaleX;
         if(wallRot > 180)
         {
            wallRot -= 360;
         }
         else if(wallRot < -180)
         {
            wallRot += 360;
         }
         wallAngle = wallRot * Math.PI / 180;
         angle = rotation * Math.PI / 180;
         tempX = this.x + (Math.cos(angle) * 30 * scaleX - Math.sin(angle) * 15) - this.onInkBoard.x;
         tempY = this.y + (Math.cos(angle) * 15 + Math.sin(angle) * 30 * scaleX) - this.onInkBoard.y;
         this.fadeInMoveSound("InkBoardSliding",0.25,Math.abs(fakeRL) * 0.05);
         if(canStatus != "inkBoard" || !this.JumpIsDown())
         {
            this.inkboardPointer.visible = false;
            rootHUD.HUD.switchInkboard(false);
            FloatUp = 0;
            this.FloatStill = false;
            this.canQuickDrop = false;
            Sounds.playSound("PenCharge",this.x,1,onRail);
            gotoBuffer = "Jump";
         }
         else if(Math.abs(tempX) < this.onInkBoard.isWide && Math.abs(tempY) < this.onInkBoard.isTall)
         {
            if(this.char.currentFrame == 3)
            {
               this.lastInkPointX = tempX;
               this.lastInkPointY = tempY;
            }
            else if(this.char.currentFrame > 3)
            {
               tempMatrix = new Matrix();
               if(this.char.currentFrame == 4)
               {
                  b = 34;
                  tempMatrix.scale(0.6666,0.6666);
               }
               else
               {
                  b = Math.floor(Math.random() * ns) + 1;
                  tempMatrix.scale(0.6666,0.6666);
               }
               b = Math.floor(Math.random() * 35) + 1;
               angle = -Math.atan2(this.lastInkPointX - tempX,this.lastInkPointY - tempY);
               this.lastInkPointX = tempX;
               this.lastInkPointY = tempY;
               tempMatrix.rotate(angle);
               tempMatrix.translate(tempX + this.onInkBoard.isWide,tempY + this.onInkBoard.isTall);
               StarlingBackgrounds.stampInkSplat(this.onInkBoard.inkBitmap,b,tempMatrix);
            }
         }
      }
      
      internal function GrindSlideSetupFrame() : *
      {
         this.setIsTall(25);
         if(moveRL != 0)
         {
            scaleX = this.head.scaleX = makeOne(moveRL);
         }
         this.placeHead(this.char);
         rotter = fakeUD = 0;
         this.hairGel = this.hairGoTo = 13;
         this.resetPencil();
         Sounds.playSound("PoleLand",this.x,landSpeed * 0.1,onRail);
         this.moveSound = 0;
         this.fadeInMoveSound("InkBoardSliding",0.25,Math.abs(fakeRL) * 0.05);
      }
      
      internal function GrindSlideEnterFrame() : *
      {
         this.char.nextFrame();
         if(this.char.currentFrame == this.char.totalFrames)
         {
            this.char.gotoAndStop("loop");
         }
         this.placeHead(this.char);
         if(fakeRL * scaleX < 30)
         {
            fakeRL += scaleX * 0.25;
         }
         if(!this.JumpListener(false))
         {
            if(canStatus != "Grind")
            {
               gotoBuffer = "Slide";
            }
         }
         this.fadeInMoveSound("InkBoardSliding",0.25,Math.abs(fakeRL) * 0.05);
      }
      
      private function HangSetupFrame() : *
      {
         this.b = 0;
         this.setIsTall(25);
         this.moveSound = 1;
         if(Boolean(aPlatOn.forceStill) || aPlatOn.isWide <= isWide * 2)
         {
            this.moveSound = 0;
            if(landSpeed > 30 || Math.abs(moveRL) > 10)
            {
               this.char.gotoAndStop("land");
            }
            else
            {
               this.char.gotoAndStop("light");
            }
         }
         else if(Math.abs(fakeRL) > 20)
         {
            this.char.gotoAndStop("slideFast");
            this.char.char.gotoAndStop(14);
            this.fadeInMoveSound("HangSlide",0.25,Math.abs(fakeRL) * 0.1);
         }
         else if(Math.abs(wallRot) > 15)
         {
            this.char.gotoAndStop("slideFast");
            this.char.char.gotoAndStop(14);
            this.fadeInMoveSound("HangSlide",0.25,Math.abs(fakeRL) * 0.1);
         }
         else if(Math.abs(fakeRL) > 10 && wantRL == 0)
         {
            this.char.gotoAndStop("slideFast");
            this.char.char.gotoAndStop(14);
            this.fadeInMoveSound("HangSlide",0.25,Math.abs(fakeRL) * 0.1);
         }
         else if(Math.abs(fakeRL) > 10)
         {
            this.char.gotoAndStop("slide");
            this.fadeInMoveSound("HangSlide",0.25,Math.abs(fakeRL) * 0.05);
         }
         else if(wantRL == 0)
         {
            this.moveSound = 0;
            if(landSpeed > 30)
            {
               this.char.gotoAndStop("land");
            }
            else
            {
               this.char.gotoAndStop("light");
            }
         }
         else
         {
            this.char.gotoAndStop("walk");
         }
         this.char.char.stop();
         if(this.char.currentFrameLabel == "land")
         {
            this.b = 72;
            if(moveRL != 0)
            {
               this.head.scaleX = scaleX = makeOne(moveRL);
            }
         }
         Sounds.playSound("HangLand",this.x,landSpeed * 0.05,onRail);
         this.resetPencil();
         this.placeHead(this.char.char);
         this.temp = 0;
      }
      
      private function HangEnterFrame() : *
      {
         this.char.char.nextFrame();
         if(aPlatOn == null)
         {
            trace("null platform");
         }
         else if(aPlatOn.forceStill)
         {
            this.char.char.nextFrame();
            if(this.char.currentFrameLabel == "land" || this.char.currentFrameLabel == "light")
            {
               if(this.char.char.currentFrame == this.char.char.totalFrames)
               {
                  this.char.gotoAndStop("idle");
                  this.char.char.stop();
               }
            }
            else if(this.char.char.currentFrame == this.char.char.totalFrames)
            {
               this.char.char.gotoAndStop("loop");
            }
            slideSlow(2);
            this.canLateJump = false;
         }
         else if(Math.abs(wallRot) > 15)
         {
            this.fadeInMoveSound("HangSlide",0.25,Math.abs(fakeRL) * 0.1);
            if(scaleX * fakeRL < 0)
            {
               scaleX = makeOne(fakeRL);
               this.head.scaleX = scaleX;
            }
         }
         else if(this.char.currentFrameLabel == "land" || this.char.currentFrameLabel == "light")
         {
            this.char.char.nextFrame();
            if(this.char.char.currentFrame == this.char.char.totalFrames)
            {
               this.char.gotoAndStop("idle");
               this.char.char.stop();
            }
            else if(aPlatOn.isWide <= isWide * 2)
            {
               if(wantRL != 0 && this.char.char.currentFrame > this.b)
               {
                  scaleX = makeOne(wantRL);
                  this.head.scaleX = scaleX;
               }
            }
            else if(wantRL != 0 && wantRL * onLedge <= 0)
            {
               this.char.gotoAndStop("idle");
               this.char.char.stop();
            }
            slideSlow(2);
         }
         else
         {
            if(Math.abs(fakeRL) > 10 && wantRL * fakeRL >= 0)
            {
               slideSlow(0.5);
            }
            else if(aPlatOn.isWide <= isWide * 2)
            {
               fakeRL = wantRL * 1;
            }
            else
            {
               fakeRL += (wantRL * 10 - fakeRL) * 0.12;
               if(wantRL == 0)
               {
                  fakeRL *= 0.9;
               }
            }
            if(Math.abs(fakeRL) < 5 && wantRL == 0 || aPlatOn.isWide <= isWide * 2)
            {
               if(this.char.currentFrameLabel == "walk")
               {
                  this.fadeInMoveSound("HangSlide",-0.2,Math.abs(fakeRL) * 0.1);
                  if(this.char.char.currentFrame < 13)
                  {
                     this.char.char.nextFrame();
                  }
                  else if(this.char.char.currentFrame < 74)
                  {
                     this.char.char.gotoAndStop("slow");
                  }
                  else if(this.char.char.currentFrame == this.char.char.totalFrames)
                  {
                     this.char.gotoAndStop("idle");
                     this.char.char.stop();
                  }
               }
               else if(this.char.currentFrameLabel == "slide")
               {
                  this.fadeInMoveSound("HangSlide",0.25,Math.abs(fakeRL) * 0.1);
                  if(this.char.char.currentFrame > 5)
                  {
                     this.char.gotoAndStop("walk");
                     this.char.char.stop();
                     this.temp = 9;
                  }
               }
               else if(this.char.currentFrameLabel == "slideFast")
               {
                  this.fadeInMoveSound("HangSlide",0.25,Math.abs(fakeRL) * 0.1);
                  if(this.char.char.currentFrame > 20)
                  {
                     this.char.gotoAndStop("slow");
                     this.char.char.stop();
                  }
               }
               else if(this.char.currentFrameLabel == "slow")
               {
                  this.fadeInMoveSound("HangSlide",0.25,Math.abs(fakeRL) * 0.1);
                  if(this.char.char.currentFrame == this.char.char.totalFrames)
                  {
                     this.char.gotoAndStop("idle");
                     this.char.char.stop();
                     this.temp = 1;
                  }
               }
               else
               {
                  this.fadeInMoveSound("HangSlide",-0.2,Math.abs(fakeRL) * 0.1);
                  if(this.char.char.currentFrame == this.char.char.totalFrames)
                  {
                     this.char.char.gotoAndStop("loop");
                  }
                  this.temp = 0;
               }
            }
            else if(this.char.currentFrameLabel == "idle")
            {
               this.char.gotoAndStop("walk");
               this.temp = 1;
               this.char.char.gotoAndStop(1);
            }
            else if(this.char.currentFrameLabel == "slide")
            {
               if(this.char.char.currentFrame < 8)
               {
                  this.fadeInMoveSound("HangSlide",0.25,Math.abs(fakeRL) * 0.05);
               }
               else
               {
                  this.fadeInMoveSound("HangSlide",-0.15,Math.abs(fakeRL) * 0.05);
               }
               if(onLedge != 0)
               {
                  this.char.gotoAndStop("land");
                  this.char.char.gotoAndStop(10);
               }
               else if(this.char.char.currentFrame == this.char.char.totalFrames)
               {
                  this.char.gotoAndStop("walk");
                  this.char.char.stop();
                  this.temp = 22;
                  this.char.char.gotoAndStop(this.temp);
               }
            }
            else if(this.char.currentFrameLabel == "slideFast")
            {
               this.fadeInMoveSound("HangSlide",0.25,Math.abs(fakeRL) * 0.1);
               if(onLedge != 0)
               {
                  this.char.gotoAndStop("land");
                  this.char.char.gotoAndStop(10);
               }
               else if(Math.abs(fakeRL) <= 15)
               {
                  if(wantRL != 0)
                  {
                     this.char.gotoAndStop("walk");
                     this.char.char.stop();
                     this.temp = 0;
                  }
                  else if(this.char.char.currentFrame > 20)
                  {
                     if(Math.abs(fakeRL) < 20)
                     {
                        this.char.gotoAndStop("slow");
                        this.char.char.stop();
                     }
                  }
               }
            }
            else if(this.char.currentFrameLabel == "slow")
            {
               this.fadeInMoveSound("HangSlide",0.25,Math.abs(fakeRL) * 0.1);
               if(wantRL != 0)
               {
                  this.char.gotoAndStop("walk");
                  this.char.char.stop();
                  this.temp = 0;
               }
            }
            else if(this.char.currentFrameLabel == "walk")
            {
               this.fadeInMoveSound("HangSlide",-0.2,Math.abs(fakeRL) * 0.1);
               if(this.char.char.currentFrame > 90)
               {
                  this.temp = 1;
               }
               this.temp += Math.abs(fakeRL) / 10 * 4;
               if(this.char.char.currentFrame - 1 <= 13 && uint(this.temp) + 1 >= 13 || this.char.char.currentFrame - 1 <= 38 && uint(this.temp) + 1 >= 38 || this.char.char.currentFrame - 1 <= 70 && uint(this.temp) + 1 >= 70)
               {
                  Sounds.playSound("HangStep",this.x,1,onRail);
               }
               this.char.char.gotoAndStop(uint(this.temp) + 1);
               if(this.char.char.currentFrame > 69)
               {
                  this.char.char.gotoAndStop("loop");
                  this.temp = this.char.char.currentFrame;
               }
            }
            if(scaleX * fakeRL < 0)
            {
               scaleX = makeOne(fakeRL);
               this.head.scaleX = scaleX;
            }
         }
         this.placeHead(this.char.char);
         if(!Still)
         {
            if(this.JumpListener(false))
            {
               if(onLedge * wantRL > 0 && Math.abs(fakeRL) < Math.abs(wantRL) * 3)
               {
                  fakeRL = wantRL * 3;
               }
            }
         }
      }
      
      public function SlidePoleSetupFrame() : *
      {
         this.placeHead(this.char);
         fakeRL = moveRL;
         moveRL = fakeUD = 0;
         rotation = rotter = 0;
         this.TempStill = Still = false;
         if(moveUD > 0)
         {
            moveUD *= 0.5;
         }
         this.spinRot = 0;
         this.hairGel = this.hairGoTo = 13;
         this.resetPencil();
         this.setIsTall(25);
         bounce = 0.5;
         bounceThresh = 20;
         if(fakeRL != 0)
         {
            scaleX = this.head.scaleX = makeOne(fakeRL);
         }
         this.x = this.onSlidePole.x;
         Sounds.playSound("PoleLand",this.x,Math.abs(fakeRL) * 0.1,onRail);
      }
      
      public function SlidePoleEnterFrame() : *
      {
         rotter += -rotation * 0.1;
         rotter *= 0.8;
         if(!this.JumpIsDown())
         {
            this.SisDown = false;
         }
         if(canStatus != "slidePole")
         {
            scaleX = makeOne(scaleX);
            this.head.scaleX = scaleX;
            fakeRL = 0;
            this.x = this.onSlidePole.x + this.char.head.x * scaleX;
            this.changeFrame("Jump");
            Status = "Jump";
            this.CharEnterFrame = this.JumpEnterFrame;
            this.char.gotoAndStop("dropJump");
            this.char.char.gotoAndStop(12);
            this.placeHead(this.char.char);
            this.Vanity(true);
         }
         else if(this.JumpIsDown() && !this.SisDown && this.char.currentFrame > 2)
         {
            if(Math.abs(wantRL) > 0.5)
            {
               moveRL = fakeRL = makeOne(wantRL) * 18;
            }
            else if(this.char.head.x == 0)
            {
               moveRL = fakeRL = scaleX * this.head.scaleX * 18;
            }
            else
            {
               moveRL = fakeRL = scaleX * makeOne(this.char.head.x) * 18;
            }
            this.x = this.onSlidePole.x + fakeRL;
            scaleX = makeOne(fakeRL);
            this.head.scaleX = scaleX;
            Sounds.playSound("Jump",this.x,0.6,onRail);
            Jumper = 14;
            FloatUp = 4;
            this.SisDown = true;
            this.changeFrame("Jump");
            Status = "Jump";
            this.JumpSetupFrame();
            this.CharEnterFrame = this.JumpEnterFrame;
            this.char.gotoAndStop("normal");
            this.char.char.gotoAndStop(1);
            this.placeHead(this.char.char);
            this.Vanity(true);
         }
         else
         {
            fakeRL *= 0.95;
            fakeRL += makeOne(fakeRL) * Math.abs(moveUD) * 0.075;
            if(this.spinRot + Math.abs(fakeRL) * 0.2 > 4 && this.spinRot < 4 || this.spinRot + Math.abs(fakeRL) * 0.2 > 22 && this.spinRot < 22 || this.spinRot + Math.abs(fakeRL) * 0.2 > 42 && this.spinRot < 42 || this.spinRot + Math.abs(fakeRL) * 0.2 > 62 && this.spinRot < 62 || this.spinRot + Math.abs(fakeRL) * 0.2 > 82 && this.spinRot < 82)
            {
               Sounds.playSound("Twirl",this.x,Math.abs(fakeRL) * 0.05,onRail);
            }
            if(FloatUp > 0)
            {
               --FloatUp;
            }
            else if(moveUD < 25)
            {
               ++moveUD;
            }
            this.placeHead(this.char);
         }
      }
      
      public function PeerAtInkSetupFrame() : *
      {
         rotation = 0;
         scaleX = 1;
         this.setIsTall(25);
         this.placeHead(this.char);
         this.resetPencil();
         this.placePencil(this.char);
         fakeRL = fakeUD = moveRL = moveUD = 0;
         Main.switchScroll("peerAndPushScroll");
      }
      
      public function PeerAtInkEnterFrame() : *
      {
         this.char.nextFrame();
         this.placeHead(this.char);
         this.placePencil(this.char);
         if(this.char.currentFrame > 68 && this.char.currentFrame < 134)
         {
            this.char.push.gotoAndStop(this.char.currentFrame - 68);
         }
         Status = "Disabled";
         if(this.char.currentFrameLabel == "a")
         {
            rotation = 60;
            moveRL = 6;
            moveUD = 0;
            this.x += 50;
            this.y += 10;
            gotoBuffer = "Hurt";
            this.coreSwitchAnim();
            this.char.gotoAndStop(16);
            rotter = 3;
         }
      }
      
      public function InkWarpEnterFrame() : *
      {
         if(this.char.currentFrameLabel == "loop")
         {
            this.char.gotoAndStop(16);
         }
         else
         {
            this.char.nextFrame();
         }
         rotation += rotter;
         ++this.b;
         if(this.b == 170)
         {
            Main.saveProgress("realUnlocked",true);
            Main.FadeItBlack("Level5-a",0);
         }
         else if(this.b == 5 || this.b == 38 || this.b == 40 || this.b == 60 || this.b == 65 || this.b == 75 || this.b == 85 || this.b == 95 || this.b == 100 || this.b == 105 || this.b == 110 || this.b == 115 || this.b == 118 || this.b == 121 || this.b == 135)
         {
            rootHUD.toggleMyBlackBlank(false);
         }
         else
         {
            rootHUD.toggleMyBlackBlank(true);
         }
      }
      
      public function TurtleWarpSetupFrame() : *
      {
         this.x = 0;
         this.y = 80;
         parent.mask = null;
         alpha = this.head.alpha = 1;
         parent.x = Main.originalStageX;
         parent.y = Main.originalStageY;
         parent.scaleX = parent.scaleY = 1;
         parent.parent.addChild(parent);
         fakeRL = 0;
         rotter = -20;
         this.placeHead(this.char);
         this.Vanity();
      }
      
      public function TurtleWarpEnterFrame() : *
      {
         this.char.nextFrame();
         if(Main.cameraZ < -200 && alpha > 0)
         {
            alpha -= 0.02;
            this.head.alpha = alpha;
         }
         if(this.char.currentFrame == this.char.totalFrames)
         {
            this.char.gotoAndStop("loop");
         }
      }
      
      internal function twohandedCheckKeysDown(key:uint) : void
      {
         switch(key)
         {
            case this.rootRightIsDown:
               this.fakeRightIsDown = true;
               break;
            case this.rootLeftIsDown:
               this.fakeLeftIsDown = true;
               break;
            case this.rootUpIsDown:
               this.fakeUpIsDown = true;
               break;
            case this.rootDownIsDown:
               this.fakeDownIsDown = true;
               break;
            case this.rootJumpIsDown:
               this.fakeJumpIsDown = true;
               break;
            case this.rootAttackIsDown:
               this.fakeAttackIsDown = true;
               break;
            case this.rootSpecialIsDown:
               this.fakeSpecialIsDown = true;
               break;
            case this.rootSpecial2IsDown:
               this.fakeSpecial2IsDown = true;
         }
      }
      
      internal function twohandedCheckKeysUp(key:uint) : void
      {
         switch(key)
         {
            case this.rootRightIsDown:
               this.fakeRightIsDown = false;
               break;
            case this.rootLeftIsDown:
               this.fakeLeftIsDown = false;
               break;
            case this.rootUpIsDown:
               this.fakeUpIsDown = false;
               break;
            case this.rootDownIsDown:
               this.fakeDownIsDown = false;
               break;
            case this.rootJumpIsDown:
               this.fakeJumpIsDown = false;
               break;
            case this.rootAttackIsDown:
               this.fakeAttackIsDown = false;
               break;
            case this.rootSpecialIsDown:
               this.fakeSpecialIsDown = false;
               break;
            case this.rootSpecial2IsDown:
               this.fakeSpecial2IsDown = false;
         }
      }
      
      internal function onehandedCheckKeysDown(key:uint) : void
      {
         switch(key)
         {
            case 68:
            case 39:
               this.fakeRightIsDown = true;
               break;
            case 65:
            case 37:
               this.fakeLeftIsDown = true;
               break;
            case 83:
            case 40:
               this.fakeDownIsDown = true;
               break;
            case 87:
            case 38:
               this.fakeJumpIsDown = true;
               break;
            case 69:
            case 191:
               this.fakeAttackIsDown = true;
         }
      }
      
      internal function onehandedCheckKeysUp(key:uint) : void
      {
         switch(key)
         {
            case 68:
            case 39:
               this.fakeRightIsDown = false;
               break;
            case 65:
            case 37:
               this.fakeLeftIsDown = false;
               break;
            case 83:
            case 40:
               this.fakeDownIsDown = false;
               break;
            case 87:
            case 38:
               this.fakeJumpIsDown = false;
               break;
            case 69:
            case 191:
               this.fakeAttackIsDown = false;
         }
      }
      
      public function resetAllControls() : void
      {
         this.fakeRightIsDown = false;
         this.fakeLeftIsDown = false;
         this.fakeUpIsDown = false;
         this.fakeDownIsDown = false;
         this.fakeJumpIsDown = false;
         this.fakeAttackIsDown = false;
         this.fakeSpecialIsDown = false;
         this.gamepadRL = this.gamepadUD = 0;
         this.gamepadAttack = false;
         this.gamepadJump = false;
         this.gamepadSpecial = false;
         this.gamepadSpecial2 = false;
      }
      
      private function myHalfMoves() : *
      {
         if(hitPause <= 0)
         {
            this.controlStuff();
            if(Status == "Pencil" || Status == "PencilAir")
            {
               if(this.Slash != null && this.Slash.scaleX * scaleX > 0)
               {
                  this.Slash.x = this.x;
                  this.Slash.y = this.y;
                  this.Slash.scaleX = scaleX;
                  this.Slash.rotation = rotation;
               }
            }
         }
      }
      
      internal function RLFunc(sliding:*, rolling:*, ledgeGrab:*, dontFall:*) : *
      {
         var tempN:uint = 0;
         CheckAllGrounds();
         if(Status == "Disabled")
         {
            return false;
         }
         if(!this.checkPit())
         {
            if(onGround)
            {
               if(Status == "Pencil")
               {
                  if(onLedge * fakeRL > 0)
                  {
                     this.x -= moveRL;
                     this.y -= moveUD;
                     fakeRL = 0;
                  }
               }
            }
            else if(gotoBuffer != "Jump" && gotoBuffer != "Hurt")
            {
               this.FloatLock = true;
               this.getRunningFloatUp();
               if(!Still)
               {
                  this.canLateJump = 3;
               }
               if(Status == "DoorOut")
               {
                  this.setupVisibles(onRail);
               }
               if(Status == "Pencil")
               {
                  rotter = 0;
                  if(Math.abs(wallRot) > 90)
                  {
                     scaleX *= -1;
                     this.head.scaleX = scaleX;
                     this.headx *= -1;
                     rotation += 180;
                  }
                  rotation *= 0.5;
                  this.pencilGroundToAir();
               }
               else if(Status == "Shoot" && this.char.currentFrame < 10)
               {
                  Status = "ShootAir";
                  tempN = uint(this.char.currentFrame);
                  this.changeFrame("ShootAir");
                  this.char.gotoAndStop(tempN);
                  this.placeHead(this.char);
                  this.placePencil(this.char);
               }
               else if(health <= 0 || Status == "GetUp")
               {
                  Jumper = 0;
                  gotoBuffer = "Hurt";
               }
               else
               {
                  this.legFrame = this.char.currentFrame;
                  gotoBuffer = "Jump";
               }
               return "Fall";
            }
         }
      }
      
      private function getRunningFloatUp() : void
      {
         if(moveUD > -0.5)
         {
            FloatUp = 4;
         }
         else if(Math.abs(fakeRL) < 10)
         {
            FloatUp = 4;
         }
         else if(Math.abs(fakeRL) > 26)
         {
            tempRot = Math.sin(wallRot * this.quickRadian) * 4;
            FloatUp = 8 - Math.abs(tempRot);
            this.FloatStill = true;
            this.fromFloatY = this.y;
         }
         else
         {
            tempRot = Math.sin(wallRot * this.quickRadian) * ((Math.abs(fakeRL) - 10) * 0.5);
            FloatUp = 4 + ((Math.abs(fakeRL) - 10) * 0.5 - Math.abs(tempRot));
            this.FloatStill = true;
            this.fromFloatY = this.y;
         }
      }
      
      private function pencilGroundToAir() : void
      {
         var i:uint = 0;
         Status = "PencilAir";
         var tempN:uint = uint(this.char.currentFrame);
         if(!this.canBuzzSaw && this.subStatus == "Charge1")
         {
            this.changeSubFrame("PencilAir","Swipe1");
            this.char.gotoAndStop(1);
         }
         else
         {
            this.changeSubFrame("PencilAir",this.subStatus);
            this.char.gotoAndStop(1);
         }
         this.placeHead(this.char);
         this.placePencil(this.char);
         for(i = 0; this.char["pencilFake" + i] != undefined; i++)
         {
            this.char["pencilFake" + i].visible = false;
         }
      }
      
      private function controlStuff() : void
      {
         this.CheckGamepads();
         if(!(isTouchScreen && !this.usingGamepad && Status == "InkBoard"))
         {
            if(this.RightIsDown())
            {
               wantRL = 1;
            }
            else if(this.LeftIsDown())
            {
               wantRL = -1;
            }
            else
            {
               wantRL = 0;
            }
            if(this.DownIsDown())
            {
               wantUD = 1;
            }
            else if(this.UpIsDown())
            {
               wantUD = -1;
            }
            else
            {
               wantUD = 0;
            }
         }
         if(this.gamepadRL == 0 && this.gamepadUD == 0)
         {
            if(Math.abs(wallRot) > 90 && fakeRL * wantRL < 0)
            {
               this.controlSwap = -1;
            }
         }
         else
         {
            wantRL = this.gamepadRL;
            wantUD = this.gamepadUD;
         }
         if(Math.abs(wallRot) > 90 && onGround && Status != "InkBoard")
         {
            if(wantRL == 0 && this.gamepadUD == 0)
            {
               this.controlSwap = -1;
            }
         }
         else
         {
            this.controlSwap = 1;
         }
         wantRL *= this.controlSwap;
         if(Still)
         {
            wantRL = wantUD = 0;
         }
         if(Math.abs(wantRL) > Math.abs(this.springWantRL))
         {
            this.springWantRL = wantRL;
         }
         else
         {
            this.springWantRL += (wantRL - this.springWantRL) * 0.4 * framin;
         }
      }
      
      internal function slopeStuff(ground:*) : *
      {
         var temp:Number = NaN;
         if(Boolean(ground) && Boolean(Status != "DoorIn") && Status != "GrindSlide")
         {
            RotToAccel(wallRot);
            if(Status == "Hang")
            {
               if(Math.abs(wallRot) > 15)
               {
                  if(fakeRL * wallRot < 0)
                  {
                     temp = rotAccel * 1;
                  }
                  else
                  {
                     temp = rotAccel * 3;
                  }
               }
               else
               {
                  temp = 0;
               }
            }
            else if(Status == "DownSlide" || Status == "Duck")
            {
               if(fakeRL * rotAccel < 0 && Math.abs(fakeRL) > 10)
               {
                  temp = rotAccel * 0.2;
               }
               else
               {
                  temp = rotAccel * 1.75;
               }
            }
            else if(Status == "GetUp" || Status == "LandQuick")
            {
               temp = rotAccel * 0.25;
            }
            else if(Status == "Walk" || Status == "Slow" || Status == "Backpeddle" || Status == "SlideBackpeddle")
            {
               if(wantRL == 0)
               {
                  temp = rotAccel * 0.4;
               }
               else if(fakeRL * rotAccel < 0)
               {
                  temp = rotAccel * 0.5;
               }
               else
               {
                  temp = rotAccel;
               }
            }
            else if(Status == "Idle" || Status == "Slide" || Status == "Duck" || Status == "Land" || Status == "Pencil")
            {
               if(this.TempStillX)
               {
                  if(Math.abs(rotation) > 90)
                  {
                     temp = rotAccel / Math.abs(rotAccel) * 1.5;
                  }
                  else
                  {
                     temp = rotAccel * 1.5;
                  }
               }
               else if(Math.abs(wallRot) > 60)
               {
                  temp = rotAccel * 1;
               }
               else
               {
                  temp = rotAccel * 0.5;
               }
            }
            else if(wantRL * rotAccel > 0)
            {
               temp = rotAccel * 0.75;
            }
            else if(wantRL * rotAccel < 0)
            {
               if(Math.abs(fakeRL) < 20)
               {
                  temp = rotAccel * 0.25;
               }
               else
               {
                  temp = rotAccel * 0.2;
               }
            }
            else
            {
               temp = rotAccel * 1.5;
            }
            if(Math.abs(fakeRL + temp) < 40)
            {
               fakeRL += temp;
            }
            else
            {
               fakeRL *= 40 / Math.abs(fakeRL);
            }
         }
      }
      
      private function fadeInMoveSound(e:String, b:Number, vol:Number = 1) : void
      {
         if(this.moveSound < 1 && b > 0)
         {
            this.moveSound += b;
         }
         if(this.moveSound > 0)
         {
            if(b < 0)
            {
               this.moveSound += b;
               if(this.moveSound < 0)
               {
                  this.moveSound = 0;
               }
            }
            if(currentSound == null)
            {
               currentSound = Sounds.playSoundContinuous(e,this.x,this.moveSound * vol,onRail);
            }
            else
            {
               Sounds.updateSound(currentSound,this.x,this.moveSound * vol,onRail);
            }
         }
         else if(currentSound != null)
         {
            Sounds.stopSound(currentSound);
            currentSound = null;
         }
      }
      
      public function pauseStuff() : void
      {
         if(this.hasGamepad)
         {
            this.gamepadRL = 0;
            this.gamepadUD = 0;
            this.gamepadAttack = false;
            this.gamepadJump = false;
            this.gamepadSpecial = false;
            this.gamepadSpecial2 = false;
         }
         this.CheckGamepads();
         if(this.RightIsDown())
         {
            wantRL = 1;
         }
         else if(this.LeftIsDown())
         {
            wantRL = -1;
         }
         else
         {
            wantRL = this.gamepadRL;
         }
         if(this.DownIsDown())
         {
            wantUD = 1;
         }
         else if(this.UpIsDown())
         {
            wantUD = -1;
         }
         else
         {
            wantUD = this.gamepadUD;
         }
      }
      
      internal function controlGround(slide:uint = 1) : Number
      {
         var temp:Number = NaN;
         if(Still)
         {
            if(onLedge == 0)
            {
               slideSlow(2);
            }
            else
            {
               fakeRL = 0;
            }
         }
         else if(fakeRL * makeOne(wantRL) < maxRL && (fakeRL + this.RLing(wantRL)) * wantRL > maxRL)
         {
            fakeRL = maxRL * wantRL;
         }
         else if(wantRL == 0)
         {
            if(Status == "Idle" || Status == "Slide" || Status == "Duck" || Status == "Land")
            {
               slideSlow(slide);
            }
            else if(scaleX * fakeRL > 0)
            {
               normalSlow();
            }
            else
            {
               slideSlow(slide);
            }
         }
         else if(fakeRL / wantRL < maxRL)
         {
            if(wantRL * fakeRL < 0)
            {
               slideSlow(1.5);
            }
            fakeRL += this.RLing(wantRL);
         }
         else if(Status != "Run" && Math.abs(fakeRL) < 20 || maxRL < 20)
         {
            if(scaleX * fakeRL > 0)
            {
               normalSlow();
            }
            else
            {
               slideSlow(slide);
            }
         }
         if(Math.abs(fakeRL) > 25)
         {
            temp = fakeRL - makeOne(fakeRL) * 25;
            temp *= 0.98;
            fakeRL = makeOne(fakeRL) * 25 + temp;
         }
         return wantRL;
      }
      
      private function controlAir() : void
      {
         var temp:Number = NaN;
         if(Still || this.FloatStill)
         {
            if(this.superStill)
            {
               moveRL -= makeOne(moveRL) * 2;
            }
            else if(this.TempStill && moveUD > -10)
            {
               Still = this.TempStill = false;
            }
            if(this.FloatStill && this.y > this.fromFloatY)
            {
               this.FloatStill = false;
            }
         }
         else if(this.char.currentFrameLabel == "Matrix" || Status == "PencilAir" && this.subStatus == "SwipeUp")
         {
            if(!(false && this.char.char.currentFrame < 5))
            {
               if(wantRL == 0)
               {
                  if(Math.abs(moveRL) > maxRL * 0.6)
                  {
                     moveRL -= moveRL / Math.abs(moveRL) * 0.5;
                  }
               }
               else if(moveUD < 0)
               {
                  temp = ((maxRL * 0.2 + 5) * wantRL - moveRL) / 12;
                  if(Math.abs(temp) > 0.5)
                  {
                     moveRL += wantRL * 0.5;
                  }
                  else
                  {
                     moveRL += temp;
                  }
               }
               else if(Math.abs(moveRL) > maxRL)
               {
                  moveRL -= moveRL / Math.abs(moveRL) * 0.5;
               }
               else
               {
                  temp = ((maxRL * 0.8 + 5) * wantRL - moveRL) / 20;
                  if(Math.abs(temp) > 1)
                  {
                     moveRL += wantRL;
                  }
                  else
                  {
                     moveRL += temp;
                  }
               }
            }
         }
         else if(wantRL == 0)
         {
            if(Math.abs(moveRL) > maxRL * 0.6 && moveUD > 0)
            {
               moveRL -= moveRL / Math.abs(moveRL) * 0.5;
            }
         }
         else if(moveRL * wantRL > maxRL)
         {
            moveRL -= moveRL / Math.abs(moveRL) * 0.1;
         }
         else if(moveRL * wantRL < maxRL * 0.8)
         {
            temp = ((maxRL + 5) * wantRL - moveRL) / 18;
            if(Math.abs(temp) > 1.5)
            {
               moveRL += wantRL * 1.5;
            }
            else
            {
               moveRL += temp;
            }
         }
      }
      
      private function fancyGravity() : void
      {
         if(this.JumpIsDown())
         {
            if(this.canLateJump == 0)
            {
               if(this.jumpHeld > 0)
               {
                  --this.jumpHeld;
               }
               else
               {
                  this.SisDown = true;
               }
            }
         }
         else if(!(isTouchScreen && this.DownIsDown()))
         {
            this.jumpHeld = 5;
            this.SisDown = false;
         }
         if(wallHanging)
         {
            if(moveUD >= 0)
            {
               if(this.onWallN > 0)
               {
                  if(moveUD > 0)
                  {
                     moveUD *= 0.8;
                     moveUD -= 0.25;
                  }
                  else
                  {
                     moveUD = 0;
                  }
                  --this.onWallN;
               }
               else
               {
                  moveUD += 0.2;
               }
            }
            else if(moveUD < -1.5)
            {
               moveUD += 1.5;
            }
            else
            {
               moveUD = 0;
            }
         }
         else if(moveUD < 30)
         {
            if(!this.JumpIsDown() && !this.FloatLock && !Still && !this.TempStill && !this.FloatStill || FloatUp == 0)
            {
               FloatUp = 0;
               this.FloatStill = false;
               if(this.canQuickDrop && !this.FloatLock && !Still && !this.TempStill && !this.FloatStill)
               {
                  if(moveUD > 0)
                  {
                     moveUD += 0.5;
                  }
                  else if(!this.JumpIsDown())
                  {
                     ++moveUD;
                  }
               }
               moveUD += 1.5;
               if((this.char.currentFrameLabel == "normal" || this.char.currentFrameLabel == "airSheath") && this.char.char.currentFrame < 3)
               {
                  if(this.canQuickDrop)
                  {
                     this.char.char.gotoAndStop(9);
                  }
                  else
                  {
                     this.char.char.gotoAndStop(3);
                  }
               }
            }
            else
            {
               if(this.FloatLock && moveUD > -10 && initialFloat > 0)
               {
                  moveUD += (1 - FloatUp / initialFloat) * 1.5;
               }
               --FloatUp;
            }
         }
         else
         {
            ++this.terminalVelocity;
         }
         angle = rotation * this.quickRadian;
         fakeRL = Math.cos(angle) * moveRL + Math.sin(angle) * moveUD;
         fakeUD = Math.cos(angle) * moveUD - Math.sin(angle) * moveRL;
      }
      
      internal function RLing(dir:*) : *
      {
         if(dir == 0)
         {
            return 0;
         }
         if(Math.abs(fakeRL) > 18 || Status == "Run")
         {
            return 2 * dir;
         }
         return ((maxRL + 5) * dir - fakeRL) / 20;
      }
      
      internal function predictGround() : *
      {
         var tempHitGround:uint = 0;
         var tempYUD:Number = NaN;
         var peak:Boolean = false;
         var i:Number = NaN;
         tempX = this.x + moveRL;
         tempY = this.y + isTall + moveUD;
         tempRL = moveRL;
         tempUD = moveUD;
         this.tempJump = this.JumpIsDown();
         this.tempStill = Still;
         this.tempTempStill = this.TempStill;
         this.tempFloatStill = this.FloatStill;
         this.tempFloat = FloatUp;
         tempHitGround = 0;
         this.willBeOnWall = 0;
         this.alreadyPredictedN = 0;
         this.predictOffsetY = 0;
         for(i = 0; i < 60; i++)
         {
            tempHitGround++;
            if(this.toOnRail == -1 && tempUD < 0 && tempY < this.y - isTall - 50 && tempY < Main.cameraY - relativeStageY / this.ratio)
            {
               peak = true;
               break;
            }
            if(Boolean(this.alreadyPredicted) && tempY + tempUD < this.alreadyPredictY && false)
            {
               i--;
            }
            else
            {
               if(this.predictGroundCheck(tempX,tempY,tempUD))
               {
                  if(this.predictOffsetY != 0)
                  {
                     this.predictOffsetY += -(80 - vOffset);
                  }
                  this.alreadyPredicted = false;
                  break;
               }
               if(tempUD < 0 && Boolean(this.predictAllHead(tempX - tempRL,tempY - isTall * 2,tempUD)))
               {
                  tempY -= tempUD;
                  tempUD = 0;
               }
               if(this.groundYUD < 10)
               {
                  if(checkForWalls(tempX + isWide + 5,tempY - isTall,tempUD,isTall - 10))
                  {
                     this.willBeOnWall = 1;
                     break;
                  }
                  if(checkForWalls(tempX - isWide - 5,tempY - isTall,tempUD,isTall - 10))
                  {
                     this.willBeOnWall = -1;
                     break;
                  }
               }
            }
            if(this.alreadyPredictedN > 5 && false)
            {
               this.alreadyPredicted = true;
               this.alreadyPredictY = tempY;
               return false;
            }
            if(Boolean(this.tempStill) || Boolean(this.tempTempStill) || Boolean(this.tempFloatStill))
            {
               if(Boolean(this.tempTempStill) && tempUD > -10)
               {
                  this.tempStill = this.tempTempStill = false;
               }
            }
            else if(wantRL == 0)
            {
               if(Math.abs(tempRL) > maxRL * 0.6 && tempUD > 0)
               {
                  tempRL -= tempRL / Math.abs(tempRL) * 0.5;
               }
            }
            else if(tempRL * wantRL < -maxRL * 0.6)
            {
               tempRL += wantRL * 2;
            }
            else if(tempRL * wantRL > maxRL)
            {
               tempRL -= tempRL / Math.abs(tempRL) * 0.1;
            }
            else if(tempRL * wantRL < maxRL * 0.8)
            {
               tempRL += ((maxRL * 0.8 + 5) * wantRL - tempRL) / 15;
            }
            tempX += tempRL;
            if(tempUD < 30)
            {
               if(!this.tempJump && !this.FloatLock && !Still && !this.TempStill && !this.FloatStill || this.tempFloat <= 0 || tempUD > 0)
               {
                  this.tempFloat = 0;
                  this.tempFloatStill = false;
                  if(this.canQuickDrop && !this.FloatLock && !Still && !this.TempStill && !this.FloatStill)
                  {
                     if(!this.tempJump && tempUD < -8)
                     {
                        tempUD += 2;
                     }
                  }
                  tempUD += 1.5;
               }
               else
               {
                  --this.tempFloat;
               }
            }
            tempY += tempUD;
         }
         if(tempHitGround < 20 || true)
         {
            this.hitGround = tempHitGround;
         }
         this.landUD = tempUD;
         if(tempHitGround < 3 && (Status == "Roll" || Status == "Skateboard"))
         {
            this.groundYUD = (wallY - this.groundY) * Math.abs((this.y - 40 - this.cameraY) / 800);
         }
         else if(this.groundYUD * moveUD < -200)
         {
            this.groundYUD = (moveUD * 2 - this.groundYUD) * 1;
         }
         else if(Main.lockShiftRatio == 0 && this.y - isTall - 100 < this.cameraY - relativeStageY / this.ratio && moveUD < 0)
         {
            this.groundYUD = this.y - isTall - 100 - (this.cameraY - relativeStageY / this.ratio);
         }
         else
         {
            if(this.willBeOnWall != 0)
            {
               this.landUD = 1;
               this.alreadyPredicted = false;
               this.groundYUD = (tempY - isTall + 50 - this.groundY) / (this.hitGround + 8);
               return true;
            }
            if(tempY - this.groundY > 200)
            {
               if(moveUD > 0)
               {
                  if(tempY - 50 > Main.cameraY + relativeStageY / this.ratio)
                  {
                     this.groundYUD = moveUD;
                     if(this.y + 300 / this.ratio > this.groundY)
                     {
                        this.groundYUD += (this.y + 300 / this.ratio - this.groundY) / 10;
                     }
                  }
                  else
                  {
                     this.groundYUD += ((tempY + this.predictOffsetY - this.groundY) / (this.hitGround + 8) - this.groundYUD) * 0.5;
                  }
               }
               else
               {
                  this.groundYUD *= 0.5;
               }
            }
            else if(peak)
            {
               this.groundYUD = (tempY - this.groundY) / this.hitGround + tempUD;
            }
            else
            {
               this.groundYUD += (tempY + this.predictOffsetY - this.groundY) / (this.hitGround + 8) - this.groundYUD;
            }
         }
         return false;
      }
      
      private function predictGroundCheck(ex:Number, ey:Number, eUD:Number) : Boolean
      {
         ++this.alreadyPredictedN;
         if(this.toOnRail > -1)
         {
            if(eUD < 0)
            {
               return false;
            }
            return Boolean(this.predictAllGroundsRail(ex,ey,eUD,isWide,this.toOnRail)) || aWall.quickCheckWalls(ex,ey,isWide + 2,this.toOnRail) || aPlat.quickCheckPlats(ex,ey,eUD,isWide + 2,this.toOnRail,this);
         }
         return Boolean(this.predictAllGrounds(ex,ey,eUD,isWide)) || Baddies.checkGonnaStomps(ex,ey,isWide,onRail,this.hitGround,this) || staticInteractObjects.cameraCheckObjects(ex,ey,isWide,isTall,onRail,this) || StarlingInteract.cameraCheckObjects(ex,ey,isWide,isTall,onRail,this) || aWall.quickCheckWalls(ex,ey,isWide + 2,onRail) || aPlat.quickCheckPlats(ex,ey,eUD,isWide + 2,onRail,this);
      }
      
      private function predictAllGrounds(ex:Number, ey:Number, eUD:Number, wide:int) : Boolean
      {
         if(groundHitTest(ex,ey))
         {
            return true;
         }
         if(Boolean(wallsHitTest(ex,ey)) && !wallsHitTest(ex,ey - Math.abs(eUD)))
         {
            return true;
         }
         if(eUD < 0)
         {
            return false;
         }
         if((Boolean(platformsHitTest(ex + wide,ey + 10)) || Boolean(platformsHitTest(ex + wide,ey - 10))) && !platformsHitTest(ex + wide,ey - (Math.abs(eUD * 3) + 10)))
         {
            return true;
         }
         if((Boolean(platformsHitTest(ex - wide,ey + 10)) || Boolean(platformsHitTest(ex - wide,ey - 10))) && !platformsHitTest(ex - wide,ey - (Math.abs(eUD * 3) + 10)))
         {
            return true;
         }
         return false;
      }
      
      private function predictAllHead(ex:Number, ey:Number, eUD:Number) : Boolean
      {
         if(groundHitTest(ex,ey))
         {
            return true;
         }
         if(Boolean(wallsHitTest(ex,ey)) && !wallsHitTest(ex,ey - eUD))
         {
            return true;
         }
         return false;
      }
      
      private function predictAllGroundsRail(ex:Number, ey:Number, eUD:Number, wide:int, rail:int) : Boolean
      {
         if(Main.AllEverything["ground" + rail].hitTestPoint(ex,ey,true))
         {
            return true;
         }
         if((Boolean(Main.AllEverything["platforms" + rail].hitTestPoint(ex + wide,ey + 10,true)) || Boolean(Main.AllEverything["platforms" + rail].hitTestPoint(ex + wide,ey - 10,true))) && !Main.AllEverything["platforms" + rail].hitTestPoint(ex + wide,ey - (Math.abs(eUD * 3) + 10),true))
         {
            return true;
         }
         if((Boolean(Main.AllEverything["platforms" + rail].hitTestPoint(ex - wide,ey + 10,true)) || Boolean(Main.AllEverything["platforms" + rail].hitTestPoint(ex - wide,ey - 10,true))) && !Main.AllEverything["platforms" + rail].hitTestPoint(ex - wide,ey - (Math.abs(eUD * 3) + 10),true))
         {
            return true;
         }
         if(Boolean(Main.AllEverything["walls" + rail].hitTestPoint(ex,ey,true)) && !Main.AllEverything["walls" + rail].hitTestPoint(ex,ey - Math.abs(eUD),true))
         {
            return true;
         }
         return false;
      }
      
      private function predictJumpToY(eUD:int, float:int, ey:int) : *
      {
         var i:Number = NaN;
         tempY = this.y + isTall + eUD;
         tempUD = eUD;
         this.tempFloat = float;
         for(i = 0; i < 100; i++)
         {
            if(tempUD < 30)
            {
               if(this.tempFloat <= 0 || tempUD > 0)
               {
                  this.tempFloat = 0;
                  tempUD += 1.5;
               }
               else
               {
                  --this.tempFloat;
               }
            }
            tempY += tempUD;
            if(tempY > ey)
            {
               this.hitGround = i;
               break;
            }
         }
      }
      
      internal function placeHead(e:*) : *
      {
         var angle:Number = NaN;
         if(e.head == undefined)
         {
            trace("no head!!" + Status + " " + " " + e.currentFrame + " " + e);
         }
         else
         {
            angle = rotation * this.quickRadian;
            this.headx = e.head.x;
            this.heady = e.head.y;
            this.headrot = e.head.rotation;
            e.head.visible = false;
         }
      }
      
      private function hairGuide() : void
      {
         this.hairRL = fakeRL + platRL + wallRL + groundRL;
         this.hairUD = fakeUD + platUD + wallUD;
         if(this.hairGel > 162)
         {
            if(this.hairGel == 178)
            {
               this.hairGel = this.hairGoTo = 130;
            }
            this.hairGoTo = this.hairGel + 1;
         }
         else if(this.hairGel > 153)
         {
            this.hairGoTo = 162;
         }
         else if(this.hairGel > 136)
         {
            this.hairGoTo = this.hairGel + 1;
            if(this.hairGel == 142 && Math.abs(this.hairRL) > 5)
            {
               this.hairGel = this.hairGoTo = 19;
            }
            if(this.hairGel == 153)
            {
               this.hairGel = this.hairGoTo = 24;
            }
         }
         else if(this.hairGel > 120)
         {
            this.hairGoTo = this.hairGel + 1;
            if(this.hairGel == 136 || Math.abs(this.hairRL) > 5 && this.hairGel == 128)
            {
               this.hairGel = this.hairGoTo = 24;
            }
         }
         else if(this.hairGel > 100)
         {
            if(this.char.currentFrameLabel == "wallOn")
            {
               this.hairGoTo = this.hairGel = 63;
            }
            else if(this.hairUD < 0)
            {
               if(this.hairGel < 107)
               {
                  this.hairGoTo = 107;
               }
               else if(this.hairGel > 108)
               {
                  this.hairGoTo = this.hairGel = 101;
               }
            }
            else
            {
               this.hairGoTo = 119;
            }
         }
         else if(Math.abs(this.hairRL) >= Math.abs(this.hairUD) || Math.abs(this.hairUD) < 4)
         {
            if(this.hairGel == 62)
            {
               this.hairGel = this.hairGoTo = 24;
            }
            else if(this.hairGel == 65)
            {
               this.hairGel = this.hairGoTo = 130;
            }
            else if(this.hairGel > 47)
            {
               this.hairGoTo = 63;
            }
            else if(Math.abs(this.hairRL) < 2)
            {
               this.hairGoTo = 24;
            }
            else if(this.head.scaleX * this.hairRL > 0)
            {
               if(Math.abs(this.hairRL) < 15)
               {
                  this.hairGoTo = 13;
               }
               else
               {
                  this.hairGoTo = 2;
               }
            }
            else if(Math.abs(this.hairRL) < 15)
            {
               this.hairGoTo = 35;
            }
            else
            {
               this.hairGoTo = 46;
            }
         }
         else if(this.hairGel == 17 && this.hairUD > 10)
         {
            this.hairGel = this.hairGoTo = 115;
         }
         else if(this.hairGel == 24 && this.hairUD < 10)
         {
            this.hairGel = this.hairGoTo = 63;
         }
         else if(this.hairGel < 47)
         {
            this.hairGoTo = 24;
         }
         else if(this.hairUD > 15)
         {
            this.hairGoTo = 48;
         }
         else if(this.hairUD > 2)
         {
            this.hairGoTo = 55;
         }
         else if(this.hairUD < -15)
         {
            this.hairGoTo = 84;
         }
         else if(this.hairUD < -2)
         {
            this.hairGoTo = 75;
         }
         else
         {
            this.hairGoTo = 63;
         }
         if(Math.abs(this.hairGel - this.hairGoTo) > 15)
         {
            if(this.hairGel > this.hairGoTo)
            {
               this.hairGel -= 2;
            }
            if(this.hairGel < this.hairGoTo)
            {
               this.hairGel += 2;
            }
         }
         else
         {
            if(this.hairGel > this.hairGoTo)
            {
               --this.hairGel;
            }
            if(this.hairGel < this.hairGoTo)
            {
               ++this.hairGel;
            }
         }
         this.head.gotoAndStop(this.hairGel);
         if(this.head.hair != null)
         {
            if(this.head.hair.currentFrame == this.head.hair.totalFrames)
            {
               this.head.hair.gotoAndStop(1);
            }
            else
            {
               this.head.hair.nextFrame();
            }
         }
         if(this.head.head != null)
         {
            if(this.head.head.currentFrame == this.head.head.totalFrames)
            {
               this.head.head.gotoAndStop(1);
            }
            else
            {
               this.head.head.nextFrame();
            }
         }
      }
      
      internal function hatFlap() : *
      {
         var temp:Number = NaN;
         var angle:Number = NaN;
         temp = -(this.hairRL * 1.5 * scaleX);
         if(temp > 0)
         {
            temp = 0;
         }
         if(this.hairUD > 0)
         {
            temp -= this.hairUD * 1.5;
         }
         if(temp < -30)
         {
            temp = -30;
         }
         this.head.hat.rotation += (temp * Math.random() - this.head.hat.rotation) * 0.5;
         angle = this.head.hat.rotation * this.quickRadian;
         this.head.hat.x = -7 + (Math.cos(angle) * 7 - Math.sin(angle) * -6);
         this.head.hat.y = Math.cos(angle) * -6 + Math.sin(angle) * 7;
      }
      
      private function hatSanta() : void
      {
         if(this.head.hat.hat.currentFrame == 36)
         {
            this.head.hat.hat.gotoAndStop(1);
         }
         else
         {
            this.head.hat.hat.nextFrame();
         }
      }
      
      internal function hatBubble() : *
      {
         if(hatVar0 > 0)
         {
            hatVar0 -= nowSpeed();
         }
         else if(this.toOnRail == -1)
         {
            hatVar0 = 10 + Math.random() * 20;
            StarlingEffect.Spawn("bubble",this.headX,this.headY - 17,-Math.atan2(moveRL,moveUD) - 1.5708,0.5 + Math.random(),Math.random() * 2 - 1,Math.random() * 2 - 1,onRail);
         }
      }
      
      internal function hatFire() : *
      {
         var tempX:Number = NaN;
         if(this.toOnRail == -1 && this.ratio < 8)
         {
            tempX = Math.random() * 10 - 5;
            StarlingEffect.Spawn("fire",this.headX + tempX + Math.random() * 6 - 3,this.headY - 10,-Math.atan2(moveRL,moveUD + 2),0.2 + Math.random(),-tempX * 0.15,-(Math.random() * 3) + 0.1,onRail);
            StarlingEffect.GrabLastEffect().scaleY = StarlingEffect.GrabLastEffect().scaleY + nowSpeed() * 0.1;
         }
      }
      
      private function SuperAction() : *
      {
         return Status == "Idle" || Status == "Walk" || Status == "Run" || Status == "Slow" || Status == "Backpeddle" || Status == "SlideBackpeddle" || Status == "Slide";
      }
      
      private function ActionStuff() : Boolean
      {
         if(this.UpIsDown())
         {
            this.fallView += (-200 - this.fallView) / 10;
         }
         if(this.JumpListener(false))
         {
            return true;
         }
         if(this.DownIsDown())
         {
            if(Math.abs(fakeRL) > 5 && fakeRL * scaleX > 0)
            {
               gotoBuffer = "DownSlide";
            }
            else
            {
               gotoBuffer = "Duck";
            }
            return true;
         }
         if(this.SpecialStuff())
         {
            return true;
         }
         if(this.AttackStuff())
         {
            return true;
         }
      }
      
      private function PencilAttackStuff() : Boolean
      {
         if(!this.AttackIsDown())
         {
            this.AisDown = false;
         }
         if(this.AttackIsDown() && !this.AisDown && Status != "Pencil" && Status != "PencilAir" && this.toOnRail == -1 && Status != "Hurt" && Status != "GetUp" && !Still)
         {
            this.AisDown = true;
            if(Status == "Jump" || Status == "ShootAir" || isTall < 20)
            {
               rotter = 0;
               if(Math.abs(rotation) > 90 && this.char.currentFrameLabel == "Matrix")
               {
                  scaleX *= -1;
                  this.head.scaleX = scaleX;
                  this.headx *= -1;
                  rotation += 180;
               }
               rotation *= 0.5;
               gotoBuffer = "PencilAir";
            }
            else
            {
               gotoBuffer = "Pencil";
            }
            return true;
         }
         return false;
      }
      
      private function SpecialStuff() : Boolean
      {
         if(!(this.inkReserve == 0 || Still))
         {
            if(this.SpecialIsDown())
            {
               if(hasShoot)
               {
                  isAttacking = false;
                  if(Status == "Jump" || Status == "PencilAir")
                  {
                     gotoBuffer = "ShootAir";
                  }
                  else
                  {
                     gotoBuffer = "Shoot";
                  }
                  return true;
               }
            }
            else if(this.Special2IsDown())
            {
               if(!this.SpIsDown)
               {
                  if(this.canZip && hasZip)
                  {
                     isAttacking = false;
                     if(Status == "Jump" || Status == "PencilAir")
                     {
                        gotoBuffer = "ZipAir";
                     }
                     else
                     {
                        gotoBuffer = "Zip";
                     }
                     this.SpIsDown = true;
                     return true;
                  }
               }
            }
            else
            {
               this.SpIsDown = false;
            }
         }
         return false;
      }
      
      public function jumpFromZip(quick:*) : void
      {
         this.attackRL = wallRot = 0;
         fakeRL = moveRL = (8 * wantRL + 12 * scaleX) * 0.5;
         this.canQuickDrop = false;
         downTime = 30;
         this.canZip = true;
         if(Boolean(quick) && wantRL == 0)
         {
            this.resetPencil();
            this.changeFrame("Jump");
            Status = "Jump";
            this.CharEnterFrame = this.JumpEnterFrame;
            this.char.gotoAndStop("dropJump");
            this.char.char.gotoAndStop(1);
            this.placeHead(this.char.char);
            FloatUp = 0;
            moveUD = -30;
         }
         else if(quick)
         {
            FloatUp = 0;
            Jumper = 30;
            gotoBuffer = "Jump";
         }
         else
         {
            FloatUp = 6;
            this.FloatLock = true;
            Jumper = 20;
            gotoBuffer = "Jump";
         }
      }
      
      private function JumpListener(jumpAgain:Boolean = false) : Boolean
      {
         if(!this.JumpIsDown())
         {
            this.SisDown = false;
         }
         if(suppressJump)
         {
            suppressJump = false;
            return false;
         }
         if(this.JumpIsDown() && !this.SisDown)
         {
            this.SisDown = true;
            Sounds.playSound("Jump",this.x,0.6,onRail);
            Jumper = 16;
            if(jumpAgain)
            {
               if(moveUD < 0)
               {
                  if(FloatUp == 0)
                  {
                     FloatUp = 5;
                  }
                  else if(FloatUp > 5)
                  {
                     FloatUp = 5;
                  }
               }
               else if(FloatUp < 5)
               {
                  FloatUp = 5;
               }
            }
            else
            {
               FloatUp = 5;
            }
            this.TempStill = this.FloatStill = this.FloatLock = this.TempStillX = false;
            if(jumpAgain)
            {
               wallRot = oldWallRot;
               fakeRL = oldFakeRL;
               Jumper -= oldFakeUD;
               oldFakeUD = 0;
            }
            if(Status == "Backpeddle" || Status == "SlideBackpeddle")
            {
               if(this.char.currentFrame < 8 && wantRL * scaleX > 0)
               {
                  scaleX *= -1;
                  this.head.scaleX = scaleX;
               }
            }
            if(gotoBuffer == "Pencil")
            {
               this.toPencil = true;
            }
            this.canQuickDrop = true;
            gotoBuffer = "Jump";
            return true;
         }
         return false;
      }
      
      private function JumpGuide() : Boolean
      {
         CheckAllAir();
         if(!this.superHurt)
         {
            if(!this.checkPit())
            {
               if(onGround)
               {
                  if(Math.abs(wallRot) < 70)
                  {
                     if(Status == "Hurt" || Status == "FallCat" || Status == "PencilAir" || Status == "ShootAir" || this.char.currentFrameLabel == "backflip" || canStatus != "nothing")
                     {
                        this.JumpLand();
                        return false;
                     }
                     if(Math.abs(rotCompare(wallRot,rotation)) > 100 && Math.abs(rotation) > 60)
                     {
                        Sounds.playSound("BadStomp",this.x,3,onRail);
                        if(landSpeed < 16)
                        {
                           Jumper = landSpeed;
                        }
                        else
                        {
                           Jumper = 16;
                        }
                        moveUD = -Jumper;
                        rotter = -scaleX * 30;
                        wallRot = wallAngle = 0;
                        gotoBuffer = "Hurt";
                        onGround = false;
                        return true;
                     }
                     if(false && Math.abs(rotCompare(wallRot,rotation)) > 80 && moveRL * wallRot > 0)
                     {
                        if(Status == "Jump")
                        {
                           this.char.gotoAndStop("dropJump");
                           this.char.stop();
                           this.char.char.gotoAndStop(8);
                           this.placeHead(this.char.char);
                        }
                        Main.shakeScreen(landSpeed * 0.5,0,true);
                        this.fliprot = 0;
                        footSlide(footX(),footY(),scaleX,wallAngle,fakeRL,slippery);
                        onGround = false;
                        return true;
                     }
                     this.JumpLand();
                     return false;
                  }
                  if(landSpeed > 5)
                  {
                     if(Status == "Jump")
                     {
                        wallHanging = false;
                        this.char.gotoAndStop("dropJump");
                        this.char.stop();
                        this.char.char.gotoAndStop(8);
                        this.placeHead(this.char.char);
                        this.Vanity(true);
                        rotter *= -1;
                     }
                  }
                  onGround = false;
                  return true;
               }
               alreadyOnGround = false;
               if(this.canLateJump > 0)
               {
                  this.canLateJump -= Main.framin;
                  this.JumpListener(true);
               }
               if(landSpeed > 30 && false)
               {
                  rotter = landSpeed * makeOne(moveRL);
                  landSpeed = 0;
                  this.resetPencil();
                  gotoBuffer = "Roll";
               }
               else if(!wallHanging && Status == "Jump")
               {
                  if(FloatUp == 0 && this.canWallHang())
                  {
                     Sounds.playSound("Land",this.x,Math.abs(landSpeed) * 0.05,onRail);
                     if(onWall == 0)
                     {
                        onWall = onWallPlat;
                     }
                     if(Math.abs(rotation) > 45)
                     {
                        rotation = makeOne(this.fliprot) * -90;
                     }
                     moveUD -= platUD * 0.5;
                     if(moveUD > 0)
                     {
                        if(onWallPlat == 0)
                        {
                           moveUD *= 0.5;
                        }
                        else
                        {
                           moveUD = 0;
                        }
                     }
                     wallHanging = true;
                     Still = this.FloatLock = this.FloatStill = this.TempStill = false;
                     rotter = this.fliprot = 0;
                     this.head.scaleX = scaleX = onWall;
                     this.canAutoLook = false;
                     this.resetPencil();
                     this.char.gotoAndStop("wallOn");
                     this.char.char.gotoAndStop(1);
                     this.placeHead(this.char.char);
                     this.Vanity();
                  }
                  else if(onWall != 0)
                  {
                     Still = this.FloatStill = false;
                  }
               }
               return false;
            }
         }
      }
      
      public function StompGuide() : void
      {
         stompedOnX += fakeRL * 0.75 * Main.framin;
         stompedOnY = -StompedOn.springTall - isTall;
         this.x = StompedOn.footX() + (Math.cos(wallAngle) * stompedOnX - Math.sin(wallAngle) * stompedOnY);
         this.y = StompedOn.footY() + (Math.cos(wallAngle) * stompedOnY + Math.sin(wallAngle) * stompedOnX);
         wallY = StompedOn.footY();
         moveRL = moveUD = 0;
         if(CheckWalls(moveRL,moveUD))
         {
            if(onWall * fakeRL > 0)
            {
               fakeRL = 0;
            }
         }
         rotation += rotter * framin;
         this.checkAfterMove();
         lastX = this.x;
         lastY = this.y;
      }
      
      public function GrabbedGuide() : void
      {
         this.x = StompedOn.x + StompedOn.baddie.char.x * StompedOn.facing;
         this.y = StompedOn.y + StompedOn.baddie.char.y;
         rotation = StompedOn.baddie.char.rotation * StompedOn.facing;
      }
      
      internal function RailGuide() : void
      {
         this.cameraZ += (Main.backgroundZs[this.toOnRail] - this.cameraZ) * (1 - Math.pow(1 - 1 / this.hitGround,Main.framin));
         this.ratio = cameraFocalLength / (cameraFocalLength + this.cameraZ - (Main.cameraZ + Main.zOffset));
         if(this.wasOnRail > -1 && moveUD > 0)
         {
            onRail = this.wasOnRail;
            this.changeRails(this.toOnRail,false);
            this.wasOnRail = -1;
         }
      }
      
      private function LedgeHangGuide() : void
      {
         CheckAllAir();
         wallRot = 0;
         this.groundYUD = (this.y + 100 - this.groundY) * 0.05;
         if(aWall.quickCheckWalls(this.x,this.y - isTall - 10,isWide - 5,onRail) || Boolean(wallsHitTest(this.x,this.y - isTall - 10)))
         {
            gotoBuffer = "Jump";
         }
         else if(onGround)
         {
            this.JumpLand();
         }
      }
      
      private function InkBoardGuide() : void
      {
         this.simpleGuide();
         onGround = false;
         onWallPlat = 0;
         this.checkAfterMove();
         this.inkboardPointer.x = this.x;
         this.inkboardPointer.y = this.y;
         this.inkboardPointer.rotation += rotCompare(wantRot,this.inkboardPointer.rotation) * 0.5 * Main.framin;
         if(this.inkboardPointer.rotation > 180)
         {
            this.inkboardPointer.rotation -= 360;
         }
         else if(this.inkboardPointer.rotation < -180)
         {
            this.inkboardPointer.rotation += 360;
         }
      }
      
      private function SlidePoleGuide() : void
      {
         this.spinRot += Math.abs(fakeRL) * 0.2 * framin;
         if(Math.floor(this.spinRot) + 1 > 85)
         {
            this.spinRot -= 40;
         }
         this.char.gotoAndStop(Math.floor(this.spinRot) + 1);
         if(this.spinRot > 18 && this.spinRot < 34 || this.spinRot > 46 && this.spinRot < 65)
         {
            this.head.scaleX = scaleX * -1;
         }
         else
         {
            this.head.scaleX = scaleX;
         }
         this.placeHead(this.char);
         this.y += moveUD * framin;
         rotation += rotter * framin;
         this.checkAfterMove();
         this.Vanity();
      }
      
      private function SkateboardGuide() : void
      {
         CheckAllAir();
         if(onGround || rotItems > 0)
         {
            if(this.char.currentFrame > 29)
            {
               this.char.gotoAndStop(4);
               this.hairGel = 122;
               this.head.gotoAndStop(122);
               this.placeHead(this.char);
            }
         }
         this.checkPit();
      }
      
      private function simpleGuide() : void
      {
         this.x += moveRL * framin;
         this.y += moveUD * framin;
         rotation += rotter * framin;
         CheckAllAutos(false);
      }
      
      public function clearStompedOn() : void
      {
         if(StompedOn != null)
         {
            StompedOn.stompingOn.splice(StompedOn.stompingOn.indexOf(this),1);
            StompedOn = null;
            if(Status == "Stomp")
            {
               if(gotoBuffer == "nothing")
               {
                  gotoBuffer = "Jump";
                  this.coreSwitchAnim();
               }
            }
         }
      }
      
      private function JumpLand() : void
      {
         if(wantRL * wallRot < 0 && Math.abs(wallRot) < 60 && !this.DownIsDown())
         {
            if(fakeRL * wantRL > 0)
            {
               fakeRL = cheatSpeed;
            }
            else
            {
               fakeRL *= 0.52112;
            }
            fakeUD = 0;
         }
         this.clearStompedOn();
         this.JumpLandFrame();
      }
      
      private function JumpLandFrame() : void
      {
         var tempN:uint = 0;
         if(Math.abs(rotter) > 20 && Boolean(rotter * (wallRot - rotation)))
         {
            rotation = wallRot - makeOne(rotter) * 100;
         }
         Achievements.clearTracked("Floor_Is_Lava");
         this.resetJumpStuff();
         this.slopeStuff(true);
         this.setIsTall(25);
         smokeN = 0;
         this.hairGel = 121;
         this.head.gotoAndStop(121);
         if(canStatus == "Grind")
         {
            if(landSpeed * 0.7 > Math.abs(moveRL))
            {
               fakeRL = landSpeed * makeOne(moveRL) * 0.7;
            }
            gotoBuffer = "GrindSlide";
         }
         else if(Status == "Hurt")
         {
            rotation = wallRot;
            Main.shakeScreen(5,0,true);
            if(health <= 0 || this.smashLives < 0)
            {
               Sounds.playSound("Land",this.x,landSpeed * 0.03,onRail);
               gotoBuffer = "Die";
            }
            else if(this.landQuick)
            {
               Sounds.playSound("Land",this.x,landSpeed * 0.03,onRail);
               gotoBuffer = "LandQuick";
               this.landQuick = false;
            }
            else if(this.landSlow)
            {
               Sounds.playSound("JustHurtLand",this.x,1,onRail);
               gotoBuffer = "LandSlow";
               this.landSlow = false;
            }
            else
            {
               Sounds.playSound("HurtLand",this.x,landSpeed * 0.03,onRail);
               gotoBuffer = "GetUp";
            }
         }
         else if(canStatus == "Hang")
         {
            fakeRL = moveRL;
            gotoBuffer = "Hang";
         }
         else if(Status == "ShootAir" && this.char.currentFrame < 10)
         {
            Status = "Shoot";
            tempN = uint(this.char.currentFrame);
            this.changeFrame("Shoot");
            this.char.gotoAndStop(tempN);
            this.placeHead(this.char);
            this.placePencil(this.char);
         }
         else if(Status == "PencilAir" && (!this.canMoveAgain(this.subStatus,this.char.currentFrame) || this.subStatus == "Charge1" || this.subStatus == "Charge2"))
         {
            this.pencilAirToGround();
         }
         else if(Status != "Skateboard")
         {
            if(Status == "FallCat")
            {
               gotoBuffer = "HoldCat";
            }
            else if(this.DownIsDown() && fakeRL * scaleX > -5 && wantRL * fakeRL > -0.5)
            {
               RotToAccel(wallRot);
               if(landSpeed > Math.abs(fakeRL))
               {
                  fakeRL = getSpeed(fakeRL,landSpeed * 0.8) * scaleX;
               }
               Sounds.playSound("Footstep",this.x,landSpeed * 0.03,onRail);
               gotoBuffer = "DownSlide";
            }
            else if(sliding)
            {
               this.runtoslide = true;
               Sounds.playSound("Land",this.x,landSpeed * 0.03,onRail);
               gotoBuffer = "Slide";
            }
            else if(wantRL * fakeRL > 0)
            {
               if(landSpeed > 5)
               {
                  this.justLanded = true;
               }
               Sounds.playSound("Land",this.x,landSpeed * 0.03,onRail);
               gotoBuffer = "Walk";
            }
            else
            {
               Sounds.playSound("Land",this.x,landSpeed * 0.03,onRail);
               gotoBuffer = "Land";
            }
         }
         if(gotoBuffer != "nothing")
         {
            this.stopAttacking();
            if(this.Slash != null)
            {
               if(this.Slash.parent != null)
               {
                  this.Slash.parent.removeChild(this.Slash);
               }
               this.Slash = null;
            }
         }
      }
      
      private function pencilAirToGround() : void
      {
         var tempN:uint = 0;
         var i:uint = 0;
         Status = "Pencil";
         tempN = uint(this.char.currentFrame);
         this.changeSubFrame(Status,this.subStatus);
         if(this.subStatus == "PokeDown")
         {
            this.stopAttacking();
            Main.shakeScreen(10,wallAngle,false);
            if(tempN > 6 || true)
            {
               this.char.gotoAndStop(6);
            }
            else
            {
               this.char.gotoAndStop(tempN);
            }
         }
         else
         {
            this.char.gotoAndStop(tempN);
         }
         this.placeHead(this.char);
         this.placePencil(this.char);
         for(i = 0; this.char["pencilFake" + i] != undefined; i++)
         {
            this.char["pencilFake" + i].visible = false;
         }
      }
      
      public function setMask(ex:*, ey:*, rot:*, scx:Number = 1, scy:Number = 1) : void
      {
         this.boxMask.x = ex;
         this.boxMask.y = ey;
         this.boxMask.rotation = rot;
         this.boxMask.scaleX = scx;
         this.boxMask.scaleY = scy;
         parent.mask = this.boxMask;
      }
      
      public function updateMask(ex:*, ey:*) : void
      {
         this.boxMask.x = ex;
         this.boxMask.y = ey;
      }
      
      public function enterBox(box:*, warp:*) : *
      {
         if(Status != "Jump" && Status != "Roll")
         {
            this.setIsTall(25);
            this.resetPencil();
            this.changeFrame("Jump");
            this.char.gotoAndStop("dropJump");
            this.char.char.gotoAndStop(3);
            this.placeHead(this.char.char);
            this.getRunningFloatUp();
         }
         Jumper = 0;
         gotoBuffer = "nothing";
         Status = "enterBox";
         this.inBox = box;
         this.outBox = warp;
         if(isTall > 15)
         {
            if(Math.abs(box.rotation) > 91)
            {
               wallRot = box.rotation + 180;
            }
            else
            {
               wallRot = box.rotation;
            }
         }
         this.setupVisibles(0);
         if(this.inBox.ItIs == "PortalBox")
         {
            Sounds.playSound("EnterBox",this.x,1,onRail);
         }
         else
         {
            Sounds.playSound("TearWrap",this.x,1,onRail);
         }
         this.CharEnterFrame = this.enterBoxEnterFrame;
         if(currentSound != null)
         {
            Sounds.stopSound(currentSound);
            currentSound = null;
         }
      }
      
      public function AllInBox(char:Char) : void
      {
         if(this.ID == char.ID)
         {
            return;
         }
         inVase = char.inVase;
         parent.x = char.parent.x;
         parent.y = char.parent.y;
         this.ratio = char.ratio;
         parent.scaleX = parent.scaleY = char.parent.scaleX;
         this.x = char.x - this.ID * 60;
         lastY = this.y = char.y;
         rotter = rotation = 0;
         fakeRL = moveRL = 0;
         hitPause = 15;
         Jumper = -20;
         scaleX = 1;
         onRail = char.onRail;
         platforms = char.platforms;
         walls = char.walls;
         ground = char.ground;
         gotoBuffer = "Jump";
      }
      
      public function exitBox(box:*, quickDrop:*) : *
      {
         if(box.Status == "vase")
         {
            Sounds.playSound("ExitBox",this.x,1,onRail);
            ay = 100;
         }
         this.outBox = box;
         this.smoothScroll = moveRL = moveUD = 0;
         this.smoothScrollX = RLx(this.smoothScroll);
         this.smoothScrollY = RLy(this.smoothScroll * 5 / 8);
         this.groundYUD = 0;
         Still = false;
         this.canQuickDrop = false;
         this.outBox.setChar(this);
         if(wantRL != 0)
         {
            this.head.scaleX = scaleX = makeOne(wantRL);
         }
         ay -= box.isTall + 50;
         if(ay < 0)
         {
            ay = 0;
         }
         ay *= -1;
         ay += box.isTall + 50;
         aUD *= -1;
         fakeUD = aUD;
         if(box.Status != "vase" && aUD < -25)
         {
            aRL = 0;
         }
         else if(Math.abs(box.rotation) < 12 && wantRL == 0)
         {
            if(Math.abs(box.rotation) < 6)
            {
               aRL = scaleX * 4;
            }
            else
            {
               aRL = makeOne(box.rotation) * 4;
            }
            moveRL = moveUD = angle = 0;
         }
         else
         {
            aRL = wantRL * 5;
         }
         if(box.Status != "door" && box.Status != "vase")
         {
            if(this.inBox.rotation * this.outBox.rotation > 0)
            {
               scaleX *= -1;
               this.head.scaleX *= -1;
            }
         }
         ax = -moveRL * 8;
         if(Math.abs(box.rotation) > 91)
         {
            rotation = box.rotation + 180;
         }
         else
         {
            rotation = box.rotation;
         }
         initialFloat = 0;
         if(this.terminalVelocity < 8)
         {
            FloatUp = this.terminalVelocity;
         }
         else
         {
            FloatUp = 8;
         }
         this.FloatLock = true;
         if(box.stayStraight)
         {
            angle = 0;
         }
         else
         {
            angle = box.rotation * this.quickRadian;
         }
         this.x = box.x + (Math.cos(angle) * ax - Math.sin(angle) * ay);
         this.y = box.y + (Math.cos(angle) * ay + Math.sin(angle) * ax);
         lastX = this.x;
         lastY = this.y;
         aPlat.resetplatSides(this.x,this.y,this);
         lastGround = "nothing";
         wallX = box.x;
         wallY = box.y;
         this.resetCamera();
         Main.lockShiftBack();
         if(!quickDrop)
         {
            this.changeRails(box.onRail,true,false);
         }
         if(box.tumble)
         {
            this.changeFrame("Hurt");
            this.char.gotoAndStop(1);
            this.placeHead(this.char);
            this.resetJumpStuff();
            this.FloatLock = true;
            rotter = -50;
         }
         else if(this.superTumble)
         {
            this.changeFrame("Hurt");
            this.char.gotoAndStop(1);
            this.placeHead(this.char);
            this.resetJumpStuff();
            this.FloatLock = true;
            rotter = 34;
         }
         else if(isTall > 15)
         {
            this.hairGel = 101;
            this.head.gotoAndStop(101);
            if(Status != "Jump")
            {
               this.resetPencil();
               this.changeFrame("Jump");
            }
            this.char.gotoAndStop("normal");
            this.char.char.gotoAndStop(1);
            this.placeHead(this.char.char);
            this.resetJumpStuff();
            this.FloatLock = true;
            rotter = moveRL * 1.5;
            if(Math.abs(rotter) > 15)
            {
               rotter = makeOne(rotter) * 15;
            }
         }
         if(CharN == 1)
         {
            if(box.waitN > 0)
            {
               rampN = box.waitN;
               parent.visible = false;
               this.CharEnterFrame = function():*
               {
                  if(rampN > 0)
                  {
                     --rampN;
                  }
                  else
                  {
                     if(superTumble)
                     {
                        scaleX *= -1;
                        head.scaleX *= -1;
                     }
                     if(outBox.ItIs == "PortalTear")
                     {
                        Sounds.playSound("TearWrap",x,1,onRail);
                     }
                     else if(outBox.ItIs == "PortalBox")
                     {
                        outBox.spring = 20;
                        if(staticInteractObjects.InteractEnterFrameArray.indexOf(outBox) == -1)
                        {
                           staticInteractObjects.InteractEnterFrameArray.push(outBox);
                        }
                     }
                     parent.visible = true;
                     CharEnterFrame = exitBoxEnterFrame;
                  }
               };
            }
            else if(Main.isOnStage(this.outBox.x,this.outBox.y,onRail) || Boolean(quickDrop))
            {
               if(this.outBox.ItIs == "PortalBox")
               {
                  this.outBox.spring = 20;
                  if(staticInteractObjects.InteractEnterFrameArray.indexOf(this.outBox) == -1)
                  {
                     staticInteractObjects.InteractEnterFrameArray.push(this.outBox);
                  }
               }
               this.CharEnterFrame = this.exitBoxEnterFrame;
            }
            else
            {
               this.head.alpha = alpha = 0;
               this.b = 60;
               if(Math.abs(box.x - Main.cameraX) < Main.stageXs[onRail] + 500 && Math.abs(box.y - Main.cameraY) < Main.stageYs[onRail] + 500)
               {
                  rampN = 0;
               }
               else
               {
                  rampN = 10;
               }
               this.CharEnterFrame = function():*
               {
                  if(b > 0)
                  {
                     --b;
                  }
                  if(Main.isOnStage(outBox.x,outBox.y,onRail) || b == 0)
                  {
                     if(rampN > 0)
                     {
                        --rampN;
                     }
                     else
                     {
                        if(outBox.ItIs == "PortalBox")
                        {
                           outBox.spring = 20;
                           if(staticInteractObjects.InteractEnterFrameArray.indexOf(outBox) == -1)
                           {
                              staticInteractObjects.InteractEnterFrameArray.push(outBox);
                           }
                        }
                        head.alpha = alpha = 1;
                        CharEnterFrame = exitBoxEnterFrame;
                     }
                  }
               };
            }
         }
         else
         {
            rampN = 10 * this.ID;
            this.CharEnterFrame = function():*
            {
               if(rampN > 0)
               {
                  --rampN;
               }
               else
               {
                  if(outBox.ItIs == "PortalBox")
                  {
                     outBox.spring = 20;
                     if(staticInteractObjects.InteractEnterFrameArray.indexOf(outBox) == -1)
                     {
                        staticInteractObjects.InteractEnterFrameArray.push(outBox);
                     }
                  }
                  CharEnterFrame = exitBoxEnterFrame;
               }
            };
         }
      }
      
      private function transOffset(ex:Number, ey:Number, rail:int, delay:int, eRL:Number, eUD:Number) : void
      {
         if(Math.abs(eRL) < 10)
         {
            eRL = makeOne(eRL) * 10;
         }
         if(delay < 0)
         {
            hitPause = 10;
         }
         else
         {
            hitPause = delay;
         }
         if(this.myTransLevelOffsetX != 0 || this.myTransLevelOffsetY != 0)
         {
            this.x = ex + this.myTransLevelOffsetX;
            this.y = ey + this.myTransLevelOffsetY;
            hitPause += this.myTransLevelOffsetDelay;
            this.myTransLevelOffsetDelay = 0;
            this.myTransLevelOffsetX = this.myTransLevelOffsetY = 0;
         }
         else
         {
            this.x = ex + eRL;
            this.y = ey + eUD;
            hitPause += 40 + this.ID * 5;
         }
         this.hideAll();
         this.CharEnterFrame = this.WaitAfterTransLevel;
         downTime = 10;
         onRail = this.toOnRail = -1;
         this.changeRails(rail);
         aPlat.resetplatSides(this.x,this.y,this);
         if(Math.abs(fakeRL) < 15 && Status != "Roll" || moveRL * eRL < 0)
         {
            if(onGround)
            {
               fakeRL = moveRL = makeOne(eRL) * (15 - this.ID * 2);
            }
            else
            {
               moveRL = makeOne(eRL) * (15 - this.ID * 2);
            }
         }
         this.temp = 0;
         if(onGround)
         {
            while(this.firstCircleCheck(footX(),footY(),moveUD))
            {
               this.y -= UDy(1);
               --this.temp;
            }
            while(this.firstCircleCheck(this.x - UDx(isTall),this.y - UDy(isTall),moveUD))
            {
               this.y += UDy(1);
               ++this.temp;
            }
            while(wallsHitTest(this.x,this.y + isTall))
            {
               --this.y;
               --this.temp;
            }
            while(wallsHitTest(this.x,this.y - isTall))
            {
               ++this.y;
               ++this.temp;
            }
            if(onGround)
            {
               if(Boolean(this.firstCircleCheck(this.x + UDx(isTall + 30),this.y + UDy(isTall + 30),moveUD)) || Boolean(this.firstCircleCheck(this.x + UDx(isTall + 30),this.y + UDy(isTall + 30) + 100,moveUD)) || Boolean(this.firstCircleCheck(this.x + UDx(isTall + 30),this.y + UDy(isTall + 30) + 200,moveUD)) || Boolean(this.firstCircleCheck(this.x + UDx(isTall + 30),this.y + UDy(isTall + 30) + 300,moveUD)))
               {
                  while(!this.firstCircleCheck(this.x + UDx(isTall + 1),this.y + UDy(isTall + 1),moveUD))
                  {
                     this.y += UDy(1);
                     ++this.temp;
                  }
               }
               if(wallsHitTest(this.x,this.y + isTall + 30))
               {
                  while(!wallsHitTest(this.x,this.y + isTall + 1))
                  {
                     ++this.y;
                     ++this.temp;
                  }
               }
            }
            if(Math.abs(this.temp) > 5)
            {
               trace("off by " + this.temp);
            }
         }
         lastX = this.x;
         lastY = this.y;
      }
      
      public function resetChar() : void
      {
         this.smoothScroll = 150 * scaleX;
         this.smoothScrollX = RLx(this.smoothScroll);
         this.smoothScrollY = RLy(this.smoothScroll);
         this.setIsTall(25);
         isWide = 15;
         maxRL = 20;
         alpha = this.head.alpha = 1;
         parent.mask = null;
         this.offScreenCounter = 100;
         this.justAttackQuick = this.justAttackHit = this.fromSlide = false;
         fakeRL = fakeUD = moveRL = moveUD = Jumper = 0;
         platRL = platUD = wallRL = wallUD = groundRL = groundUD = 0;
         rotation = wallRot = wallAngle = rotter = 0;
         downTime = hitPause = 0;
         this.superHurt = this.superStill = this.TempStillX = this.landQuick = false;
         this.resetJumpStuff();
         this.groundYUD = 0;
         this.toOnRail = -1;
         aPlatOn = aWallOn = null;
         resetOnPlatSides();
         this.hairGoTo = this.hairGel = 24;
         this.b = 0;
         this.myNode = this.smashDamage = 0;
         this.head.gotoAndStop(24);
         this.head.hair.gotoAndStop(1);
         this.head.head.gotoAndStop(1);
         this.resetPencil();
         this.enableControls();
         crossStatus = "nothing";
      }
      
      public function enableControls() : void
      {
         if(Main.localSettings.oneHanded)
         {
            this.CheckKeysDown = this.onehandedCheckKeysDown;
            this.CheckKeysUp = this.onehandedCheckKeysUp;
         }
         else
         {
            this.CheckKeysDown = this.twohandedCheckKeysDown;
            this.CheckKeysUp = this.twohandedCheckKeysUp;
         }
         this.hasGamepad = this.gamepadNum > -1;
      }
      
      public function resetCamera() : void
      {
         vOffset = this.toVOffset = Main.vOffset;
         this.zOffset = 0;
         this.smoothScroll = 150 * scaleX;
         this.smoothScrollX = RLx(this.smoothScroll);
         this.smoothScrollY = RLy(this.smoothScroll);
         if(Main.boundsShiftX + Main.boundsShiftY != 0)
         {
            Main.boundsShiftX = Main.boundsShiftY = 0;
            Main.MinX = Main.originalMinX;
            Main.MaxX = Main.originalMaxX;
            Main.MinY = Main.originalMinY;
            Main.MaxY = Main.originalMaxY;
         }
         if(Status == "enterBox")
         {
            this.groundY = wallY;
         }
         else
         {
            this.predictGround();
            if(tempY < this.y + isTall + Main.stageY)
            {
               this.groundY = tempY;
            }
            else
            {
               this.groundY = this.y + isTall;
            }
            wallY = footY();
         }
         this.groundYUD = 0;
         if(this.hasDoorIcon)
         {
            this.myDoorIcon.goSwim();
            this.myDoorIcon = null;
            this.hasDoorIcon = false;
         }
         staticInteractObjects.charCheckForCamera(this.x,this.y,isWide,isTall,onRail,this);
         vOffset = this.toVOffset;
         this.finishCamera();
      }
      
      private function realResetPencil(sound:Boolean = false) : void
      {
         if(this.pencilOut > 0 || sound)
         {
            Sounds.playSound("PenCharge",this.x,0.75,onRail);
         }
         this.stopAttacking();
         this.pencilOut = 0;
         if(this.charVector)
         {
            this.Pencil.visible = false;
         }
         else
         {
            StarlingBackgrounds.pencilVisible(false,this.ID);
         }
         if(this.Slash != null)
         {
            if(this.Slash.parent != null)
            {
               this.Slash.parent.removeChild(this.Slash);
            }
            this.Slash = null;
         }
      }
      
      private function showPencil(n:uint = 15) : void
      {
         if(this.pencilOut == 0)
         {
            Sounds.playSound("PenCharge",this.x,1,onRail);
         }
         this.pencilOut = n;
         if(this.charVector)
         {
            this.Pencil.visible = true;
         }
         else
         {
            StarlingBackgrounds.pencilVisible(true,this.ID);
         }
      }
      
      private function stopAttacking() : void
      {
         isAttacking = false;
         this.justHitArray = new Vector.<collision>(0);
      }
      
      private function givePen() : *
      {
         this.Pencil.parent.removeChild(this.Pencil);
         this.Pencil = null;
         this.Pencil = new rootPen();
         parent.addChild(this.Pencil);
      }
      
      private function takePen() : *
      {
         this.Pencil.parent.removeChild(this.Pencil);
         this.Pencil = null;
         this.Pencil = new rootPencil();
         parent.addChild(this.Pencil);
      }
      
      override public function canWallHang() : Boolean
      {
         if(Status == "PencilAir")
         {
            return false;
         }
         if(onWallPlat != 0)
         {
            if(!platWall)
            {
               return false;
            }
            if(onWallPlat * wantRL < -0.5)
            {
               return false;
            }
            if(onWallPlat * wantRL > 0.5)
            {
               return true;
            }
            if(this.wallJumped && this.onWallN > 0)
            {
               return true;
            }
            return false;
         }
         if(onWall != 0)
         {
            if(onWall * wantRL < -0.5)
            {
               return false;
            }
            if(almostPlat)
            {
               return false;
            }
            if(!(Boolean(wallsHitTest(this.x + isWide + 5,this.y - 35)) || Boolean(wallsHitTest(this.x - isTall - 5,this.y - 35))))
            {
               return false;
            }
            if(onWall * wantRL > 0.5)
            {
               return true;
            }
            if(this.wallJumped && this.onWallN > 0)
            {
               return true;
            }
            return false;
         }
         return false;
      }
      
      private function fallInPit() : *
      {
         if(Main.LevelStatus == "Smash")
         {
            this.resetChar();
            Sounds.playSound("Ow",this.x,0.4,onRail);
            rootHUD.updateCounter(0,-this.smashDamage,this.ID);
            --this.smashLives;
            if(this.smashLives > -1)
            {
               rootHUD.updateLives(this.ID,this.smashLives);
            }
            this.head.alpha = alpha = 0.5;
            downTime = 100;
            gotoBuffer = "Hurt";
            Status = "Disabled";
            moveUD = -20;
            FloatUp = 0;
            rotter = -scaleX * 20;
            this.x = staticInteractObjects.DoorArray[this.ID].x + staticInteractObjects.DoorArray[this.ID].scaleX * 25;
            this.y = staticInteractObjects.DoorArray[this.ID].y - isTall;
            scaleX = this.head.scaleX = staticInteractObjects.DoorArray[this.ID].scaleX;
            this.changeRails(staticInteractObjects.DoorArray[this.ID].onRail);
         }
         else
         {
            Main.parse_track("fallInPit",1);
            this.superHurtChar(30);
         }
      }
      
      public function disableChar() : void
      {
         wallX = this.x;
         wallY = this.y + isTall;
         Status = "Disabled";
         parent.visible = false;
         this.CharEnterFrame = function():*
         {
         };
         if(currentSound != null)
         {
            Sounds.updateSound(currentSound,this.x,0,onRail);
         }
      }
      
      override public function squish() : void
      {
         if(hitPause == 0)
         {
            this.hurtChar(20,20,5,0,0,false,true);
         }
      }
      
      public function charOutDoor(e:uint) : void
      {
         var door:Object = null;
         if(health <= 0)
         {
            return;
         }
         door = staticInteractObjects.DoorArray[e];
         door.alpha = 1;
         if(door.parent == null)
         {
            Backgrounds.backgroundsArray[door.onRail].addChild(door);
         }
         this.head.scaleX = scaleX = door.scaleX;
         FloatUp = initialFloat = 0;
         if(Main.gameMode == "vase")
         {
            Main.getOutOfBox();
            Main.gameMode = "level";
            Backgrounds.backgroundsArray[0].alpha = 1;
         }
         this.changeRails(door.onRail);
         this.resetChar();
         inBonus = Main.LoadIt.substr(0,5) == "Bonus" && Main.DirIt == "World 4" || Main.LevelStatus == "Race";
         if(door.ItIs == "PortalTear" || door.ItIs == "PortalBox")
         {
            Status = "enterBox";
            gotoBuffer = "nothing";
            if(Boolean(door.tumble) || this.superTumble)
            {
               this.changeFrame("Hurt");
            }
            else
            {
               this.changeFrame("Jump");
            }
            FloatUp = 0;
            ax = 0;
            ay = 100;
            aRL = 0;
            aUD = door.jumper;
            this.exitBox(door,true);
         }
         else
         {
            if(door.quickDrop)
            {
               alpha = this.head.alpha = 1;
               parent.mask = null;
               this.x = door.x - this.ID * 60 + (Char.CharN - 1) * 30;
               this.y = door.y - isTall;
               lastX = this.x;
               lastY = this.y;
               moveUD = 10;
               door.gotoAndStop("gone");
               visible = this.head.visible = true;
               if(door.startDisabled)
               {
                  gotoBuffer = "Disabled";
               }
               else if(door.jumper > 0)
               {
                  FloatUp = 6;
                  wallAngle = door.rotation * this.quickRadian;
                  if(Boolean(door.tumble) || Boolean(this.landSlow))
                  {
                     moveRL = Math.sin(wallAngle) * (door.jumper - this.ID);
                     moveUD = -Math.cos(wallAngle) * (door.jumper - this.ID);
                     gotoBuffer = "Hurt";
                  }
                  else
                  {
                     fakeRL = Math.sin(wallAngle) * (door.jumper - this.ID);
                     Jumper = Math.cos(wallAngle) * (door.jumper - this.ID);
                     gotoBuffer = "Jump";
                  }
                  wallAngle = wallRot = rotation = 0;
                  Still = true;
                  this.canQuickDrop = false;
                  if(door.delay > 0)
                  {
                     hitPause = door.delay;
                  }
                  this.x = door.x;
                  hitPause += this.ID * 5;
               }
               else if(Main.LoadIt == "Menus0-a" && Main.DoorIt == 1)
               {
                  gotoBuffer = "SitIntro";
               }
               else if(testAll(this.x,this.y + isTall + 10))
               {
                  gotoBuffer = "Idle";
               }
               else if(door.delay > 0)
               {
                  gotoBuffer = "Delay";
                  this.b = door.delay;
               }
               else
               {
                  if(Boolean(door.tumble) || Boolean(this.landSlow))
                  {
                     gotoBuffer = "Hurt";
                  }
                  else
                  {
                     gotoBuffer = "Jump";
                  }
                  Still = true;
               }
            }
            else
            {
               this.x = door.x + 40 * door.scaleX;
               this.y = door.y - isTall;
               door.gotoAndStop(2);
               gotoBuffer = "DoorOut";
            }
            theX = lastX = this.x;
            theY = lastY = this.y;
            aPlat.resetplatSides(this.x,this.y,this);
            lastGround = "nothing";
            this.warpDoor = door;
            if(this.charSetups[Main.LoadIt + "Setup"] != null)
            {
               this.charSetups[Main.LoadIt + "Setup"](this);
            }
            this.changeFrame(gotoBuffer);
            this.char.stop();
            Status = gotoBuffer;
            if(Status == "Jump" && Math.abs(fakeRL) > Jumper)
            {
               this.char.gotoAndStop("longJump");
               this.char.char.gotoAndStop(1);
               moveRL = fakeRL;
               moveUD = -Jumper;
            }
            else
            {
               this[gotoBuffer + "SetupFrame"]();
            }
            if(hitPause > 0)
            {
               this.hideAll();
               this.CharEnterFrame = this.WaitAfterTransLevel;
            }
            else
            {
               this.CharEnterFrame = this[gotoBuffer + "EnterFrame"];
            }
            gotoBuffer = "nothing";
            this.alreadyPredicted = false;
            this.resetCamera();
            this.Vanity(false);
         }
      }
      
      internal function resetJumpStuff() : *
      {
         this.lastBouncedY = -10000;
         bounce = 0;
         this.terminalVelocity = oldFakeUD = this.fliprot = Jumper = 0;
         this.canQuickDrop = false;
         this.canZip = true;
         this.toOnRail = -1;
         if(!this.superStill)
         {
            Still = this.FloatLock = this.FloatStill = false;
         }
         this.canAutoLook = true;
         this.wallJumped = false;
         wallHanging = false;
         dontLand = false;
         this.justAttackHit = false;
         this.cameraYUD = 0;
         bounceThresh = 50;
      }
      
      public function changeRails(rail:*, syncz:Boolean = true, visibles:Boolean = true) : void
      {
         var depth:uint = 0;
         if(rail != onRail)
         {
            StarlingBackgrounds.ArrangeBackgrounds(rail,this.ID);
            parent.parent.addChild(parent);
            depth = uint(Backgrounds.backgroundsArray[rail].parent.getChildIndex(Backgrounds.backgroundsArray[rail]));
            parent.parent.addChildAt(parent,depth + 1);
            onRail = rail;
            if(syncz)
            {
               this.cameraZ = Main.backgroundZs[onRail];
            }
            setGroundRail();
            StarlingBackgrounds.setBlur(rail);
         }
         if(visibles)
         {
            this.setupVisibles(rail);
         }
      }
      
      public function setupVisibles(rail:*) : void
      {
         this.charVector = rail == 0 && !this.forcingBitmap;
         if(this.charVector)
         {
            parent.visible = true;
            StarlingBackgrounds.charVisible(false,this.ID);
            StarlingBackgrounds.pencilVisible(false,this.ID);
         }
         else
         {
            parent.visible = false;
            StarlingBackgrounds.charVisible(true,this.ID);
         }
      }
      
      override public function hideAll() : void
      {
         parent.visible = false;
         StarlingBackgrounds.charVisible(false,this.ID);
         StarlingBackgrounds.pencilVisible(false,this.ID);
      }
      
      public function toggleForceBitmap(e:Boolean) : void
      {
         if(this.forcingBitmap != e)
         {
            this.forcingBitmap = e;
            this.setupVisibles(0);
            this.Vanity(true);
         }
      }
      
      private function tiltChar() : *
      {
         if(Math.abs(rotation - wallRot) > 180)
         {
            if(wallRot > rotation)
            {
               wallRot -= 360;
            }
            else
            {
               wallRot += 360;
            }
         }
         rotter = (wallRot - rotation) / 3;
      }
      
      private function rightChar() : *
      {
         rotter += (-rotation * 0.4 - rotter) * 0.2;
         rotter *= 0.8;
      }
      
      public function charSpringBounce() : *
      {
         spring += (isTall * 2 - springTall) / springy;
         spring *= 0.6;
         springTall += spring;
      }
      
      public function charMoveSpringBounce() : *
      {
         if(springTall / (isTall * 2) < 0.4)
         {
            springTall = isTall * 2 * 0.4;
            spring = 0;
         }
         else if(springTall / (isTall * 2) > 2)
         {
            springTall = isTall * 2 * 2;
            spring = 0;
         }
         this.char.scaleY = springTall / (isTall * 2);
         this.char.scaleX = isTall * 2 / springTall;
         if(Status != "Roll" && Status != "Duck")
         {
            this.char.y = isTall - springTall * 0.5;
            this.head.scaleY = this.char.scaleY;
            this.head.scaleX = this.char.scaleX * makeOne(this.head.scaleX);
         }
      }
      
      private function checkPit() : Boolean
      {
         if(Main.gameMode == "vase")
         {
            if(this.y < -(Main.relativeStageY + 50) && moveUD < 0)
            {
               if(Sounds.musicPlaying == "Cave_Wah")
               {
                  Sounds.fadeOutMusic("Cave_Mystery",0.2);
               }
               Main.exitVase(this);
            }
         }
         else if(onRail >= 0)
         {
            if(Main.checkPitY(this.y,onRail,this.ratio))
            {
               if(Main.DirIt == "World 1" && Main.LoadIt == "Level3" && false)
               {
                  Sounds.playSound("Ow",this.x,0.5,onRail);
                  Main.quickResetLevel = true;
               }
               else
               {
                  this.fallInPit();
               }
               return true;
            }
         }
         return false;
      }
      
      public function placePencil(e:*) : *
      {
         if(e.pencil == undefined)
         {
            trace("no pencil");
            trace(e);
            trace(e.currentFrame);
         }
         else
         {
            if(this.pencilOut > 0)
            {
               this.pencilX = e.pencil.x * scaleX;
               this.pencilY = e.pencil.y;
               this.pencilRot = e.pencil.rotation * scaleX;
               this.Pencil.scaleY = e.pencil.scaleY;
            }
            e.pencil.visible = false;
         }
      }
      
      private function setIsTall(e:*) : *
      {
         if(isTall != e)
         {
            if(onGround || almostGround || almostPlat)
            {
               this.x += UDx(isTall - e);
               this.y += UDy(isTall - e);
            }
            else
            {
               this.x += rotX(e - isTall,rotation);
               this.y += rotY(e - isTall,rotation);
            }
            springTall *= e / isTall;
            isTall = e;
         }
      }
      
      public function cameraEnterFrame() : Boolean
      {
         var temp:Boolean = false;
         var temp1:Number = NaN;
         var temp2:Number = NaN;
         var temp3:Number = NaN;
         var temp4:Number = NaN;
         if(Status == "Roll")
         {
            if(onGround || rotItems > 0)
            {
               this.groundYUD = (wallY - this.groundY) * Math.abs((wallY - this.groundY) / 800);
            }
            else
            {
               this.predictGround();
            }
            temp = false;
         }
         else if(Status == "enterBox")
         {
            this.groundYUD += ((wallY - this.groundY) * 0.1 - this.groundYUD) * 0.05;
         }
         else if(Status == "Hang")
         {
            this.groundYUD += ((this.y + isTall + 100 - (80 - vOffset) + moveUD * 8 - this.groundY) * 0.2 - this.groundYUD) * 0.5;
            this.groundYUD *= 0.9;
            temp = true;
         }
         else if(Status == "SlidePole")
         {
            this.groundYUD += ((this.y + 200 - (80 - vOffset) + moveUD * 8 - this.groundY) * 0.5 - this.groundYUD) * 0.5;
            this.groundYUD *= 0.9;
            temp = false;
         }
         else if(Status == "InkBoard")
         {
            if(Math.abs(this.lastInkboardRot) < 8)
            {
               if(this.cameraThresh < 30)
               {
                  this.cameraThresh += 10;
               }
            }
            else if(this.cameraThresh > 0)
            {
               this.cameraThresh -= 5;
            }
            if(Math.abs(this.cameraThresh) > 20)
            {
               if(this.strictFade < 1.5708)
               {
                  this.strictFade += 0.1;
               }
               else
               {
                  this.strictFade = 1.5708;
               }
            }
            else if(this.strictFade > -1.5708)
            {
               this.strictFade -= 0.1;
            }
            else
            {
               this.strictFade = -1.5708;
            }
            temp1 = (this.y + 130 - (80 - vOffset) + moveUD * 15 - this.groundY) * 1;
            temp2 = (this.y - this.groundY) * Math.abs((this.y - this.cameraY) / 800);
            this.groundYUD = (temp1 * this.fadeCurve(this.strictFade) + temp2 * (1 - this.fadeCurve(this.strictFade)) - this.groundYUD) * 0.5;
            this.tiltChar();
            temp = false;
         }
         else if(Status == "Jump" || Status == "Kick" || Status == "Hurt" || Status == "FallCat" || Status == "exitBox" || Status == "Skateboard" || Status == "PencilAir" || Status == "ShootAir" || Status == "SlidePole")
         {
            if(wallHanging)
            {
               this.groundYUD = (this.y + 50 + (moveUD + platUD) * 15 - this.groundY) * 0.05;
               if(Math.abs(this.groundYUD) > Math.abs(moveUD + platUD) + 10)
               {
                  this.groundYUD *= (Math.abs(moveUD + platUD) + 10) / Math.abs(this.groundYUD);
               }
            }
            else
            {
               this.predictGround();
            }
            temp = false;
         }
         else if(Status == "ZipAir" || Status == "Disabled")
         {
            this.groundYUD *= 0.25;
            temp = false;
         }
         else if(Status == "Fly")
         {
            this.groundYUD = (this.y + 800 - this.groundY) / 15;
         }
         else if(Status == "Grabbed")
         {
            this.groundYUD = this.y - this.groundY;
         }
         else
         {
            if(Math.abs(wallRot) > 45)
            {
               this.cameraThresh = 30;
            }
            else if(Math.abs(moveUD) > 5)
            {
               if(this.cameraThresh < 40)
               {
                  this.cameraThresh += 2;
               }
            }
            else if(this.cameraThresh > 0)
            {
               this.cameraThresh -= 5;
            }
            if(Math.abs(this.cameraThresh) > 20)
            {
               if(this.strictFade < 1.5708)
               {
                  this.strictFade += 0.1;
               }
               else
               {
                  this.strictFade = 1.5708;
               }
            }
            else if(this.strictFade > -1.5708)
            {
               this.strictFade -= 0.1;
            }
            else
            {
               this.strictFade = -1.5708;
            }
            temp3 = this.y + isTall + vOffset + moveUD * 5 - this.groundY;
            temp4 = (wallY - this.groundY) * Math.abs((this.y - 40 - this.cameraY) / 800);
            this.groundYUD = temp3 * this.fadeCurve(this.strictFade) + temp4 * (1 - this.fadeCurve(this.strictFade));
            this.alreadyPredicted = false;
            temp = true;
            if(!temp)
            {
               this.cameraThresh = 0;
            }
         }
         if(Main.gameMode == "vase")
         {
            this.groundYUD = 0;
         }
         return temp;
      }
      
      private function fadeCurve(n:Number) : Number
      {
         return (Math.sin(this.strictFade) + 1) / 2;
      }
      
      public function cameraStuff() : void
      {
         var temp:Number = NaN;
         var wRL:Number = NaN;
         if(wallRot == 0)
         {
            temp = moveRL + platRL + wallRL + groundRL;
         }
         else
         {
            temp = fakeRL + platRL + wallRL + groundRL;
         }
         wRL = Math.abs(wantRL);
         if(Status == "InkBoard")
         {
            if(Math.abs(this.lastInkboardRot) < 8)
            {
               this.smoothScroll = moveRL * 15;
            }
            else
            {
               this.smoothScroll = 0;
            }
            tempRL = this.smoothScroll - this.smoothScrollX;
            tempUD = -this.smoothScrollY;
            this.smoothScrollX += tempRL * 0.2 * framin;
            this.smoothScrollY += tempUD * 0.2 * framin;
         }
         else if(Status == "SlidePole")
         {
            this.smoothScroll += (wantRL * 150 - this.smoothScroll) * 0.2 * framin;
            this.smoothScrollX = RLx(this.smoothScroll);
            this.smoothScrollY = RLy(this.smoothScroll * 5 / 8);
         }
         else
         {
            if(wallHanging)
            {
               this.smoothScroll += (-onWall * 75 - this.smoothScroll) / 5 * framin;
               this.smoothScrollX = RLx(this.smoothScroll);
            }
            else if(Status == "Jump" && this.willBeOnWall != 0 && (Math.abs(temp) > 10 && this.hitGround < 20 || this.wallJumped))
            {
               this.smoothScroll += (-this.willBeOnWall * 75 - this.smoothScroll) / (this.hitGround + 3) * framin;
               this.smoothScrollX = RLx(this.smoothScroll);
            }
            else if(Math.abs(temp) < 10)
            {
               if(onGround || Status == "LedgeHang")
               {
                  this.smoothScroll += (scaleX * 150 - this.smoothScroll) * 0.03 * framin;
                  if(this.smoothScroll * temp < 0 || Math.abs(this.smoothScroll) < 200)
                  {
                     this.smoothScroll += temp * 3 * wRL * framin;
                  }
               }
               else
               {
                  this.smoothScroll += (scaleX * 150 - this.smoothScroll) * 0.02 * framin;
               }
            }
            else if(onGround)
            {
               this.smoothScroll += (makeOne(temp) * 150 + temp * 10 - this.smoothScroll) * 0.2 * framin;
               if(this.smoothScroll * temp < 0 || Math.abs(this.smoothScroll) < 200)
               {
                  this.smoothScroll += temp * 1.5 * wRL * framin;
               }
            }
            else
            {
               this.smoothScroll += (makeOne(temp) * 150 + temp * 10 - this.smoothScroll) * 0.2 * framin;
            }
            tempRL = RLx(this.smoothScroll) - this.smoothScrollX;
            tempUD = RLy(this.smoothScroll * 5 / 8) - this.smoothScrollY;
            if(onGround)
            {
               if(Math.abs(tempRL) > 10 + Math.abs(temp * 3 * wRL))
               {
                  tempRL *= (10 + Math.abs(temp * 3 * wRL)) / Math.abs(tempRL);
               }
               if(Math.abs(moveUD) > 5 && false)
               {
                  tempUD = (vOffset + makeOne(moveUD) * 200 + moveUD * 10 - this.smoothScrollY) * 0.2;
                  if(Math.abs(tempUD) > 20)
                  {
                     tempUD = makeOne(tempUD) * 20;
                  }
               }
               else if(true || Math.abs(wallRot) < 60)
               {
                  if(Math.abs(tempUD) > Math.abs(tempRL * 0.2) + 1)
                  {
                     tempUD *= (Math.abs(tempRL * 0.2) + 1) / Math.abs(tempUD);
                  }
               }
               else if(Math.abs(tempUD) > Math.abs(moveUD * 2))
               {
                  tempUD *= Math.abs(moveUD * 2) / Math.abs(tempUD);
               }
            }
            else
            {
               if(Math.abs(tempRL) > 10 + Math.abs(temp * 3 * wRL))
               {
                  tempRL *= (10 + Math.abs(temp * 3 * wRL)) / Math.abs(tempRL);
               }
               if(Math.abs(tempUD) > Math.abs(this.groundYUD))
               {
                  tempUD *= Math.abs(this.groundYUD) / Math.abs(tempUD);
               }
            }
            this.smoothScrollX += tempRL * framin;
            this.smoothScrollY += tempUD * framin;
         }
         if(vOffset != this.toVOffset)
         {
            if(Math.abs(vOffset - this.toVOffset) < 10)
            {
               vOffset = this.toVOffset;
            }
            else
            {
               vOffset += (this.toVOffset - vOffset) / Math.abs(this.toVOffset - vOffset) * 10;
            }
         }
         if(this.canAutoLook && false)
         {
            tempY = 0;
            this.canAutoLookX = 0;
            while(Math.abs(this.canAutoLookX) < 300)
            {
               if(this.x + this.canAutoLookX + 40 * scaleX < Main.MinX / Main.stageRatios[onRail] || this.x + this.canAutoLookX + 40 * scaleX > Main.MaxX / Main.stageRatios[onRail])
               {
                  break;
               }
               this.canAutoLookX += 40 * scaleX;
               while(testAll(this.x + this.canAutoLookX,this.groundY + this.smoothScrollY + tempY))
               {
                  if(tempY <= -300)
                  {
                     break;
                  }
                  tempY -= 20;
               }
               if(tempY <= -300)
               {
                  break;
               }
            }
            tempY = -200;
            while(this.smoothScrollY + tempY - vOffset < 50 && !testAll(this.x + this.canAutoLookX,this.groundY + this.smoothScrollY + tempY))
            {
               tempY += 40;
            }
            if(tempY < 0)
            {
               if(tempY < -150)
               {
                  tempY += 150;
                  tempY *= 1.5;
               }
               else
               {
                  tempY = 0;
               }
            }
         }
         else if(platUD != 0)
         {
            if(aPlatOn != null && aPlatOn.Status != "Mushy")
            {
               tempY = platUD * 20 * this.ratio;
            }
            else
            {
               tempY = 0;
            }
         }
         else
         {
            tempY = 0;
         }
         this.smoothScrollUD += (tempY - this.smoothScrollUD) / 20 * framin;
         this.finishCamera();
      }
      
      private function finishCamera() : *
      {
         var tempY:Number = NaN;
         if(onRail == 0)
         {
            if(this.ratio < 0.1)
            {
               this.ratio = 0.1;
            }
            this.cameraX = this.x + this.smoothScrollX / this.ratio;
            if(this.ratio > 1)
            {
               tempY = this.smoothScrollY + this.smoothScrollUD / this.ratio - vOffset / this.ratio;
            }
            else
            {
               tempY = this.smoothScrollY + this.smoothScrollUD - vOffset;
            }
         }
         else
         {
            this.cameraX = this.x + this.smoothScrollX;
            tempY = this.smoothScrollY + this.smoothScrollUD - vOffset;
         }
         this.cameraY = this.groundY - isTall + tempY;
         camDistR = 400 + this.smoothScrollX;
         camDistL = 400 - this.smoothScrollX;
         camDistU = 150 - tempY;
         camDistD = 150 + tempY;
      }
      
      public function saveCustom() : *
      {
         var changeColor:Boolean = false;
         var temp:Boolean = false;
         if(this.ID == 0)
         {
            changeColor = this.colorN == this.pantsN != (Main.localSettings.colorN == Main.localSettings.pantsN) && Boolean(Main.localSettings.canColor);
            if(this.pantsN != Main.localSettings.pantsN)
            {
               this.changePants(this.pantsN);
               temp = true;
            }
            if(this.hatN != Main.localSettings.hatN)
            {
               this.changeHat(this.hatN);
               temp = true;
            }
            if(this.patternN != Main.localSettings.patternN)
            {
               this.changePattern(this.patternN);
               temp = true;
            }
            if(this.colorN != Main.localSettings.colorN || changeColor)
            {
               this.changePatternColor(this.colorN);
               temp = true;
            }
            if(temp)
            {
               Main.parse_saveSettings();
            }
         }
      }
      
      public function editSaveString(str:*, e:*) : *
      {
         for(var temp:String = null; Main.localSettings["has" + str + "String"].substr(e,1) == ""; )
         {
            Main.localSettings["has" + str + "String"] += "n";
         }
         if(Main.localSettings["has" + str + "String"].substr(e,1) == "n")
         {
            temp = "";
            temp += Main.localSettings["has" + str + "String"].substr(0,e);
            temp += "y";
            temp += Main.localSettings["has" + str + "String"].substr(e + 1);
            Main.localSettings["has" + str + "String"] = temp;
         }
         countUnlockables(str);
      }
      
      public function changeControls(e:String) : void
      {
         this.CheckKeysDown = this[e + "CheckKeysDown"];
         this.CheckKeysUp = this[e + "CheckKeysUp"];
      }
      
      public function disableControls() : void
      {
         this.resetAllControls();
         this.quickAttack = false;
         this.hasGamepad = false;
         this.CheckKeysDown = function():void
         {
         };
         this.CheckKeysUp = function():void
         {
         };
      }
      
      public function changeHat(e:*) : *
      {
         this.doChangeHat(e);
         if(Main.localSettings.hatN != e)
         {
            Main.localSettings.hatN = e;
            if(e > 0)
            {
               this.editSaveString("Hats",e - 1);
            }
         }
      }
      
      public function changePants(e:*) : *
      {
         this.doChangePants(e);
         if(Main.localSettings.pantsN != e)
         {
            Main.localSettings.pantsN = e;
            if(e > 3)
            {
               this.editSaveString("Pants",e - 4);
            }
         }
      }
      
      public function changePattern(e:*) : *
      {
         this.doChangePattern(e);
         if(Main.localSettings.patternN != e)
         {
            Main.localSettings.patternN = e;
            if(e > 0)
            {
               this.editSaveString("Patterns",e - 1);
            }
         }
      }
      
      public function changePatternColor(e:*) : *
      {
         if(Main.localSettings.patternN > 0)
         {
            this.doChangePatternColor(e);
            StarlingEffect.Spawn("popEffect",this.x,this.y,Math.random() * 3,1.5,0,0,onRail);
            Main.shakeScreen(3,0,true);
         }
      }
      
      public function doChangePants(e:int, shine:Boolean = true) : *
      {
         if(this.pantsN != e)
         {
            this.pantsN = e;
            if(shine)
            {
               StarlingEffect.Spawn("popEffect",this.x,this.y,Math.random() * 3,1.5,0,0,onRail);
               Main.shakeScreen(3,0,true);
            }
            if(e > -1 && this.patternN > 0)
            {
               this.doChangePattern(0,false);
            }
            if(this.pantsN == -1)
            {
               this.transform.colorTransform = new ColorTransform();
            }
            else
            {
               this.transform.colorTransform = Main.getColorTransform(e);
            }
            rootHUD.HUD.barBitmapDatas[this.ID].fillRect(new Rectangle(0,0,rootHUD.HUD.barBitmapDatas[this.ID].width,rootHUD.HUD.barBitmapDatas[this.ID].height),Main.pantsToHex(e));
            this.Vanity(true);
            this.drawPantsIcon();
         }
      }
      
      public function resetAllVanity() : void
      {
         parent.transform.colorTransform = Main.getColorTransform(-1);
      }
      
      public function shadowVanity() : void
      {
         parent.transform.colorTransform = Main.getColorTransform(12);
      }
      
      public function textureOnBar(e:*) : *
      {
         this.pantsTextures.mask = null;
         if(e < 3 && false)
         {
            rootHUD.HUD.barBitmapDatas[this.ID].drawWithQuality(this.pantsTextures,new Matrix(3,0,0,3,75,-70),this.pantsTextures.transform.colorTransform,null,null,true,StageQuality.BEST);
            rootHUD.HUD.barBitmapDatas[this.ID].drawWithQuality(this.pantsTextures,new Matrix(3,0,0,3,212,-50),this.pantsTextures.transform.colorTransform,null,null,true,StageQuality.BEST);
         }
         else if(this.pantsTextures.currentFrame == 5 || this.pantsTextures.currentFrame == 6 || this.pantsTextures.currentFrame == 13)
         {
            rootHUD.HUD.barBitmapDatas[this.ID].drawWithQuality(this.pantsTextures,new Matrix(8 * (healthMax * 0.01),0,0,8,110 * (healthMax * 0.01),-130),this.pantsTextures.transform.colorTransform,null,null,true,StageQuality.BEST);
         }
         else
         {
            rootHUD.HUD.barBitmapDatas[this.ID].drawWithQuality(this.pantsTextures,new Matrix(8,0,0,8,150,-130),this.pantsTextures.transform.colorTransform,null,null,true,StageQuality.BEST);
            rootHUD.HUD.barBitmapDatas[this.ID].drawWithQuality(this.pantsTextures,new Matrix(8,0,0,8,550,-130),this.pantsTextures.transform.colorTransform,null,null,true,StageQuality.BEST);
         }
         this.pantsTextures.mask = this.charmap;
      }
      
      public function doChangeHat(e:int, shine:Boolean = true) : *
      {
         if(this.hatN != e)
         {
            if(shine)
            {
               StarlingEffect.Spawn("popEffect",this.head.x,this.head.y - 8,Math.random() * 3,1.5,0,0,onRail);
               Main.shakeScreen(3,0,true);
            }
            parent.removeChild(this.head);
            if(e == 0)
            {
               this.head = new masterHead();
            }
            else if(this.hatN == 0)
            {
               this.head = new masterHatHead();
            }
            parent.addChild(this.head);
            this.head.scaleX = scaleX;
            this.setupHat(e);
            this.hatN = e;
            this.hairGuide();
            this.Vanity(true);
         }
      }
      
      public function doChangePattern(e:int, shine:Boolean = true) : *
      {
         if(this.patternN != e)
         {
            if(shine)
            {
               StarlingEffect.Spawn("popEffect",this.x,this.y,Math.random() * 3,1.5,0,0,onRail);
               Main.shakeScreen(3,0,true);
            }
            rootHUD.HUD.barBitmapDatas[this.ID].fillRect(new Rectangle(0,0,rootHUD.HUD.barBitmapDatas[this.ID].width,rootHUD.HUD.barBitmapDatas[this.ID].height),Main.pantsToHex(this.pantsN));
            if(e > 0 && this.pantsN > -1)
            {
               this.doChangePants(-1,false);
            }
            if(e > 0)
            {
               if(this.patternN == 0)
               {
                  this.setupPattern();
               }
               this.pantsTextures.gotoAndStop(e);
               this.textureOnBar(e);
            }
            else if(this.patternN > 0 && e == 0)
            {
               parent.removeChild(this.maskContainer);
               this.charbit.dispose();
               this.maskContainer.removeChild(this.pantsTextures);
            }
            this.patternN = e;
            this.Vanity(true);
            this.drawPantsIcon(e);
         }
      }
      
      public function setupPattern() : *
      {
         this.charbit = new BitmapData(100,140,true,0);
         this.charmap = new Bitmap(this.charbit);
         this.maskContainer = new Sprite();
         parent.addChild(this.maskContainer);
         this.charmap.x = -25;
         this.charmap.y = -30;
         this.charmap.scaleX = this.charmap.scaleY = 0.5;
         this.charmap.smoothing = true;
         this.maskContainer.addChild(this.charmap);
         this.pantsTextures = new pantsTexture();
         this.maskContainer.addChild(this.pantsTextures);
         this.pantsTextures.cacheAsBitmap = true;
         this.charmap.cacheAsBitmap = true;
         this.pantsTextures.mask = this.charmap;
         if(Main.localSettings.canColor)
         {
            if(this.colorN == this.pantsN)
            {
               this.pantsTextures.transform.colorTransform = new ColorTransform();
            }
            else
            {
               this.pantsTextures.transform.colorTransform = Main.getColorTransform(this.colorN);
            }
         }
      }
      
      public function doChangePatternColor(e:*) : *
      {
         if(e == this.pantsN)
         {
            this.pantsTextures.transform.colorTransform = new ColorTransform();
         }
         else
         {
            this.pantsTextures.transform.colorTransform = Main.getColorTransform(e);
         }
         StarlingEffect.Spawn("popEffect",this.x,this.y,Math.random() * 3,1.5,0,0,onRail);
         Main.shakeScreen(3,0,true);
         this.textureOnBar(this.patternN);
         this.drawPantsIcon(this.patternN);
         this.colorN = e;
      }
      
      public function drawPantsIcon(e:int = -1) : *
      {
         if(e == -1)
         {
            e = this.patternN;
         }
         PauseIconCache.stamp.gotoAndStop(2);
         PauseIconCache.stamp.pants.transform.colorTransform = this.transform.colorTransform;
         PauseIconCache.stamp.pants.alpha = 1;
         if(e > 0)
         {
            PauseIconCache.stamp.pattern.visible = true;
            PauseIconCache.stamp.pattern.gotoAndStop(e);
            PauseIconCache.stamp.pattern.transform.colorTransform = this.pantsTextures.transform.colorTransform;
         }
         else
         {
            PauseIconCache.stamp.pattern.gotoAndStop(1);
            PauseIconCache.stamp.pattern.visible = false;
         }
         rootHUD.HUD.iconBitmapDatas[this.ID].drawWithQuality(PauseIconCache.stamp,new Matrix(0.8,0,0,0.8,27,24),null,null,null,true,StageQuality.BEST);
      }
      
      public function updateMaxHealth() : void
      {
         var i:uint = 0;
         healthMax += 20;
         health += 20;
         if(this.patternN > 0)
         {
            this.textureOnBar(this.patternN);
         }
         for(i = 0; i < CharN; i++)
         {
            rootHUD.upgradeHealth(i,health,healthMax);
         }
      }
      
      public function updatePower() : void
      {
         ++powerLevel;
         power = 1 + powerLevel * 0.5;
         if(rootHUD.myUpgradePanel != null)
         {
            rootHUD.myUpgradePanel.updatePowerText(power);
         }
      }
      
      public function unlockBuzzSaw() : void
      {
         this.canBuzzSaw = true;
         Main.saveProgress("canBuzzSaw",true);
         this.checkAllMoves();
      }
      
      public function unlockPokeDown() : void
      {
         this.canPokeDown = true;
         Main.saveProgress("canPokeDown",true);
         this.checkAllMoves();
      }
      
      public function unlockRising() : void
      {
         this.canRising = true;
         Main.saveProgress("canRising",true);
         this.checkAllMoves();
      }
      
      private function checkAllMoves() : void
      {
         var n:uint = 0;
         if(Boolean(this.canBuzzSaw) && Boolean(this.canPokeDown) && Boolean(this.canRising))
         {
            Achievements.unlock("Fanciest_Fighter");
         }
         n = 0;
         if(this.canBuzzSaw)
         {
            n++;
         }
         if(this.canPokeDown)
         {
            n++;
         }
         if(this.canRising)
         {
            n++;
         }
         Achievements.SendScore("movesLearned",n);
      }
      
      private function setupVanity() : *
      {
         this.charBitmap = new BitmapData(133 * this.charRes,140 * this.charRes,true,0);
         StarlingBackgrounds.setupCharStarling(this.charRes,this.ID);
         if(hasPencil)
         {
            if(hasPen)
            {
               this.Pencil = new rootPen();
            }
            else
            {
               this.Pencil = new rootPencil();
            }
            parent.addChild(this.Pencil);
            this.Pencil.visible = false;
            StarlingBackgrounds.pencilVisible(false,this.ID);
            this.pencilBitmap = new BitmapData(15,120,true,0);
            this.pencilBitmap.drawWithQuality(this.Pencil,new Matrix(1.5,0,0,1.5,7,90),null,null,null,true,StageQuality.BEST);
            StarlingBackgrounds.pressPencilBitmap(this.pencilBitmap,this.ID);
         }
         if(this.ID == 0)
         {
            this.pantsN = Main.localSettings.pantsN;
            this.hatN = Main.localSettings.hatN;
            this.patternN = Main.localSettings.patternN;
            if(Main.localSettings.canColor)
            {
               this.colorN = Main.localSettings.colorN;
            }
            if(Main.localSettings.patternN)
            {
               this.setupPattern();
               this.pantsTextures.gotoAndStop(this.patternN);
            }
         }
         else
         {
            this.pantsN = this.ID;
            this.hatN = 0;
            this.patternN = 0;
         }
         transform.colorTransform = Main.getColorTransform(this.pantsN);
         parent.addChild(this.inkboardPointer);
         this.inkboardPointer.visible = false;
         transform.colorTransform = Main.getColorTransform(this.pantsN);
         parent.addChild(this.inkboardPointer);
         this.inkboardPointer.visible = false;
         if(this.hatN > 0)
         {
            this.head = new masterHatHead();
            parent.addChild(this.head);
            this.setupHat(Main.localSettings.hatN);
         }
         else
         {
            this.head = new masterHead();
            parent.addChild(this.head);
         }
      }
      
      private function setupHat(e:*) : void
      {
         if(e > 0)
         {
            this.head.hat.gotoAndStop(e);
            this.head.hat.x = 0;
            this.head.hat.y = -6;
            this.head.hat.rotation = 0;
            this.hatSym = false;
            if(this.hatSym)
            {
               this.head.hat.scaleX = this.head.scaleX;
            }
            else
            {
               this.head.hat.scaleX = 1;
            }
            if(e == 15 || e == 16)
            {
               this.hatEffect = this.hatSanta;
            }
            else if(e == 30)
            {
               this.hatEffect = this.hatBubble;
            }
            else if(e == 31)
            {
               this.hatEffect = this.hatFire;
            }
            else if(e == 3)
            {
               this.hatEffect = this.hatFlap;
            }
            else
            {
               this.hatEffect = function():*
               {
               };
            }
            if(Main.LevelLoaded == "Lockd3")
            {
               this.head.transform.colorTransform = Main.getColorTransform(-1);
            }
         }
         else
         {
            this.hatEffect = function():*
            {
            };
         }
      }
      
      public function damageChar(ow:Number) : void
      {
         if(isSmash)
         {
            this.smashDamage += ow / 3;
            rootHUD.updateCounter(this.smashDamage,ow / 3,this.ID);
         }
      }
      
      override public function smashKnockback(knockback:Number, hit:Number = 0) : Number
      {
         if(hit == 0)
         {
            hit = knockback;
         }
         if(isSmash)
         {
            return 8 + (knockback - 8) * (this.smashDamage / 150 + 0.5);
         }
         return knockback;
      }
      
      public function reCalCamera(ex:Number, ey:Number) : void
      {
         this.smoothScrollX = this.smoothScroll = (ex - this.x) * this.ratio;
         this.smoothScrollY = (ey + vOffset / this.ratio - (this.groundY - isTall)) * this.ratio;
         tempY = (this.smoothScrollY + this.smoothScrollUD) / this.ratio - vOffset / this.ratio;
         this.cameraY = this.groundY - isTall + tempY;
      }
      
      override public function get x() : Number
      {
         return theX;
      }
      
      override public function set x(xCoord:Number) : void
      {
         super.x = theX = xCoord;
      }
      
      override public function get y() : Number
      {
         return theY;
      }
      
      override public function set y(yCoord:Number) : void
      {
         super.y = theY = yCoord;
      }
   }
}

