//
//  CommonMethodHelper.m
//  iOSProject
//

#import "CommonMethodHelper.h"
#import "CommonFilesImport.h"

@implementation CommonMethodHelper

+ (void)checkNetworkAndShowHudForView:(UIView *)view
{
    if (![NetworkUtils hasNetworkAndDisplayPopupIfNot])
    {
        return;
    }
    
    [MBProgressHUD showHUDAddedTo:view
                         animated:YES];
}

+ (void)hideHudForView:(UIView *)view
{
    [MBProgressHUD hideHUDForView: view
                         animated: YES];
}
@end
