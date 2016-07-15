//
//  StringValidateUtils.m
//  iOSProject
//

#import "StringValidateUtils.h"

@implementation StringValidateUtils

+ (BOOL)isStringPresent:(NSString *)string
{
    if ((string == nil) || ([string isKindOfClass:[NSNull class]]) || [string isEqualToString:@"(null)"])
    {
        return NO;
    }
    else
        if ([self isBlank:string])
        {
            return NO;
        }
    return YES;
}
+ (BOOL)isNull:(NSString *)string
{
    if ((string == nil) || ([string isKindOfClass:[NSNull class]]))
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

+ (BOOL)isBlank:(NSString *)string
{
    if ([[self stringByStrippingWhitespace:string] length] == 0)
    {
        return YES;
    }
    return NO;
}
+ (NSString *)stringByStrippingWhitespace:(NSString *)string
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
