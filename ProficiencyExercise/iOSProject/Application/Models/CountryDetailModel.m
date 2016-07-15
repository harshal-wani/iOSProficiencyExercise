//
//  CountryDetailModel.m
//  iOSProject
//

#import "CountryDetailModel.h"

@implementation CountryDetailModel

#pragma mark - Initialisation

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
    }
    
    return self;
}

#pragma mark - Parsing Method -

+ (NSDictionary *)jsonMapping
{
    return @{
             @"title": @"title",
             @"description": @"countryDescription",
             @"imageHref": @"imageHref"
             };
}

+ (CountryDetailModel *)createCountryDetailModelFromDictionary:(NSDictionary *)dict
{
    CountryDetailModel *countryDetailModel = [[CountryDetailModel alloc] init];
   
    NSDictionary *mapping = [CountryDetailModel jsonMapping];
    
    for (NSString *atttribute in [dict allKeys])
    {
        NSString *classProperty = [mapping objectForKey:atttribute];
        
        NSString *attributeValue = [dict objectForKey:atttribute];
        
        if (attributeValue != nil && !([attributeValue isKindOfClass:[NSNull class]]) && classProperty != nil && !([classProperty isKindOfClass:[NSNull class]]))
        {
            [countryDetailModel setValue:attributeValue
                              forKeyPath :classProperty];
        }
    }
    return countryDetailModel;
}

@end
