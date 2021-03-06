// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from proj.djinni

#import "EZRHttpResponse.h"
#import <Foundation/Foundation.h>
@class EZRHttpClientBridge;
@protocol EZRHttpClientPlatformService;


/** Native Http Client Bridge class */
@interface EZRHttpClientBridge : NSObject

+ (nullable EZRHttpClientBridge *)sharedInstance;

- (void)setPlatformService:(nullable id<EZRHttpClientPlatformService>)ps;

- (nullable id<EZRHttpClientPlatformService>)getPlatformService;

- (nonnull EZRHttpResponse *)doGet:(nonnull NSString *)url;

- (nonnull EZRHttpResponse *)doHead:(nonnull NSString *)url;

- (nonnull EZRHttpResponse *)doPost:(nonnull NSString *)url
                               data:(nonnull NSString *)data
                        contentType:(nonnull NSString *)contentType;

- (nonnull EZRHttpResponse *)doPut:(nonnull NSString *)url
                              data:(nonnull NSString *)data
                       contentType:(nonnull NSString *)contentType;

- (nonnull EZRHttpResponse *)doDelete:(nonnull NSString *)url
                                 data:(nonnull NSString *)data
                          contentType:(nonnull NSString *)contentType;

- (nonnull EZRHttpResponse *)doPatch:(nonnull NSString *)url
                                data:(nonnull NSString *)data
                         contentType:(nonnull NSString *)contentType;

@end
