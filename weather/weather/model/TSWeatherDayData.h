//
//  TSWeatherDayData.h
//  weather
//
//  Created by Tolik on 2/28/15.
//  Copyright (c) 2015 Tolik Shevchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSWeatherDayData : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary NS_DESIGNATED_INITIALIZER;

@property (nonatomic, assign, readonly) NSInteger minTempC;
@property (nonatomic, assign, readonly) NSInteger maxTempC;

@property (nonatomic, strong, readonly) NSDate *date;
@property (nonatomic, strong, readonly) NSURL *imageURL;

@end
