//
//  TSLocationWeatherController.m
//  weather
//
//  Created by Tolik on 2/28/15.
//  Copyright (c) 2015 Tolik Shevchenko. All rights reserved.
//

#import "TSLocationWeatherController.h"
#import "TSWeatherData.h"
#import "TSWeatherDayCell.h"

@interface TSLocationWeatherController ()

@end

@implementation TSLocationWeatherController

- (void)setLocation:(NSString *)location
{
    self.navigationItem.title = location;
}

- (NSString *)location
{
    return self.navigationItem.title;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.weatherData.daysWeather.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TSWeatherDayCell *cell = (TSWeatherDayCell *)[tableView dequeueReusableCellWithIdentifier:@"TSWeatherDayCell" forIndexPath:indexPath];
    
    cell.dayData = self.weatherData.daysWeather[indexPath.row];
    
    return cell;
}

@end
