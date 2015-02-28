//
//  TSWeatherDayData.m
//  weather
//
//  Created by Tolik on 2/28/15.
//  Copyright (c) 2015 Tolik Shevchenko. All rights reserved.
//

#import "TSWeatherDayData.h"

@implementation TSWeatherDayData

+ (NSDate *)dateFromString:(NSString *)string
{
    static NSDateFormatter *formatter;
    if (nil == formatter)
    {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-M-dd";
        formatter.timeZone = 0;
    }
    return [formatter dateFromString:string];
}

- (id)init
{
    return [self initWithDictionary:nil];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (nil == dictionary)
    {
        NSLog(@"Can't init without dictionary");
        return nil;
    }
    
    if (self = [super init])
    {
        id minTempC = dictionary[@"mintempC"];
        id maxTempC = dictionary[@"maxtempC"];
        id imageURL = [[dictionary[@"hourly"] firstObject][@"weatherIconUrl"] firstObject][@"value"];
        id dateString = dictionary[@"date"];
        
        if (nil == minTempC || nil == maxTempC || nil == imageURL || nil == dateString)
        {
            NSLog(@"Init dictionary seems to be broken: %@", dictionary);
            return nil;
        }
        
        _minTempC = [minTempC integerValue];
        _maxTempC = [maxTempC integerValue];
        _imageURL = imageURL;
        _date = [[self class] dateFromString:dateString];
    }
    
    return self;
}

@end
