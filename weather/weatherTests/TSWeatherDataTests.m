//
//  TSWeatherDataTests.m
//  weatherTests
//
//  Created by Tolik on 2/28/15.
//  Copyright (c) 2015 Tolik Shevchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TSWeatherData.h"

@interface TSWeatherDataTests : XCTestCase
@end

@implementation TSWeatherDataTests

- (void)testCreation
{
    TSWeatherData *data = [[TSWeatherData alloc] init];
    XCTAssertNil(data, @"Weather data is not expected to be created with init method");
    
    data = [[TSWeatherData alloc] initWithDictionary:nil];
    XCTAssertNil(data, @"Weather data is not expected to be created without dictionary");
    
    data = [[TSWeatherData alloc] initWithDictionary:@{@"key":@"value"}];
    XCTAssertNil(data, @"Weather data is not expected to be created without proper dictionary");
    
    data = [[TSWeatherData alloc] initWithDictionary:[self responceDictionary]];
    XCTAssertNotNil(data, @"Weather data is expected to be created with proper dictionary");
    
    XCTAssertEqual([self tempC], data.tempC);
    XCTAssertEqualObjects([self imageURL], data.imageURL);
}

#pragma mark -

- (NSInteger)tempC
{
    return 6;
}

- (NSURL *)imageURL
{
    return [NSURL URLWithString:@"http://cdn.worldweatheronline.net/images/wsymbols01_png_64/wsymbol_0002_sunny_intervals.png"];
}

- (NSArray *)daysWeather
{
    return @[
             @{
                 @"date": @"2015-03-02",
                 @"hourly": @[
                         @{
                             @"weatherIconUrl": @[
                                     @{
                                         @"value": @"http://cdn.worldweatheronline.net/images/wsymbols01_png_64/wsymbol_0002_sunny_intervals.png"
                                         }
                                     ]
                             }
                         ],
                 @"maxtempC": @"7",
                 @"mintempC": @"2",
                 },
             @{
                 @"date": @"2015-03-03",
                 @"hourly": @[
                         @{
                             @"weatherIconUrl": @[
                                     @{
                                         @"value": @"http://cdn.worldweatheronline.net/images/wsymbols01_png_64/wsymbol_0002_sunny_intervals.png"
                                         }
                                     ]
                             }
                         ],
                 @"maxtempC": @"7",
                 @"mintempC": @"1"
                 },
             @{
                 @"date": @"2015-03-04",
                 @"hourly": @[
                         @{
                             @"weatherIconUrl": @[
                                     @{
                                         @"value": @"http://cdn.worldweatheronline.net/images/wsymbols01_png_64/wsymbol_0002_sunny_intervals.png"
                                         }
                                     ]
                             }
                         ],
                 @"maxtempC": @"9",
                 @"mintempC": @"1"
                 },
             @{
                 @"date": @"2015-03-05",
                 @"hourly": @[
                         @{
                             @"weatherIconUrl": @[
                                     @{
                                         @"value": @"http://cdn.worldweatheronline.net/images/wsymbols01_png_64/wsymbol_0002_sunny_intervals.png"
                                         }
                                     ]
                             }
                         ],
                 @"maxtempC": @"10",
                 @"mintempC": @"4",
                 },
             @{
                 @"date": @"2015-03-06",
                 @"hourly": @[
                         @{
                             @"weatherIconUrl": @[
                                     @{
                                         @"value": @"http://cdn.worldweatheronline.net/images/wsymbols01_png_64/wsymbol_0002_sunny_intervals.png"
                                         }
                                     ]
                             }
                         ],
                 @"maxtempC": @"11",
                 @"mintempC": @"6",
                 }
             ];
}

- (NSDictionary *)responceDictionary
{
    return @{
             @"data": @{
                     @"current_condition": @[
                             @{
                                 @"temp_C": @([self tempC]),
                                 @"weatherIconUrl": @[
                                         @{
                                             @"value": [[self imageURL] absoluteString]
                                             }
                                         ]
                                 }
                             ],
                     @"request": @[
                             @{
                                 @"query": @"London, United Kingdom",
                                 @"type": @"City"
                                 }
                             ],
                     @"weather": [self daysWeather]
                     }
             };
}

@end
