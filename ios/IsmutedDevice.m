#import "IsmutedDevice.h"
#import <Foundation/Foundation.h>
#import <React/RCTUtils.h>
#import "MuteChecker.h"
#import <AudioToolbox/AudioToolbox.h>

@interface IsmutedDevice ()

@property (nonatomic, copy) RCTPromiseResolveBlock resolveBlock;
@property (nonatomic, copy) RCTPromiseRejectBlock rejectBlock;
@property (nonatomic, strong) MuteChecker *muteChecker;

@end

@implementation IsmutedDevice

- (instancetype)init {
  self = [super init];
  return self;
}

RCT_EXPORT_MODULE();

// required to run in main queue
+ (BOOL)requiresMainQueueSetup {
  return YES;
}

RCT_REMAP_METHOD(check,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject){
  self.resolveBlock = resolve;
  self.rejectBlock = reject;
  
  [self silenced];
}

-(void)silenced {
#if TARGET_IPHONE_SIMULATOR
  reject(@"isMuted", @"The simulator currently doesn't support react-native-is-muted.", [NSError errorWithDomain:@"SimulatorNotSupported" code:0 userInfo:@{}]);
#endif
  
  self.muteChecker = [[MuteChecker alloc] initWithCompletionBlk:^(BOOL muted) {
    self.resolveBlock(muted ? @TRUE : @FALSE);
  }];
  
  @try {
    [_muteChecker check];
  }
  @catch (NSException *e) {
    self.rejectBlock(@"isMuted", @"Error occured when checking is muted.", [NSError errorWithDomain:e.name code:0 userInfo:@{
      NSUnderlyingErrorKey: e,
      NSDebugDescriptionErrorKey: e.userInfo ?: @{ },
      NSLocalizedFailureReasonErrorKey: (e.reason ?: @"???") }]);
  }
}
