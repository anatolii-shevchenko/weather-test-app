//
//  TSLocationWeatherController.h
//  weather
//
//  Created by Tolik on 2/28/15.
//  Copyright (c) 2015 Tolik Shevchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSWeatherData;

@interface TSLocationWeatherController : UITableViewController

@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) TSWeatherData *weatherData;

@end

