package
{
   import com.kongregate.air.standalone.steam.*;
   import flash.utils.*;
   
   public class FRESteamWorksAdapter implements ISteamAdapter
   {
      
      private var mAppId:uint = 0;
      
      private var mUserId:String = "web-player";
      
      public function FRESteamWorksAdapter()
      {
         super();
         trace("STEAMWORKS API disabled for browser compatibility");
         if(Main.localSettings != null && (Main.localSettings.language == null || Main.localSettings.language == ""))
         {
            Main.localSettings.language = "English";
         }
      }
      
      public static function setAchievement(e:String) : void
      {
      }
      
      public static function flushStats() : void
      {
      }
      
      public function get initialized() : Boolean
      {
         return false;
      }
      
      public function get personaName() : String
      {
         return "Web Player";
      }
      
      public function get steamID() : String
      {
         return this.mUserId;
      }
      
      public function getAuthSessionTicket(callback:Function) : void
      {
         if(callback != null)
         {
            callback(new ByteArray());
         }
      }
   }
}
