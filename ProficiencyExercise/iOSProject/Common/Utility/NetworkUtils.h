//
//  NetworkUtils.h
//  iOSProject
//

#import <Foundation/Foundation.h>

@interface NetworkUtils : NSObject

+ (BOOL)hasNetworkConnection;

+ (BOOL)hasNetworkAndDisplayPopupIfNot;

@end
