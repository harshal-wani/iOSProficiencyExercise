//
//  CountryDetailsProxy.m
//  iOSProject
//

#import "CountryDetailsProxy.h"
#import "CountryDetailModel.h"


@implementation CountryDetailsProxy

static NSString *const kCOUNTRY_DETAILS_API_URL = @"u/746330/facts.json";

static NSString *const kCOUNTRY_DETAILS_API_NAME = @"countryDetails";

- (void)getCountryDetailsWithSuccess:(CountryDetailsProxySuccessBlock)success withFailure:(CountryDetailsProxyFailureBlock)failure{
    
    self.successBlock = success;
    self.failureBlock = failure;
    //h ttps://dl.dropboxusercontent.com/u/746330/facts.json
    [super getRequestDataWithURL:kCOUNTRY_DETAILS_API_URL
                  andRequestName:kCOUNTRY_DETAILS_API_NAME];
}

#pragma mark - Server request callback methods -

- (void)successWithRequest:(AFHTTPRequestOperation *)operation
               withRespose:(id)responseObject
           withRequestName:(NSString *)requestName
{
    DebugLog(@"response: %@", operation.responseString);
    
    NSDictionary *returnDictionary = nil;
    
    if (operation.responseString != nil)
    {
        returnDictionary = [self JSONValueReturnsDictionary:operation.responseString];
    }
    if (![returnDictionary isKindOfClass:[NSNull class]])
    {
        [self handleSuccessCountryDetailsAPIWithResponse:operation.responseString];
        
    }
}

- (void)failedWithRequest:(AFHTTPRequestOperation *)operation
                witherror:(NSError *)error
          withRequestName:(NSString *)requestName
{
    
    NSDictionary *returnDictionary = nil;
    
    if (operation.responseString != nil)
    {
        returnDictionary = [self JSONValueReturnsDictionary:operation.responseString];
    }
    else
    {
        returnDictionary = @{
                             @"message":COMMUNICATION_WITH_SERVER_FAILED
                            };
    }
    [self handleFailureCountryDetailsAPIWithResponse:returnDictionary];
}

#pragma mark - Handler -

- (void)handleSuccessCountryDetailsAPIWithResponse:(NSString *)responseString
{
    NSDictionary *responseDict = [self JSONValueReturnsDictionary:responseString];
    
    
    if ([responseDict isKindOfClass:[NSDictionary class]])
    {
        NSMutableArray *countryModelsArray = [[NSMutableArray alloc] init];
        
        for (NSInteger iterator = 0; iterator < [responseDict[@"rows"] count]; iterator++)
        {
            NSDictionary *objectDictionary = responseDict[@"rows"][iterator];
            
            if ([objectDictionary isKindOfClass:[NSDictionary class]])
            {
                
                CountryDetailModel *countryDetailModel = [CountryDetailModel createCountryDetailModelFromDictionary:objectDictionary];

                [countryModelsArray addObject:countryDetailModel];
            }
        }
        
        NSDictionary *modelDict = @{
                                    @"rows": countryModelsArray,
                                    @"title":responseDict[@"title"]
                                    };
        
        self.successBlock(modelDict);
    }
    else
    {
        NSDictionary *returnDictionary = @{
                                           @"message":COMMUNICATION_WITH_SERVER_FAILED
                                           };
        self.failureBlock(returnDictionary);
    }
    
}

- (void)handleFailureCountryDetailsAPIWithResponse:(NSDictionary *)returnDictionary
{
    self.failureBlock(returnDictionary);
}

@end
