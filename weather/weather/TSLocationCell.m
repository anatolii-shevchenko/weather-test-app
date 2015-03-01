//
//  TSLocationCell.m
//  weather
//
//  Created by Tolik on 3/1/15.
//  Copyright (c) 2015 Tolik Shevchenko. All rights reserved.
//

#import "TSLocationCell.h"
#import "TSWeatherData.h"

@interface TSLocationCell ()

@property (nonatomic, weak) IBOutlet UILabel *locationLabel;
@property (nonatomic, weak) IBOutlet UILabel *tempLabel;
@property (nonatomic, weak) IBOutlet UIImageView *iconImageView;

@end

@implementation TSLocationCell

- (void)setLocation:(NSString *)location
{
    self.locationLabel.text = location;
}

- (NSString *)location
{
    return self.locationLabel.text;
}

- (void)setWeatherData:(TSWeatherData *)weatherData
{
    if (_weatherData != weatherData)
    {
        _weatherData = weatherData;
        self.tempLabel.text = [NSString stringWithFormat:@"%ld °C", (long)weatherData.tempC];
    }
}

@end
