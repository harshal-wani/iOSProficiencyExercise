//
//  StringValidateUtils.h
//  iOSProject
//

#import <Foundation/Foundation.h>

@interface StringValidateUtils : NSObject

+ (NSString *)stringByStrippingWhitespace:(NSString *)string;
+ (BOOL)isBlank:(NSString *)string;
+ (BOOL)isStringPresent:(NSString *)string;
+ (BOOL)isNull:(NSString *)string;

@end
