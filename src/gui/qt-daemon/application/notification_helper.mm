#include "notification_helper.h"
#import <Foundation/Foundation.h>
#import <Foundation/NSUserNotification.h>
#import <Foundation/NSUserNotificationCenter.h>
#import <Foundation/NSString.h>

void notification_helper::show(const std::string& title, const std::string& message)
{
    NSUserNotification *userNotification = [[NSUserNotification alloc] init];
    [userNotification setTitle:[NSString stringWithUTF8String:title.c_str()]];
    [userNotification setInformativeText:[NSString stringWithUTF8String:message.c_str()]];

    NSUserNotificationCenter *center = [NSUserNotificationCenter defaultUserNotificationCenter];
    [center deliverNotification:userNotification];

    [userNotification release]; // Liberar el objeto
}
