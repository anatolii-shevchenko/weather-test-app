//
//  TSWeatherDayCell.m
//  weather
//
//  Created by Tolik on 3/1/15.
//  Copyright (c) 2015 Tolik Shevchenko. All rights reserved.
//

#import "TSWeatherDayCell.h"
#import "TSWeatherDayData.h"
#import "UIImageView+AFNetworking.h"

@interface TSWeatherDayCell ()

@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@property (nonatomic, weak) IBOutlet UILabel *tempLabel;
@property (nonatomic, weak) IBOutlet UIImageView *iconImageView;

@end

@implementation TSWeatherDayCell

+ (NSString *)stringFromDate:(NSDate *)date
{
    static NSDateFormatter *formatter;
    if (nil == formatter)
    {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = [NSDateFormatter dateFormatFromTemplate:@"EEEEdMMM"
                                                               options:0
                                                                locale:[NSLocale currentLocale]];
        formatter.timeZone = 0;
    }
    return [formatter stringFromDate:date];
}

- (void)setDayData:(TSWeatherDayData *)dayData
{
    if (_dayData != dayData)
    {
        _dayData = dayData;
        self.tempLabel.text = [NSString stringWithFormat:@"%ld - %ld °C", (long)dayData.minTempC, (long)dayData.maxTempC];
        self.dateLabel.text = [[self class] stringFromDate:dayData.date];
        [self.iconImageView setImageWithURL:dayData.imageURL];
    }
}

@end
