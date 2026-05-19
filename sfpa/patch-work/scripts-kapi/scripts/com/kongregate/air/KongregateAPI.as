package com.kongregate.air
{
   import com.kongregate.air.base.*;
   import com.kongregate.air.event.*;
   import com.kongregate.air.native.*;
   import com.kongregate.air.standalone.*;
   import com.kongregate.air.web.*;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.StatusEvent;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.Capabilities;
   import flash.system.LoaderContext;
   import flash.system.Security;
   
   public class KongregateAPI extends EventDispatcher
   {
      
      private static var sInstance:KongregateAPI;
      
      public static const KONGREGATE_EVENT_READY:String = "KONG_API_EVENT_READY";
      
      public static const KONGREGATE_EVENT_USER_CHANGED:String = "KONG_API_EVENT_USER_CHANGED";
      
      public static const KONGREGATE_EVENT_GAME_AUTH_CHANGED:String = "KONG_API_EVENT_GAME_AUTH_TOKEN_CHANGED";
      
      public static const KONGREGATE_EVENT_LOGIN_COMPLETE:String = "KONG_API_EVENT_LOGIN_COMPLETE";
      
      public static const KONGREGATE_EVENT_OPENING:String = "KONG_API_EVENT_OPENING_KONGREGATE";
      
      public static const KONGREGATE_EVENT_CLOSED:String = "KONG_API_EVENT_CLOSED_KONGREGATE";
      
      public static const KONGREGATE_EVENT_USER_INVENTORY:String = "KONG_API_EVENT_USER_INVENTORY";
      
      public static const KONGREGATE_EVENT_SERVICE_UNAVAILABLE:String = "KONG_API_EVENT_SERVICE_UNAVAILABLE";
      
      public static const KONGREGATE_EVENT_RECEIPT_VERIFICATION_COMPLETE:String = "KONG_API_EVENT_RECEIPT_VERIFICATION_COMPLETED";
      
      public static const KONGREGATE_EVENT_SWRVE_RESOURCES_UPDATES:String = "KONG_API_EVENT_SWRVE_RESOURCES_UPDATED";
      
      public static const KONGREGATE_EVENT_NOTIFICATION_COUNT_UPDATED:String = "KONG_API_EVENT_NOTIFICATION_COUNT_UPDATED";
      
      public static const KONGREGATE_EVENT_CHARACTER_TOKEN_REQUEST:String = "KONG_API_EVENT_CHARACTER_TOKEN_REQUEST";
      
      public static const KONGREGATE_EVENT_OPEN_DEEP_LINK:String = "KONG_API_EVENT_OPEN_DEEP_LINK";
      
      public static const RECEIPT_VERIFICATION_STATUS_UNKNOWN:String = "UNKNOWN";
      
      public static const RECEIPT_VERIFICATION_STATUS_PROCESSING:String = "PROCESSING";
      
      public static const RECEIPT_VERIFICATION_STATUS_VALID:String = "VALID";
      
      public static const RECEIPT_VERIFICATION_STATUS_INVALID:String = "INVALID";
      
      public static const AUTO_ANALYTICS_MODE_ENABLE_ALL:String = "ENABLE_ALL";
      
      public static const AUTO_ANALYTICS_MODE_DISABLE_ALL:String = "DISABLE_ALL";
      
      public static const AUTO_ANALYTICS_MODE_CLOUD:String = "CLOUD";
      
      public static const PURCHASE_SUCCESS:String = "SUCCESS";
      
      public static const PURCHASE_FAIL:String = "FAIL";
      
      public static const PURCHASE_RECEIPT_FAIL:String = "RECEIPT_FAIL";
      
      public static const ORIENTATION_PORTRAIT:String = "portrait";
      
      public static const ORIENTATION_PORTRAIT_SENSOR:String = "portraitSensor";
      
      public static const ORIENTATION_LANDSCAPE:String = "landscape";
      
      public static const ORIENTATION_LANDSCAPE_SENSOR:String = "landscapeSensor";
      
      public static const KONGREGATE_OPTION_DOMAIN:String = "domain";
      
      public static const KONGREGATE_OPTION_DEBUG:String = "debug";
      
      public static const KONGREGATE_OPTION_DEBUG_WEBVIEW:String = "debug_webview";
      
      public static const KONGREGATE_OPTION_MANAGE_LIFECYCLE:String = "manage_lifecycle";
      
      public static const KONGREGATE_OPTION_SHOW_SYSTEM_UI:String = "show_system_ui";
      
      public static const KONGREGATE_OPTION_ALLOW_IMMERSIVE_MODE:String = "allow_immersive_mode";
      
      public static const KONGREGATE_OPTION_KEEN_PROJECT_ID:String = "keen_product_id";
      
      public static const KONGREGATE_OPTION_KEEN_WRITE_KEY:String = "keen_write_key";
      
      public static const KONGREGATE_OPTION_ANALYTICS_MODE:String = "auto_analytics_mode";
      
      public static const KONGREGATE_OPTION_DEFER_ANALYTICS:String = "defer_analytics";
      
      public static const KONGREGATE_OPTION_PERSISTENT_WEBVIEW:String = "persistent_webview";
      
      public static const KONGREGATE_OPTION_GUILD_CHAT:String = "guild_chat";
      
      public static const KONGREGATE_OPTION_AUTO_ANALYTICS_FILTER:String = "auto_analytics_filter";
      
      public static const KONGREGATE_OPTION_SWRVE_APP_ID:String = "swrve_app_id";
      
      public static const KONGREGATE_OPTION_SWRVE_API_KEY:String = "swrve_api_key";
      
      public static const KONGREGATE_OPTION_PANEL_ORIENTATION_OVERRIDE:String = "panel_orientation_override";
      
      public static const KONGREGATE_OPTION_CRASHLYTICS_LOGGING:String = "crashlytics_logging";
      
      public static const KONGREGATE_OPTION_CRASHLYTICS_USER_KEYS:String = "crashlytics_user_keys";
      
      public static const KONGREGATE_OPTION_STRICT_LIFECYCLE_MODE:String = "strict_lifecycle";
      
      public static const KONGREGATE_OPTION_SUPPORTED_PANEL_EVENTS:String = "supported_panel_events";
      
      public static const KONGREGATE_OPTION_DEFAULT_PANEL_TRANSITION:String = "default_panel_transition";
      
      public static const KONGREGATE_OPTION_ENABLED:String = "enabled";
      
      public static const KONGREGATE_OPTION_MANAGE_SHARED_CACHE:String = "manage_shared_cache";
      
      public static const KONGREGATE_OPTION_ADJUST_APP_TOKEN:String = "adjust.app_token";
      
      public static const KONGREGATE_OPTION_ADJUST_ENVIRONMENT:String = "adjust.environment";
      
      public static const KONGREGATE_ADJUST_PREFIX:String = "adjust.";
      
      public static const KONGREGATE_SWRVE_PREFIX:String = "swrve.";
      
      public static const KONGREGATE_SWRVE_AUTO_DOWNLOAD:String = "swrve.autoDownload";
      
      public static const KONGREGATE_SWRVE_LANGUAGE:String = "swrve.language";
      
      public static const KONGREGATE_SWRVE_MAX_CONCURRENT_DOWNLOADS:String = "swrve.maxConcurrentDownloads";
      
      public static const KONGREGATE_SWRVE_LINK_TOKEN:String = "swrve.linkToken";
      
      public static const KONGREGATE_SWRVE_APP_VERSION:String = "swrve.appVersion";
      
      public static const KONGREGATE_SWRVE_TALK_ENABLED:String = "swrve.talkEnabled";
      
      public static const KONGREGATE_SWRVE_APP_STORE:String = "swrve.appStore";
      
      public static const KONGREGATE_SWRVE_SENDER_ID:String = "swrve.senderId";
      
      public static const KONGREGATE_SWRVE_MAX_DB_SIZE:String = "swrve.maxDbSize";
      
      public static const KONGREGATE_SWRVE_DB_NAME:String = "swrve.dbName";
      
      public static const KONGREGATE_SWRVE_MAX_EVENTS_PER_FLUSH:String = "swrve.maxEventsPerFlush";
      
      public static const KONGREGATE_SWRVE_CACHE_DIR:String = "swrve.cacheDir";
      
      public static const KONGREGATE_SWRVE_AUTO_COLLECT_DEVICE_TOKEN:String = "swrve.autoCollectDeviceToken";
      
      public static const KONGREGATE_SWRVE_PUSH_ENABLED:String = "swrve.pushEnabled";
      
      public static const KONGREGATE_SWRVE_PUSH_NOTIFICATION_EVENTS:String = "swrve.pushNotificationEvents";
      
      public static const ADJUST_SALE:String = "sale";
      
      public static const ADJUST_SESSION:String = "session";
      
      public static const ADJUST_INSTALL:String = "install";
      
      public static const KONGREGATE_EVENT_PROMO_AWARD:String = "KONG_API_EVENT_PROMO_AWARD";
      
      public static const KONGREGATE_EVENT_PARAM_PROMO_ID:String = "promoId";
      
      public static const KONGREGATE_EVENT_PARAM_ITEM:String = "item";
      
      public static const KONGREGATE_EVENT_PARAM_CURRENCY:String = "currency";
      
      public static const KONGREGATE_EVENT_PARAM_AMOUNT:String = "amount";
      
      public static const KONGREGATE_EVENT_PARAM_INSTALL_URL:String = "installUrl";
      
      public static const API_EVENT:String = "KONGREGATE_API_EVENT";
      
      public static const ANALYTICS_AUTO_EVENT:String = "KONGREGATE_ANALYTICS_AUTO_EVENT";
      
      public static const SWRVE_BUTTON_EVENT:String = "KONGREGATE_SWRVE_BUTTON_EVENT";
      
      private static const KONG_API_EVENT_PREFIX:String = "KONG_API_EVENT_";
      
      private static const KONG_API_AUTO_EVENT:String = "KONG_AUTO_EVENT";
      
      private static const KONG_API_SWRVE_BUTTON_EVENT:String = "SWRVE_BUTTON";
      
      public var platform:int;
      
      private var mExtensionContext:*;
      
      private var mServices:IServices;
      
      private var mMobile:IMobile;
      
      private var mAnalytics:IAnalytics;
      
      private var mMtx:IMtx;
      
      private var mStats:IStats;
      
      private var mDebug:IDebug;
      
      private var mInternalApi:Internal;
      
      private var mStage:Stage;
      
      private var mWebAPI:*;
      
      public function KongregateAPI(enforcer:SingletonEnforcer, stage:Stage, gameId:int, apiKey:String, apiSettings:Object)
      {
         super();
         trace("Initializing Kongregate API, version=" + Capabilities.version + ", os=" + Capabilities.os);
         this.mStage = stage;
         if(Capabilities.version.indexOf("IOS") > -1)
         {
            this.platform = PlatformType.IOS;
         }
         else if(Capabilities.version.indexOf("AND") > -1)
         {
            this.platform = PlatformType.ANDROID;
         }
         else if(Capabilities.version.indexOf("MAC") > -1)
         {
            this.platform = PlatformType.OSX;
         }
         else if(Capabilities.version.indexOf("WIN") > -1)
         {
            this.platform = PlatformType.WINDOWS;
         }
         else
         {
            this.platform = PlatformType.WEB;
         }
         if(!this.initializeNativeExtension(gameId,apiKey,apiSettings))
         {
            if(Security.sandboxType == "application")
            {
               this.initializeStandaloneExtension(gameId,apiSettings);
            }
            else
            {
               this.initializeWebExtension(gameId,apiSettings);
            }
         }
      }
      
      public static function get settings() : Settings
      {
         return Settings.instance;
      }
      
      public static function initialize(stage:Stage, gameId:int, apiKey:String, apiSettings:Object = null) : KongregateAPI
      {
         var setting:String = null;
         if(apiSettings == null)
         {
            apiSettings = {};
         }
         var settingValues:Object = settings.values;
         for(setting in settingValues)
         {
            if(apiSettings[setting] == null)
            {
               apiSettings[setting] = settingValues[setting];
            }
         }
         if(!sInstance)
         {
            sInstance = new KongregateAPI(new SingletonEnforcer(),stage,gameId,apiKey,apiSettings);
         }
         return sInstance;
      }
      
      public function get services() : IServices
      {
         return this.mServices;
      }
      
      public function get mobile() : IMobile
      {
         return this.mMobile;
      }
      
      public function get analytics() : IAnalytics
      {
         return this.mAnalytics;
      }
      
      public function get stats() : IStats
      {
         return this.mStats;
      }
      
      public function get webAPI() : *
      {
         return this.mWebAPI;
      }
      
      public function get mtx() : IMtx
      {
         return this.mMtx;
      }
      
      public function get debug() : IDebug
      {
         return this.mDebug;
      }
      
      private function initializeNativeExtension(gameId:int, apiKey:String, apiSettings:Object) : Boolean
      {
         this.mExtensionContext = ExtensionContextWrapper.createExtensionContext("com.kongregate.air.KongregateAPI","");
         if(this.mExtensionContext)
         {
            trace("ExtensionContext: " + this.mExtensionContext);
            this.mExtensionContext.addEventListener(StatusEvent.STATUS,this.handleKongregateEvent);
            this.mExtensionContext.call("initialize",gameId,apiKey,JSON.stringify(apiSettings));
            this.mMobile = new NativeMobile(this,this.mExtensionContext);
            this.mServices = new NativeServices(this,this.mExtensionContext);
            this.mStats = new NativeStats(this,this.mExtensionContext);
            this.mMtx = new NativeMtx(this,this.mExtensionContext);
            this.mAnalytics = new NativeAnalytics(this,this.mExtensionContext);
            this.mDebug = new NativeDebug(this,this.mExtensionContext);
            return true;
         }
         trace("No native extension found");
         return false;
      }
      
      private function initializeStandaloneExtension(gameId:int, apiSettings:Object) : void
      {
         trace("Initializing Standalone Extension");
         var internalApi:StandaloneInternal = new StandaloneInternal(this,gameId);
         this.mInternalApi = internalApi;
         this.mMobile = new StandaloneMobile(this,internalApi);
         this.mAnalytics = new StandaloneAnalyticsAdapter(this,internalApi);
         this.mServices = new StandaloneServices(this,internalApi);
         this.mStats = new Stats(this);
         this.mMtx = new Mtx(this);
         this.mDebug = new Debug(this);
      }
      
      private function initializeWebExtension(gameId:int, apiSettings:Object) : void
      {
         var assetsDomain:String;
         var request:URLRequest;
         var loader:Loader;
         var context:LoaderContext;
         var externalApi:Object = null;
         var external:Boolean = false;
         var apiPath:String = null;
         var self:KongregateAPI = null;
         var loaderInfo:LoaderInfo = LoaderInfo(this.mStage.loaderInfo);
         var paramObj:Object = loaderInfo.parameters;
         externalApi = Settings.instance.externalApi;
         external = Boolean(externalApi) && !paramObj.kongregate;
         if(external)
         {
            apiPath = externalApi.url || "https://api.kongregate.com/api/API_AS3.swf";
         }
         else
         {
            apiPath = paramObj.kongregate_api_path || "https://assets.kongregate.com/flash/API_AS3_Local.swf";
         }
         trace("Initializing web extension");
         trace("HostedPath: " + loaderInfo.url);
         trace("ApiPath: " + apiPath);
         assetsDomain = apiPath.replace("api","assets");
         Security.allowDomain(apiPath);
         Security.allowInsecureDomain(apiPath);
         Security.allowDomain(assetsDomain);
         Security.allowInsecureDomain(assetsDomain);
         request = new URLRequest(apiPath);
         loader = new Loader();
         self = this;
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,function(e:Event):void
         {
            mWebAPI = e.target.content;
            if(external)
            {
               mWebAPI.services.connectExternal({
                  "game_id":gameId,
                  "analytics_mode":apiSettings[KONGREGATE_OPTION_ANALYTICS_MODE],
                  "swrve_app_id":apiSettings[KONGREGATE_OPTION_SWRVE_APP_ID],
                  "swrve_api_key":apiSettings[KONGREGATE_OPTION_SWRVE_API_KEY],
                  "client_version":externalApi.client_version || "0.0.0",
                  "platform":externalApi.platform || "external"
               });
            }
            else
            {
               mWebAPI.services.connect();
            }
            mMobile = new Mobile(self);
            mServices = new WebServices(self);
            mStats = new WebStats(self);
            mMtx = new WebMtx(self);
            mAnalytics = new WebAnalytics(self);
            mDebug = new WebDebug(self);
            dispatchEvent(new APIEvent(KONGREGATE_EVENT_READY,{}));
            dispatchEvent(new APIEvent(KONGREGATE_EVENT_USER_CHANGED,{}));
            dispatchEvent(new APIEvent(KONGREGATE_EVENT_GAME_AUTH_CHANGED,{}));
         });
         context = new LoaderContext();
         context.applicationDomain = new ApplicationDomain(null);
         loader.load(request,context);
         this.mStage.addChild(loader);
      }
      
      private function handleKongregateEvent(event:StatusEvent) : void
      {
         var bundle:Object = null;
         var eventName:String = null;
         var eventBundle:Object = null;
         var name:String = event.code;
         var eventBundleJSON:String = event.level;
         if(name.indexOf(KONG_API_EVENT_PREFIX) == 0)
         {
            this.debug.debugLog("Dispatching API event: " + name + "=" + eventBundleJSON);
            bundle = eventBundleJSON ? JSON.parse(eventBundleJSON) : {};
            dispatchEvent(new APIEvent(name,bundle));
         }
         else if(KONG_API_AUTO_EVENT == name)
         {
            bundle = eventBundleJSON ? JSON.parse(eventBundleJSON) : {};
            eventName = bundle.event;
            eventBundle = bundle.bundle;
            this.debug.debugLog("Dispatching Kongregate auto event: " + eventName);
            dispatchEvent(new AnalyticsEvent(eventName,eventBundle));
         }
         else if(KONG_API_SWRVE_BUTTON_EVENT == name)
         {
            this.debug.debugLog("Dispatching Swrve Button event: " + eventBundleJSON);
            dispatchEvent(new SwrveEvent(eventBundleJSON));
         }
         else
         {
            this.debug.debugLog("Received internal Kongregate event: " + name + "=" + eventBundleJSON);
         }
      }
   }
}

class SingletonEnforcer
{
   
   public function SingletonEnforcer()
   {
      super();
   }
}
