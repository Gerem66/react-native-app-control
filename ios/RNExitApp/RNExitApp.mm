#import <UIKit/UIKit.h>

#import "RNAppControl.h"

#if RCT_NEW_ARCH_ENABLED
#import <RNAppControlSpec/RNAppControlSpec.h>
#endif

@implementation RNAppControl

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(Exit)
{
    exit(0);
};

RCT_EXPORT_METHOD(Restart)
{
    // On iOS, we need to exit the app and let the system handle the restart
    // The app will restart when the user taps on it again
    // For a more seamless restart, we could use URL schemes but that requires additional setup
    dispatch_async(dispatch_get_main_queue(), ^{
        exit(0);
    });
};

# pragma mark - New Architecture

#if RCT_NEW_ARCH_ENABLED

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeRNAppControlSpecJSI>(params);
}

#endif

@end
