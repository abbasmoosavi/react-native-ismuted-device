
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNIsmutedDeviceSpec.h"

@interface IsmutedDevice : NSObject <NativeIsmutedDeviceSpec>
#else
#import <React/RCTBridgeModule.h>

@interface IsmutedDevice : NSObject <RCTBridgeModule>
#endif

@end
