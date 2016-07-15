//
//  CountryDetailsProxy.h
//  iOSProject
//

#import "AbstractProxy.h"

typedef void(^CountryDetailsProxySuccessBlock)(NSDictionary *responseDict);

typedef void (^CountryDetailsProxyFailureBlock)(NSDictionary *responseDict);

@interface CountryDetailsProxy : AbstractProxy


@property(nonatomic, copy) CountryDetailsProxySuccessBlock successBlock;

@property(nonatomic, copy) CountryDetailsProxyFailureBlock failureBlock;


-(void)getCountryDetailsWithSuccess:(CountryDetailsProxySuccessBlock)success
                        withFailure:(CountryDetailsProxyFailureBlock)failure;

@end
