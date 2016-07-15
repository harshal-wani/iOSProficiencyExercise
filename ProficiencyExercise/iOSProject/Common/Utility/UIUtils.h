//
//  UIUtils.h
//  iOSProject
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIUtils : NSObject

//Alert View
+ (void)alertView:(NSString *)message
        withTitle:(NSString *)title;

//Set Color Using Hex
+ (UIColor *)colorFromHexColor:(NSString *)hexColor;

//Button Creation
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
                         andLeftCapHeight:(float)leftCapHeight;

//Label Creation
+ (UILabel *)createLabelWithText:(NSString *)text
                withTextColorHex:(NSString *)HexValue
               withTextAlignment:(NSTextAlignment)alignment
                        withFont:(NSString *)fontName
                     andFontSize:(float)fontSize;

//Calculate points according to device size
+ (float)pointsToPixels:(float)points;


//ImageView Creation
+ (UIImageView *)createImageView:(NSString *)imageName;
@end
