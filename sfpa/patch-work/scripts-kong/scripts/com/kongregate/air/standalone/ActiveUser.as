package com.kongregate.air.standalone
{
   import com.kongregate.air.KongregateAPI;
   import com.kongregate.air.event.InternalEvent;
   import com.kongregate.air.standalone.steam.ISteamAdapter;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.Timer;
   
   public class ActiveUser
   {
      
      private static const USER_PROPS_CACHE:String = "kongregate_user_properties_cache";
      
      private static const MAX_POLL_TIME:Number = 60 * 1000;
      
      private var mPendingSteamID:String;
      
      private var mPendingAuthTicket:String;
      
      private var mCurrentAuthTicket:String;
      
      private var mInternal:StandaloneInternal;
      
      private var mUserProperties:Object;
      
      public function ActiveUser(§internal§:StandaloneInternal)
      {
         var §internal§:StandaloneInternal;
         super();
         this.mInternal = §internal§;
         this.readUserProperties(function():void
         {
            mInternal.dispatchEvent(new InternalEvent(InternalEvent.USER_INFO,mUserProperties));
            mInternal.dispatchEvent(new InternalEvent(InternalEvent.ACTIVE_USER_INITIALIZED,{}));
         });
      }
      
      public function get userID() : Number
      {
         return this.mUserProperties.hasOwnProperty("user_id") ? Number(this.mUserProperties.user_id) : 0;
      }
      
      public function get username() : String
      {
         return this.mUserProperties.hasOwnProperty("username") ? this.mUserProperties.username : "Guest";
      }
      
      public function get gameAuthToken() : String
      {
         return this.mUserProperties.hasOwnProperty("game_auth_token") ? this.mUserProperties.game_auth_token : "Guest_Game_Auth_Token";
      }
      
      public function get hasKongPlus() : Boolean
      {
         return this.mUserProperties.hasOwnProperty("premium") ? Boolean(this.mUserProperties.premium) : false;
      }
      
      public function get steamPersonaName() : String
      {
         var steam:ISteamAdapter = KongregateAPI.settings.steamAdapter;
         if(steam != null)
         {
            return steam.personaName;
         }
         return null;
      }
      
      public function authenticateSteam(steamID:String, authTicket:String) : void
      {
         var url:String;
         var request:URLRequest;
         var loader:URLLoader = null;
         var statusCode:int = 0;
         trace("ActiveUser.authenticateSteam steamId=" + steamID + ", ticket=" + authTicket);
         if(this.mPendingAuthTicket == authTicket)
         {
            trace("Ignoring duplicate authentication request");
            return;
         }
         this.mPendingSteamID = steamID;
         this.mPendingAuthTicket = authTicket;
         if(this.mCurrentAuthTicket == authTicket)
         {
            trace("Ignoring simultaneous authentication request");
         }
         this.mCurrentAuthTicket = authTicket;
         url = StandaloneInternal.getKongregateURL("/api/steam/v1/sessions","sync");
         request = new URLRequest(url);
         request.method = URLRequestMethod.POST;
         request.data = new URLVariables();
         request.data.steam_id = steamID;
         request.data.auth_ticket = authTicket;
         request.data.game_id = this.mInternal.gameID;
         request.data.persona = this.steamPersonaName;
         loader = new URLLoader();
         statusCode = 0;
         loader.addEventListener(HTTPStatusEvent.HTTP_STATUS,function(e:HTTPStatusEvent):void
         {
            statusCode = e.status;
         });
         loader.addEventListener(IOErrorEvent.IO_ERROR,function(e:ErrorEvent):void
         {
            trace("ActiveUser - io error: " + e);
         });
         loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,function(e:ErrorEvent):void
         {
            trace("ActiveUser - security error: " + e);
         });
         loader.addEventListener(Event.COMPLETE,function(e:Event):void
         {
            var json:Object = null;
            trace("ActiveUser - authenticateSteam - loader complete: " + statusCode);
            if(statusCode != 200)
            {
               json = StandaloneInternal.parseJSON(loader.data);
               if(json != null)
               {
                  pollSteamAuthResult(json.uri,500);
               }
               else
               {
                  trace("ActiveUser - error parsing authenticate steam result");
               }
            }
         });
         loader.load(request);
      }
      
      private function pollSteamAuthResult(url:String, delay:Number) : void
      {
         var pollTimer:Timer;
         trace("Waiting for " + delay + " millis before polling Steam auth result");
         pollTimer = new Timer(delay,1);
         pollTimer.addEventListener(TimerEvent.TIMER,function(e:TimerEvent):void
         {
            var request:URLRequest;
            var loader:URLLoader = null;
            var statusCode:Number = NaN;
            trace("do poll: " + url);
            request = new URLRequest(url);
            request.method = URLRequestMethod.GET;
            loader = new URLLoader();
            statusCode = 0;
            loader.addEventListener(HTTPStatusEvent.HTTP_STATUS,function(e:HTTPStatusEvent):void
            {
               statusCode = e.status;
            });
            loader.addEventListener(IOErrorEvent.IO_ERROR,function(e:ErrorEvent):void
            {
               trace("ActiveUser - poll steam result - io error: " + e);
            });
            loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,function(e:ErrorEvent):void
            {
               trace("ActiveUser - poll steam result - security error: " + e);
            });
            loader.addEventListener(Event.COMPLETE,function(e:Event):void
            {
               trace("ActiveUser - poll steam auth result: " + statusCode);
               if(!handleSteamAuthPollingResult(statusCode,loader.data,url,delay))
               {
                  reauthenticateIfNeeded();
               }
            });
            loader.load(request);
         });
         pollTimer.start();
      }
      
      private function reauthenticateIfNeeded() : void
      {
         if(this.mPendingAuthTicket != null && this.mPendingAuthTicket.length > 0 && this.mPendingAuthTicket != this.mCurrentAuthTicket)
         {
            trace("Steam authentication information has changed, re-authenticating");
            this.mCurrentAuthTicket = null;
            this.authenticateSteam(this.mPendingSteamID,this.mPendingAuthTicket);
         }
         else
         {
            trace("Clearing steam authentication info");
            this.mPendingSteamID = null;
            this.mPendingAuthTicket = null;
            this.mCurrentAuthTicket = null;
         }
      }
      
      private function handleSteamAuthPollingResult(statusCode:int, data:String, url:String, timeout:Number) : Boolean
      {
         var json:Object = null;
         if(statusCode <= 0 || statusCode >= 400)
         {
            trace("Error polling steam authentication: " + statusCode);
            return false;
         }
         if(statusCode == 200)
         {
            json = StandaloneInternal.parseJSON(data);
            if(json == null)
            {
               trace("Error parsing steam authentication result");
               return false;
            }
            this.setUserProperties(json);
            return true;
         }
         var newTimeout:Number = timeout * 2;
         if(newTimeout >= MAX_POLL_TIME)
         {
            trace("Giving up polling for Steam authentication result");
            return false;
         }
         this.pollSteamAuthResult(url,newTimeout);
         return true;
      }
      
      private function setUserProperties(props:Object) : void
      {
         var olduserID:Number = this.userID;
         var oldGameAuthToken:String = this.gameAuthToken;
         this.writeUserProperties(props);
         if(oldGameAuthToken != this.gameAuthToken)
         {
            this.mInternal.fireAPIEvent(KongregateAPI.KONGREGATE_EVENT_GAME_AUTH_CHANGED);
         }
         if(olduserID != this.userID)
         {
            this.mInternal.fireAPIEvent(KongregateAPI.KONGREGATE_EVENT_USER_CHANGED);
         }
         trace("User properties udpated: username: " + this.username + ", userID: " + this.userID);
         this.reauthenticateIfNeeded();
         this.mInternal.dispatchEvent(new InternalEvent(InternalEvent.USER_INFO,props));
      }
      
      private function writeUserProperties(props:Object) : void
      {
         var file:File;
         var fileStream:FileStream;
         this.mUserProperties = props;
         file = File.applicationStorageDirectory.resolvePath(USER_PROPS_CACHE);
         fileStream = new FileStream();
         try
         {
            fileStream.openAsync(file,FileMode.WRITE);
         }
         catch(e:SecurityError)
         {
            trace("ActiveUser - SecurityError accessing cache: " + e.message);
            return;
         }
         fileStream.addEventListener(IOErrorEvent.IO_ERROR,function(e:IOErrorEvent):void
         {
            trace("ActiveUser - I/O Error writing cache: " + e.text);
         });
         try
         {
            fileStream.writeObject(props);
         }
         catch(error:Error)
         {
            trace("ActiveUser - I/O Error writing to cache");
         }
         finally
         {
            fileStream.close();
         }
         trace("ActiveUser - user properties cached (" + file.nativePath + ") : " + JSON.stringify(this.mUserProperties));
      }
      
      private function readUserProperties(callback:Function) : void
      {
         var file:File = null;
         var fileStream:FileStream = null;
         file = File.applicationStorageDirectory.resolvePath(USER_PROPS_CACHE);
         if(!file.exists)
         {
            trace("ActiveUser - no cached user properties");
            this.mUserProperties = new Object();
            StandaloneInternal.nextTick(callback);
            return;
         }
         fileStream = new FileStream();
         try
         {
            fileStream.openAsync(file,FileMode.READ);
         }
         catch(e:SecurityError)
         {
            trace("ActiveUser - SecurityError accessing cache: " + e.message);
            StandaloneInternal.nextTick(callback);
            return;
         }
         fileStream.addEventListener(IOErrorEvent.IO_ERROR,function(e:IOErrorEvent):void
         {
            trace("ActiveUser - I/O Error reading cache: " + e.text);
         });
         fileStream.addEventListener(Event.COMPLETE,function(e:Event):void
         {
            try
            {
               mUserProperties = fileStream.readObject();
               trace("ActiveUser - user properties from cache (" + file.nativePath + ") : " + JSON.stringify(mUserProperties));
            }
            catch(e:Error)
            {
               trace("ActiveUser - error reading cache: " + e.message);
               mUserProperties = new Object();
            }
            finally
            {
               fileStream.close();
               if(Boolean(callback))
               {
                  callback();
               }
            }
         });
      }
   }
}

