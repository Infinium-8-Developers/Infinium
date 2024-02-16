#pragma once
#include <string>
#include "epee/include/misc_log_ex.h"

#if defined(__APPLE__)
    #include <Foundation/NSString.h>
#endif

struct notification_helper
{
  static void show(const std::string& title, const std::string& message)
  {
    #if defined(__APPLE__)

    #else
        // Implementación para otras plataformas
        LOG_PRINT_RED("system notifications are not supported for this platform!", LOG_LEVEL_0);
    #endif
  }
};
