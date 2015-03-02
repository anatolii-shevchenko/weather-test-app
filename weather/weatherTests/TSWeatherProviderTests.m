//
//  TSWeatherProviderTests.m
//  weatherTests
//
//  Created by Tolik on 2/28/15.
//  Copyright (c) 2015 Tolik Shevchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TSWeatherProvider.h"

@interface TSWeatherProviderTests : XCTestCase
@end

@implementation TSWeatherProviderTests

- (void)testCreation
{
    TSWeatherProvider *provider = [[TSWeatherProvider alloc] init];
    XCTAssertNil(provider, @"Weather provider is not expected to be created with init method");
    
    provider = [[TSWeatherProvider alloc] initWithAPIKey:nil];
    XCTAssertNil(provider, @"Weather provider is not expected to be created without APIKey");
    
    NSString *APIKey = @"some api key";
    provider = [[TSWeatherProvider alloc] initWithAPIKey:APIKey];
    XCTAssertNotNil(provider, @"Weather provider is expected to be created with APIKey");
    XCTAssertEqualObjects(APIKey, provider.APIKey);
}

- (void)testCompletionBlockCall
{
    NSString *APIKey = @"some api key";
    TSWeatherProvider *provider = [[TSWeatherProvider alloc] initWithAPIKey:APIKey];
    
    XCTestExpectation *completionBlockExpectation = [self expectationWithDescription:@"Completion block is expected to be called"];
    [provider weatherForLocation:@"" days:1 completionBlock:^(TSWeatherData *data) {
        [completionBlockExpectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:2.0f handler:nil];
}

@end
