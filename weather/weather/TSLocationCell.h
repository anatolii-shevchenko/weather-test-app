//
//  TSLocationCell.h
//  weather
//
//  Created by Tolik on 3/1/15.
//  Copyright (c) 2015 Tolik Shevchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSWeatherData;

@interface TSLocationCell : UITableViewCell

@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) TSWeatherData *weatherData;

@end
