#import <Foundation/Foundation.h>

@interface NotificationHelper : NSObject

+ (void)showWithTitle:(NSString *)title message:(NSString *)message;

@end

@implementation NotificationHelper

+ (void)showWithTitle:(NSString *)title message:(NSString *)message {
    NSUserNotification *userNotification = [[NSUserNotification alloc] init];
    userNotification.title = title;
    userNotification.informativeText = message;
    
    NSUserNotificationCenter *center = [NSUserNotificationCenter defaultUserNotificationCenter];
    [center deliverNotification:userNotification];
}

@end
