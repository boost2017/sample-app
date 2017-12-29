#import "EZRGreetingMessagePlatformServiceImpl.h"
#import <UIKit/UIKit.h>

@interface EZRGreetingMessagePlatformServiceImpl ()

@end

@implementation EZRGreetingMessagePlatformServiceImpl

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
#pragma mark - EZRGreetingMessagePlatformServiceImpl
//------------------------------------------------------------------------------

- (void)showGreetingMessageAlert:(nonnull NSString *)title
                         message:(nonnull NSString *)message 
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];

	UIAlertAction *button = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
		// handle action if need
	}];

	[alert addAction:button];
	
	UIViewController *controller = [UIApplication sharedApplication].keyWindow.rootViewController;
    [controller presentViewController:alert animated:YES completion:nil];
}

@end