package
{
   import com.kongregate.air.*;
   import flash.events.Event;
   
   public class Achievements
   {
      
      public static var mKongregate:KongregateAPI;
      
      private static var sendKong:Boolean;
      
      private static var steamAdapter:FRESteamWorksAdapter;
      
      private static var nameVector:Vector.<String> = new Vector.<String>();
      
      private static var timerVector:Vector.<int> = new Vector.<int>();
      
      private static var countVector:Vector.<int> = new Vector.<int>();
      
      public static var KongregateConstants:Object = {};
      
      public function Achievements()
      {
         super();
      }
      
      public static function track(e:String, t:int, max:uint, reset:Boolean = false) : void
      {
         var i:int = int(nameVector.indexOf(e));
         if(i == -1)
         {
            nameVector.push(e);
            timerVector.push(t);
            countVector.push(1);
         }
         else
         {
            if(reset)
            {
               timerVector[i] = t;
            }
            ++countVector[i];
            if(countVector[i] == max)
            {
               unlock(e);
            }
         }
      }
      
      public static function clearTracked(e:String) : void
      {
         var i:int = int(nameVector.indexOf(e));
         if(i > -1)
         {
            spliceAll(i);
         }
      }
      
      public static function counter() : void
      {
         for(var i:* = int(nameVector.length - 1); i >= 0; i--)
         {
            --timerVector[i];
            if(timerVector[i] == 0)
            {
               spliceAll(i);
            }
         }
      }
      
      public static function spliceAll(i:uint) : void
      {
         nameVector.removeAt(i);
         timerVector.removeAt(i);
         countVector.removeAt(i);
      }
      
      public static function unlock(e:String) : void
      {
         trace("Steam " + e);
         FRESteamWorksAdapter.setAchievement(e);
      }
      
      public static function SendScore(stat:String, e:uint) : *
      {
         trace("Send Score: " + stat + " " + e);
         if(sendKong)
         {
            mKongregate.stats.submit(stat,e);
         }
      }
      
      public static function startKong() : void
      {
         steamAdapter = new FRESteamWorksAdapter();
         sendKong = false;
         trace("Skipping Kongregate startup for browser compatibility");
         Main.stageRoot.StartMain();
      }
      
      private static function KongCallback(e:Event) : void
      {
         trace("- " + e.name);
         switch(e.name)
         {
            case KongregateAPI.KONGREGATE_EVENT_USER_CHANGED:
               trace(mKongregate.services.getUsername());
               break;
            case KongregateAPI.KONGREGATE_EVENT_READY:
               sendKong = true;
               Main.stageRoot.StartMain();
               break;
            case KongregateAPI.KONGREGATE_EVENT_GAME_AUTH_CHANGED:
         }
      }
      
      public static function KongButton() : void
      {
      }
   }
}

