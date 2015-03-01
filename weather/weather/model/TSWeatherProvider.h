//
//  TSWeatherProvider.h
//  weather
//
//  Created by Tolik on 2/28/15.
//  Copyright (c) 2015 Tolik Shevchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TSWeatherData;

@interface TSWeatherProvider : NSObject

@property (nonatomic, strong, readonly) NSString *APIKey;

- (instancetype)initWithAPIKey:(NSString *)APIKey NS_DESIGNATED_INITIALIZER;
- (void)weatherForLocation:(NSString *)location days:(NSUInteger)days completionBlock:(void (^)(TSWeatherData *data))block;

@end