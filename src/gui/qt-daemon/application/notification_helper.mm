#include "notification_helper.h"
#include <Foundation/Foundation.h>
#include <Foundation/NSUserNotification.h>

void notification_helper::show(const std::string& title, const std::string& message)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    NSUserNotification *userNotification = [[NSUserNotification alloc] init];
    [userNotification setTitle:[NSString stringWithUTF8String:title.c_str()]];
    [userNotification setInformativeText:[NSString stringWithUTF8String:message.c_str()]];

    NSUserNotificationCenter *center = [NSUserNotificationCenter defaultUserNotificationCenter];
    [center deliverNotification:userNotification];

    [pool release]; // Liberar el autorelease pool
}
