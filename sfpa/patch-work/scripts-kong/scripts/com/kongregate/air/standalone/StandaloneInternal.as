package com.kongregate.air.standalone
{
   import com.kongregate.air.KongregateAPI;
   import com.kongregate.air.base.Internal;
   import com.kongregate.air.event.APIEvent;
   import com.kongregate.air.event.InternalEvent;
   import com.kongregate.air.standalone.steam.ISteamAdapter;
   import com.kongregate.as3.client.services.IInternalServices;
   import flash.desktop.NativeApplication;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   
   public class StandaloneInternal extends Internal implements IInternalServices
   {
      
      private static const DOMAIN_PREFIX_REGEX:RegExp = /^([^.])+/;
      
      private static const ANALYTICS_MODE_MAP:Object = {
         "ENABLE_ALL":"all",
         "CLOUD":"cloud",
         "DISABLE_ALL":"none"
      };
      
      private var mSteamAdapter:ISteamAdapter;
      
      private var mActiveUser:ActiveUser;
      
      private var mGameID:Number;
      
      private var mExternalConfig:Object;
      
      public function StandaloneInternal(api:KongregateAPI, gameID:Number)
      {
         super(api);
         this.mExternalConfig = {
            "swrve_app_id":KongregateAPI.settings.swrveAppId,
            "swrve_api_key":KongregateAPI.settings.swrveApiKey
         };
         this.mGameID = gameID;
         this.mSteamAdapter = KongregateAPI.settings.steamAdapter;
         this.mActiveUser = new ActiveUser(this);
         NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE,this.onActivate);
         this.authenticateSteam();
         addEventListener(InternalEvent.INTERNAL_EVENT,this.onInternalEvent);
      }
      
      internal static function getKongregateURL(path:String, subdomain:String = "www") : String
      {
         var domain:String = KongregateAPI.settings.apiDomain;
         if(subdomain)
         {
            domain = domain.replace(DOMAIN_PREFIX_REGEX,subdomain);
         }
         return "https://" + domain + path;
      }
      
      internal static function bytesToHexString(bytes:ByteArray) : String
      {
         var n:String = null;
         var s:String = "";
         for(var i:int = 0; i < bytes.length; i++)
         {
            n = bytes[i].toString(16);
            s += (n.length < 2 ? "0" : "") + n;
         }
         return s;
      }
      
      internal static function nextTick(callback:Function) : void
      {
         var timer:Timer;
         if(callback == null)
         {
            return;
         }
         timer = new Timer(0,1);
         timer.addEventListener(TimerEvent.TIMER,function(e:TimerEvent):void
         {
            callback();
         });
         timer.start();
      }
      
      internal static function parseJSON(data:String) : Object
      {
         var json:Object = null;
         try
         {
            json = JSON.parse(data);
         }
         catch(e:Error)
         {
            trace("Error parsing JSON: " + data);
         }
         return json;
      }
      
      private function onInternalEvent(evt:InternalEvent) : void
      {
         if(KongregateAPI.settings.deferAnalytics && evt.name == InternalEvent.ACTIVE_USER_INITIALIZED)
         {
            this.fireReadyEvents();
         }
         else if(!KongregateAPI.settings.deferAnalytics && evt.name == InternalEvent.ANALYTICS_INITIALIZED)
         {
            this.fireReadyEvents();
         }
      }
      
      private function fireReadyEvents() : void
      {
         trace("KongregateAPI is ready!");
         mAPI.dispatchEvent(new APIEvent(KongregateAPI.KONGREGATE_EVENT_READY,{}));
         mAPI.dispatchEvent(new APIEvent(KongregateAPI.KONGREGATE_EVENT_USER_CHANGED,{}));
         mAPI.dispatchEvent(new APIEvent(KongregateAPI.KONGREGATE_EVENT_GAME_AUTH_CHANGED,{}));
      }
      
      internal function get activeUser() : ActiveUser
      {
         return this.mActiveUser;
      }
      
      internal function get gameID() : Number
      {
         return this.mGameID;
      }
      
      internal function fireAPIEvent(eventName:String) : void
      {
         mAPI.dispatchEvent(new APIEvent(eventName,{}));
      }
      
      private function onActivate(e:Event) : void
      {
         this.authenticateSteam();
      }
      
      private function authenticateSteam() : void
      {
         trace("StandaloneInternal - authenticateSteam");
         if(this.mSteamAdapter == null)
         {
            trace("WARNING: No Steam Adapter. Unable to authenticate.");
            return;
         }
         this.mSteamAdapter.getAuthSessionTicket(function(ticketRaw:ByteArray):void
         {
            var ticketHex:String = bytesToHexString(ticketRaw);
            mActiveUser.authenticateSteam(mSteamAdapter.steamID,ticketHex);
         });
      }
      
      public function getUserId() : Number
      {
         return this.activeUser.userID;
      }
      
      public function getGameID() : Number
      {
         return this.mGameID;
      }
      
      public function getApiHost() : String
      {
         return KongregateAPI.settings.apiDomain;
      }
      
      public function get isKongregate() : Boolean
      {
         return false;
      }
      
      public function get isExternal() : Boolean
      {
         return true;
      }
      
      public function get javascriptApiEnabled() : Boolean
      {
         return false;
      }
      
      public function getAnalyticsMode() : String
      {
         return ANALYTICS_MODE_MAP[KongregateAPI.settings.autoAnalyticsMode];
      }
      
      public function getGameVersion() : String
      {
         return KongregateAPI.settings.appVersion;
      }
      
      public function getUsername() : String
      {
         return this.mActiveUser.username;
      }
      
      public function getExternalConfigValue(name:String, defaultValue:*) : *
      {
         return this.mExternalConfig[name] || defaultValue;
      }
   }
}

