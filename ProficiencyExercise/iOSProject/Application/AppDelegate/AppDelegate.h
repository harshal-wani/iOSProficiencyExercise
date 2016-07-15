//
//  AppDelegate.h
//  iOSProject
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) RootViewController *rootViewController;

@property (strong, nonatomic) UINavigationController *rootNavigationController;

@end

