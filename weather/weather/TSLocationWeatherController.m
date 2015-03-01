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

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"";
}

- (void)setLocation:(NSString *)location
{
    self.navigationItem.title = location;
}

- (NSString *)location
{
    return self.navigationItem.title;
}

#pragma mark - table view datasource

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
