//
//  Macros.h
//  iOSProject
//


//Used to print debugging output
#define PRINT_LOGS

#ifdef PRINT_LOGS
#   define DebugLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__);
#else
#   define DebugLog(...)
#endif


#define IS_IPAD             (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE           (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA           ([[UIScreen mainScreen] scale] >= 2.0)


#define SCREEN_MIN_LENGTH   (MIN(([[UIScreen mainScreen] bounds].size.width), ([[UIScreen mainScreen] bounds].size.height)))

#define SCREEN_MAX_LENGTH   (MAX(([[UIScreen mainScreen] bounds].size.width), ([[UIScreen mainScreen] bounds].size.height)))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5         (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6         (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P        (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

// PTPX
#define PTPX(pt)         ([UIUtils pointsToPixels:pt])

// Easily access the Projects AppDelegate object from anywhere
#define APP_DELEGATE                   ((AppDelegate *) [[UIApplication sharedApplication] delegate])
