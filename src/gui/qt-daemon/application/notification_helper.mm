#import <Foundation/Foundation.h>

@interface NotificationHelper : NSObject
    
   + (void)showNotificationWithTitle:(NSString *)title message:(NSString *)message;
    
@end

@implementation NotificationHelper

+ (void)showNotificationWithTitle:(NSString *)title message:(NSString *)message {
    NSUserNotification *notification = [[NSUserNotification alloc] init];
    notification.title = title;
    notification.informativeText = message;
    
    [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:notification];
}

@end
