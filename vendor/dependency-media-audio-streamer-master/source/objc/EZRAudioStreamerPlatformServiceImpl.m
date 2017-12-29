#import "EZRAudioStreamerPlatformServiceImpl.h"
#import <UIKit/UIKit.h>

@interface EZRAudioStreamerPlatformServiceImpl ()
@property (strong) AVPlayer *player;
@end

@implementation EZRAudioStreamerPlatformServiceImpl

//------------------------------------------------------------------------------
#pragma mark - Class Initializer
//------------------------------------------------------------------------------

+ (instancetype)proxy {
    return [[self alloc] init];
}

//------------------------------------------------------------------------------
#pragma mark - Initialization
//------------------------------------------------------------------------------

- (instancetype)init {
    self = [super init];
    if (self) {
        self.player = [[AVPlayer alloc] init];
    }
    return self;
}

//------------------------------------------------------------------------------
#pragma mark - EZRAudioStreamerPlatformServiceImpl
//------------------------------------------------------------------------------

- (NSString *)getUrl {
    AVAsset *currentPlayerAsset = self.player.currentItem.asset;
    if (![currentPlayerAsset isKindOfClass:AVURLAsset.class]) {
        return nil;
    }
    return [[(AVURLAsset *)currentPlayerAsset URL] absoluteString];
}

//------------------------------------------------------------------------------

- (void)setUrl:(NSString *)url {
    NSLog(@"Setting url: %@", url);
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:url]];
    [self.player replaceCurrentItemWithPlayerItem:item];
}

//------------------------------------------------------------------------------

- (BOOL)isPlaying {
    if ([[[UIDevice currentDevice] systemVersion] intValue] >= 10) {
        return (self.player.timeControlStatus == AVPlayerTimeControlStatusPlaying);
    } else {
        return (self.player.rate != 0 && self.player.error == nil);
    }
}

//------------------------------------------------------------------------------

- (void)play {
    NSLog(@"Player [%@]: is playing: %@", self.player, [self getUrl]);
    [self.player play];
}

//------------------------------------------------------------------------------

- (void)pause {
    [self.player pause];
}

@end
