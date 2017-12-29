#import "EZRHttpClientPlatformServiceImpl.h"

@interface EZRHttpClientPlatformServiceImpl ()

@end

@implementation EZRHttpClientPlatformServiceImpl

//------------------------------------------------------------------------------
#pragma mark - Class Initializer
//------------------------------------------------------------------------------

+ (instancetype)proxy 
{
    return [[self alloc] init];
}

//------------------------------------------------------------------------------
#pragma mark - Initialization
//------------------------------------------------------------------------------

- (instancetype)init 
{
    self = [super init];
    
    if (self)
    {
        //
    }
    
    return self;
}

//------------------------------------------------------------------------------
#pragma mark - EZRHttpClientPlatformServiceImpl
//------------------------------------------------------------------------------

- (nonnull EZRHttpResponse *)doGet:(nonnull NSString *)url
{
    return [self doRequest:url method:@"GET" contentType:nil data:nil];
}

- (nonnull EZRHttpResponse *)doPost:(nonnull NSString *)url
                               data:(nonnull NSString *)data
                        contentType:(nonnull NSString *)contentType
{
    return [self doRequest:url method:@"POST" contentType:contentType data:data];
}

- (nonnull EZRHttpResponse *)doHead:(nonnull NSString *)url
{
    return [self doRequest:url method:@"HEAD" contentType:nil data:nil];
}

- (nonnull EZRHttpResponse *)doDelete:(nonnull NSString *)url
                                 data:(nonnull NSString *)data
                          contentType:(nonnull NSString *)contentType
{
    return [self doRequest:url method:@"DELETE" contentType:contentType data:data];
}

- (nonnull EZRHttpResponse *)doPatch:(nonnull NSString *)url
                                data:(nonnull NSString *)data
                         contentType:(nonnull NSString *)contentType
{
    return [self doRequest:url method:@"PATCH" contentType:contentType data:data];
}

- (nonnull EZRHttpResponse *)doPut:(nonnull NSString *)url
                              data:(nonnull NSString *)data
                       contentType:(nonnull NSString *)contentType
{
    return [self doRequest:url method:@"PUT" contentType:contentType data:data];
}

- (nonnull EZRHttpResponse *)doRequest:(nonnull NSString *)url
                                method:(nonnull NSString *)method
                           contentType:(nullable NSString *)contentType
                                  data:(nullable NSString *)data
{
    // general
    NSURL *nsurl = [[NSURL alloc] initWithString:url];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:nsurl];
    [urlRequest setHTTPMethod:method];
    
    // request content type
    if (contentType != nil)
    {
        [urlRequest setValue:contentType forHTTPHeaderField:@"Content-Type"];
    }
    
    // request data
    if (data != nil)
    {
        NSData *requestData = [data dataUsingEncoding:NSUTF8StringEncoding];
        
        if (requestData != nil)
        {
            [urlRequest setHTTPBody:requestData];
            [urlRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
        }
    }
    
    // prepare and do the request
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *receivedData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
    
    if (error != nil)
    {
        return [[EZRHttpResponse alloc] initWithCode:((int)[httpResponse statusCode]) body:@""];
    }
    
    NSString *body = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    
    return [[EZRHttpResponse alloc] initWithCode:((int)[httpResponse statusCode]) body:body];
}

@end
