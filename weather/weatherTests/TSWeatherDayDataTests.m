//
//  TSWeatherProviderTests.m
//  weatherTests
//
//  Created by Tolik on 2/28/15.
//  Copyright (c) 2015 Tolik Shevchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TSWeatherDayData.h"

@interface TSWeatherDayDataTests : XCTestCase
@end

@implementation TSWeatherDayDataTests

- (void)testCreation
{
    TSWeatherDayData *data = [[TSWeatherDayData alloc] init];
    XCTAssertNil(data, @"Weather day data is not expected to be created with init method");
    
    data = [[TSWeatherDayData alloc] initWithDictionary:nil];
    XCTAssertNil(data, @"Weather day data is not expected to be created without dictionary");
    
    data = [[TSWeatherDayData alloc] initWithDictionary:@{@"key":@"value"}];
    XCTAssertNil(data, @"Weather day data is not expected to be created without proper dictionary");
    
    data = [[TSWeatherDayData alloc] initWithDictionary:[self responceDictionary]];
    XCTAssertNotNil(data, @"Weather day data is expected to be created with proper dictionary");
    
    XCTAssertEqual([self minTempC], data.minTempC);
    XCTAssertEqual([self maxTempC], data.maxTempC);
    XCTAssertEqualObjects([self imageURL], data.imageURL);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    formatter.timeZone = 0;
    NSDate *expectedDate = [formatter dateFromString:[self dateString]];
    
    XCTAssertEqualObjects(expectedDate, data.date);
}

#pragma mark -

- (NSInteger)minTempC
{
    return 2;
}

- (NSInteger)maxTempC
{
    return 7;
}

- (NSURL *)imageURL
{
    return [NSURL URLWithString:@"http://cdn.worldweatheronline.net/images/wsymbols01_png_64/wsymbol_0002_sunny_intervals.png"];
}

- (NSString *)dateString
{
    return @"2015-03-02";
}

- (NSDictionary *)responceDictionary
{
    return @{
             @"date": [self dateString],
             @"hourly": @[
                     @{
                         @"weatherIconUrl": @[
                                 @{
                                     @"value": [[self imageURL] absoluteString]
                                     }
                                 ]
                         }
                     ],
             @"maxtempC": @([self maxTempC]),
             @"mintempC": @([self minTempC]),
             };
}

@end
