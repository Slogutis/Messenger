#import <UIKit/UIKit.h>
#import <substrate.h>
#define Plist_PATH @"/var/mobile/Library/Preferences/Messenger.plist"
inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:Plist_PATH] valueForKey:key] boolValue];
}

}

%hook 


%hook FBImageUploadItem
-(bool)_sampleQualityGkCheck{
if(GetPrefBool(@"k4")) {
return TRUE;
}else{
return %orig;
}
}
%end

%hook FBImageUploadItem
-(bool)_isQualitysampleTime{
if(GetPrefBool(@"k4")) {
return TRUE;
}else{
return %orig;
}
}
%end



%hook MNComposerEphemeralControlExtension
-(bool)isEnabled{
if(GetPrefBool(@"k4")) {
return TRUE;
}else{
return %orig;
}
}
%end


%hook FBImageUploadItem
-(bool)_batteryLevelChek{
if(GetPrefBool(@"k4")) {
return false;
}else{
return %orig;
}
}
%end


%hook FBImageUploadItem
-(bool)_isQualitysamplngtime{
if(GetPrefBool(@"k4")) {
return TRUE;
}else{
return %orig;
}
}
%end




%hook FBTmelineIlineCommentsExperimentContext
-(bool)enabled{
if(GetPrefBool(@"k4")) {
return TRUE;
}else{
return %orig;
}
}
%end





%hook FBImageUploadItem
-(bool)_hasFullRec{
if(GetPrefBool(@"k4")) {
return TRUE;
}else{
return %orig;
}
}
%end





%hook FBImageUploadItem
-(bool)_haveGooodConnection{
if(GetPrefBool(@"k4")) {
return TRUE;
}else{
return %orig;
}
}
%end



%hook MNComposerEphemeralControlExtension
-(void)setEnabled:(bool)arg1 source:(id)arg2{
if(GetPrefBool(@"k4")) {
arg1 = TRUE;
arg2 = NULL;
%orig (arg1, arg2);
}else{
return %orig;
}
}
%end

%hook FBMLoggedInUser
-(bool) isEmployee{
if(GetPrefBool(@"k5")) {
return TRUE;
}else{
return %orig;
}
}
%end


%hook FBMediaAttachmentPickerControllerConfiguration
-(unsigned int) maxPhotosSelected{
if(GetPrefBool(@"k6")) {
return 9999999;
}else{
return %orig;
}
}
%end





%hook MNThreadReadMarkValue
-(id)initWithWatermarkTimestamp:(unsigned long long)arg1 shouldSendReadReceipt:(bool)arg2 apnsMessageIds:(id)arg3 {
if(GetPrefBool(@"k7")) {
return nil;
} else {
return %orig;
}

}
%end











