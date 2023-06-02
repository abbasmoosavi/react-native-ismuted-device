
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNIsmutedDeviceSpec.h"

@interface IsmutedDevice : NSObject <NativeIsmutedDeviceSpec>
#else
#import <React/RCTBridgeModule.h>
#import <UIKit/UIKit.h>

@interface IsmutedDevice : NSObject <RCTBridgeModule, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate>
#endif

@end
