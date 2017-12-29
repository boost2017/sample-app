#import "EZRAudioStreamerPlatformService.h"
#import <AVFoundation/AVFoundation.h>

//
// The EZRAudioStreamerPlatformServiceImpl implements the EZRAudioStreamerPlatformService protocol
// using an internal AVPlayer.
//
@interface EZRAudioStreamerPlatformServiceImpl : NSObject <EZRAudioStreamerPlatformService>

//
// An class method to provide an instance of the EZRAudioStreamerPlatformServiceImpl
// class.
//
+ (instancetype)proxy;

@end
