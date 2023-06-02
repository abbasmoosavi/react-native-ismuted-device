//
//  MuteChecker.h
//  IsmutedDevice
//
//  Created by Abbas Moosavi on 6/2/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

typedef void (^MuteCheckCompletionHandler)(BOOL muted);

@interface MuteChecker : NSObject

// this class must use with a MuteChecker.caf (a 0.2 sec mute sound) in Bundle

@property (nonatomic,assign) SystemSoundID soundId;
@property (strong) MuteCheckCompletionHandler completionBlk;

-(instancetype)initWithCompletionBlk:(MuteCheckCompletionHandler)completionBlk;
-(void)check;

@end
