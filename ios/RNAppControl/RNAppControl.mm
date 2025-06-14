#import <UIKit/UIKit.h>
#import <React/RCTBridge.h>

#import "RNAppControl.h"

#if RCT_NEW_ARCH_ENABLED
#import <RNAppControlSpec/RNAppControlSpec.h>
#endif

@implementation RNAppControl

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(Exit)
{
    exit(0);
};

RCT_EXPORT_METHOD(Restart)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        // Show alert to user before exiting
        // Get current locale to show appropriate language
        NSString *currentLanguage = [[NSLocale preferredLanguages] firstObject];
        NSString *languageCode = [[currentLanguage componentsSeparatedByString:@"-"] firstObject];
        
        NSString *title, *message, *okButton;
        
        if ([languageCode isEqualToString:@"fr"]) {
            title = @"Redémarrage requis";
            message = @"L'application va se fermer. Veuillez la relancer manuellement.";
            okButton = @"OK";
        } else if ([languageCode isEqualToString:@"es"]) {
            title = @"Reinicio Requerido";
            message = @"La aplicación se cerrará. Por favor, reiníciela manualmente.";
            okButton = @"OK";
        } else if ([languageCode isEqualToString:@"de"]) {
            title = @"Neustart Erforderlich";
            message = @"Die Anwendung wird geschlossen. Bitte starten Sie sie manuell neu.";
            okButton = @"OK";
        } else {
            // Default to English
            title = @"Restart Required";
            message = @"The application will close. Please restart it manually.";
            okButton = @"OK";
        }
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                      message:message
                                                               preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:okButton
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * action) {
                                                            exit(0);
                                                        }];
        [alert addAction:okAction];
        
        // Get the root view controller to present the alert
        UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
        if (rootViewController) {
            [rootViewController presentViewController:alert animated:YES completion:nil];
        } else {
            // Fallback: exit immediately if no root view controller
            exit(0);
        }
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
