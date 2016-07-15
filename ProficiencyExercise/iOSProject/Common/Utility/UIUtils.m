//
//  UIUtils.m
//  iOSProject
//

#import "UIUtils.h"
#import "Macros.h"
#import "StringValidateUtils.h"
#import "PureLayout.h"


@implementation UIUtils

+ (float)pointsToPixels:(float)points
{
    float baseWidth = 320;
    float screenWidth = SCREEN_MIN_LENGTH;
    
    return (points * screenWidth) / baseWidth;
}
#pragma mark -  Alert -

//One Button AlertView
+ (void)alertView:(NSString *)message
        withTitle:(NSString *)title {
    

     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert"
                                                               message:@"body"
                                                        preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *ok = [UIAlertAction
               actionWithTitle:@"Ok"
               style:UIAlertActionStyleCancel
               handler: ^(UIAlertAction *action)
               {
                   [alertController
                    dismissViewControllerAnimated:YES
                    completion:nil];
               }];
    
    
    [alertController addAction:ok];
    
    [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - Button -

+ (UIButton *)createButtonWithBGImageName:(NSString *)bgImageName
                  andHighlightedImageName:(NSString *)hgImageName
                           andEventTarget:(id)targetedObject
                                andAction:(SEL)action
                                   andTag:(int)tagNo
                           andButtonTitle:(NSString *)title
                              andFontSize:(int)size
                              andFontType:(NSString *)fontType
                          andFontColorHex:(NSString *)fontColor
                          andLeftCapWidth:(float)leftCapWidth
                         andLeftCapHeight:(float)leftCapHeight
{
    UIButton *button = [[UIButton alloc] initForAutoLayout];
    
    if ([StringValidateUtils isStringPresent:bgImageName])
    {
        UIImage *stretchableImage = [[UIImage imageNamed:bgImageName] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:leftCapHeight];
        
        [button setBackgroundImage:stretchableImage
                          forState:UIControlStateNormal];
    }
    if ([StringValidateUtils isStringPresent:hgImageName])
    {
        UIImage *stretchableImage = [[UIImage imageNamed:hgImageName] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:leftCapHeight];
        
        [button setBackgroundImage:stretchableImage
                          forState:UIControlStateHighlighted];
    }
    
    
    [button addTarget:targetedObject
               action:action
     forControlEvents:UIControlEventTouchUpInside];
    
    
    [button setTitle:title
            forState:UIControlStateNormal];
    
    [button.titleLabel
     setFont:[UIFont fontWithName:fontType
                             size:size]];
    
    [button setTitleColor:[UIUtils colorFromHexColor:fontColor]
                 forState:UIControlStateNormal];
    
    [button setTag:tagNo];
    
    [button setExclusiveTouch:YES];
    
    return button;
}
#pragma mark -  Label -

+ (UILabel *)createLabelWithText:(NSString *)text
                withTextColorHex:(NSString *)HexValue
               withTextAlignment:(NSTextAlignment)alignment
                        withFont:(NSString *)fontName
                     andFontSize:(float)fontSize
{
    UILabel *label = [[UILabel alloc] initForAutoLayout];
    
    [label setBackgroundColor:[UIColor clearColor]];
    [label setText:text];
    
    if ([StringValidateUtils isStringPresent:fontName])
    {
        [label setFont:[UIFont fontWithName:fontName
                                       size:fontSize]];
    }
    else
    {
        [label setFont:[UIFont systemFontOfSize:fontSize]];
    }
    
    [label setTextColor:[UIUtils colorFromHexColor:HexValue]];
    
    [label setTextAlignment:alignment];
    
    return label;
}

#pragma mark - Color -

+ (UIColor *)colorFromHexColor:(NSString *)hexColor
{
    unsigned int red = 0, green = 0, blue = 0;
    NSRange range;
    
    range.length = 2;
    
    range.location = 0;
    
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float) (red / 255.0)
                           green:(float) (green / 255.0)
                            blue:(float) (blue / 255.0)
                           alpha:1.0];
}

@end
