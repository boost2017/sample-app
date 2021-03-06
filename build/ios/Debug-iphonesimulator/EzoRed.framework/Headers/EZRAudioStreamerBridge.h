// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from proj.djinni

#import <Foundation/Foundation.h>
@class EZRAudioStreamerBridge;
@protocol EZRAudioStreamerPlatformService;


/**
 * The Audio Streamer Bridge class serves as a concrete class that wraps our proxy
 * implementation and provides our client a singleton instance to reuse.
 */
@interface EZRAudioStreamerBridge : NSObject

/**
 * A singleton instance of the audio streamer (in most applications you will
 * only be dealing with a single streamer reference since you don't want
 * multiple players playing at once)
 */
+ (nullable EZRAudioStreamerBridge *)sharedInstance;

/**
 * Sets an instance of the proxy class that is used to implement the
 * platform specific proxy
 */
- (void)setPlatformService:(nullable id<EZRAudioStreamerPlatformService>)ps;

/**
 * Gets an instance of the proxy class that is used to implement the
 * platform specific proxy
 */
- (nullable id<EZRAudioStreamerPlatformService>)getPlatformService;

/** Provides the currently loaded URL song reference */
- (nonnull NSString *)getUrl;

/**
 * Sets the current URL song reference (will stop the player from playing
 * if it is currently playing)
 */
- (void)setUrl:(nonnull NSString *)url;

/**
 * Returns a boolean indicating whether or not the player is currently
 * playing some audio
 */
- (BOOL)isPlaying;

/** Tells the player to start playing audio. */
- (void)play;

/** Tells the player to pause any audio it may be playing. */
- (void)pause;

@end
