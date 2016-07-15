//
//  CountryDetailModel.h
//  iOSProject
//

#import <Foundation/Foundation.h>

@interface CountryDetailModel : NSObject


@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *countryDescription;
@property (nonatomic, strong) NSString *imageHref;

+ (CountryDetailModel *)createCountryDetailModelFromDictionary:(NSDictionary *)dict;
@end
