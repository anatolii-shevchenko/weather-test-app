//
//  TSWeatherProvider.h
//  weather
//
//  Created by Tolik on 2/28/15.
//  Copyright (c) 2015 Tolik Shevchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSWeatherData.h"

@interface TSWeatherProvider : NSObject

@property (nonatomic, strong, readonly) NSString *APIKey;

- (id)initWithAPIKey:(NSString *)APIKey NS_DESIGNATED_INITIALIZER;
- (void)weatherForLocation:(NSString *)location days:(int)days withBlock:(void (^)(TSWeatherData *data))block;

@end