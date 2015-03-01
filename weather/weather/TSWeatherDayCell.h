//
//  TSWeatherDayCell.h
//  weather
//
//  Created by Tolik on 3/1/15.
//  Copyright (c) 2015 Tolik Shevchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSWeatherDayData;

@interface TSWeatherDayCell : UITableViewCell
@property (nonatomic, strong) TSWeatherDayData *dayData;
@end
