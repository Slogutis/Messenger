#import <UIKit/UIKit.h>
#import <substrate.h>
#define Plist_PATH @"/var/mobile/Library/Preferences/Messenger.plist"
inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:Plist_PATH] valueForKey:key] boolValue];
}

%hook MNThreadTypingStateSender
-(void) _sendTypingState{
if(GetPrefBool(@"k9")){
return ;
}else{
return %orig;
}
}
-(BOOL) isTyping{
if(GetPrefBool(@"k9")){
return false;
}else{
return %orig;
}
}
-(void) _setAndNotifyTyping:(BOOL)arg1{
if(GetPrefBool(@"k9")) {
arg1 = false;
%orig (arg1);
}else{
return %orig;
}
}
%end


%hook FBMMQTTSender 
-(void) sendTypingNotification:(id)arg1 state:(int)arg2{
if(GetPrefBool(@"k9")) {
arg1 = nil;
arg2 = nil;
%orig (arg1, arg2);
}else{
return %orig;
}
}
%end 


%hook TypingNotificationManager
-(BOOL) isTyping{
if(GetPrefBool(@"k9")){
return false;
}else{
return %orig;
}
}
%end




%hook MNUserSettings
-(bool) isFlowersBorderInSettingsEnabled{
if(GetPrefBool(@"k10")) {
return TRUE;
}else{
return %orig;
}
}
%end

%hook MNFlowersBorderPolicy
-(bool) canShowFlowersBorderInSettings{
if(GetPrefBool(@"k10")) {
return TRUE;
}else{
return %orig;
}
}
%end


%hook MNInviteToastController
 -(bool) _shouldShowInviteToastView{
if(GetPrefBool(@"k11")) {
return TRUE;
}else{
return %orig;
}
}
%end








