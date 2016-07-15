//
//  CommonMethodHelper.h
//  iOSProject
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommonMethodHelper : NSObject

#pragma mark - HUD Related

+ (void)checkNetworkAndShowHudForView:(UIView *)view;

+ (void)hideHudForView:(UIView *)view;

@end
