//
//  TSWeatherData.h
//  weather
//
//  Created by Tolik on 2/28/15.
//  Copyright (c) 2015 Tolik Shevchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSWeatherDayData.h"

@interface TSWeatherData : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary NS_DESIGNATED_INITIALIZER;

@property (nonatomic, assign, readonly) NSInteger tempC;
@property (nonatomic, strong, readonly) NSURL *imageURL;
@property (nonatomic, strong, readonly) NSArray *daysWeather;//array of TSWeatherDayData objects

@end
