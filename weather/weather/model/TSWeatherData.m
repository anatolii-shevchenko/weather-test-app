//
//  TSWeatherData.m
//  weather
//
//  Created by Tolik on 2/28/15.
//  Copyright (c) 2015 Tolik Shevchenko. All rights reserved.
//

#import "TSWeatherData.h"
#import "TSWeatherDayData.h"

@implementation TSWeatherData

- (instancetype)init
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
        NSDictionary *currentConditionDictionary = [dictionary[@"data"][@"current_condition"] firstObject];
        id tempC = currentConditionDictionary[@"temp_C"];
        id imageURL = [currentConditionDictionary[@"weatherIconUrl"] firstObject][@"value"];
        id daysWeather = dictionary[@"data"][@"weather"];
        
        if (nil == tempC || nil == imageURL || nil == daysWeather)
        {
            NSLog(@"Init dictionary seems to be broken: %@", dictionary);
            return nil;
        }
            
        _tempC = [tempC integerValue];
        _imageURL = [NSURL URLWithString:imageURL];
        
        NSMutableArray *daysWeatherArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dayDictionary in daysWeather)
        {
            TSWeatherDayData *dayData = [[TSWeatherDayData alloc] initWithDictionary:dayDictionary];
            if (nil == dayData)
            {
                NSLog(@"Can't init with this day weather data %@", dayDictionary);
                return nil;
            }
            [daysWeatherArray addObject:dayData];
        }
        _daysWeather = daysWeatherArray;
    }
    
    return self;
}

@end
