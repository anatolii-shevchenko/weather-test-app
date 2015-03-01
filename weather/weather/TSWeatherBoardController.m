//
//  TSWeatherBoardController.m
//  weather
//
//  Created by Tolik on 2/28/15.
//  Copyright (c) 2015 Tolik Shevchenko. All rights reserved.
//

#import "TSWeatherBoardController.h"
#import "TSLocationWeatherController.h"
#import "TSWeatherProvider.h"
#import "TSLocationCell.h"

#import "weather-Swift.h"

static NSString *const kTSLocationsStoringKey = @"locations";

@interface TSWeatherBoardController ()<GooglePlacesAutocompleteDelegate>

@property (nonatomic, strong) NSMutableArray *locationsArray;
@property (nonatomic, strong) NSMutableDictionary *locationsDataDictionary;
@property (nonatomic, strong) TSWeatherProvider *weatherProvider;

- (IBAction)presentAddLocationController:(id)sender;

@end

@implementation TSWeatherBoardController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.locationsDataDictionary = [[NSMutableDictionary alloc] init];
    self.weatherProvider = [[TSWeatherProvider alloc] initWithAPIKey:@"ad4537fa672786f7d9cffc56dff70"];
    [self restoreLocations];
    
    if (nil == self.locationsArray)
    {
        self.locationsArray = [[NSMutableArray alloc] init];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(storeLocations) name:UIApplicationWillResignActiveNotification object:nil];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    [self updateEditButtonState];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    if (!editing)
    {
        [self updateEditButtonState];
    }
}

- (IBAction)presentAddLocationController:(id)sender
{
    GooglePlacesAutocompleteContainer *controller = [[GooglePlacesAutocompleteContainer alloc] initWithNibName:@"GooglePlacesAutocomplete" bundle:nil];
    controller.apiKey = @"AIzaSyCOw1A4AcJfsD0KVfxLkxptL7yncEAjAYA";
    controller.delegate = self;

    [self.navigationController pushViewController:controller animated:YES];
}

- (void)addLocation:(NSString *)location;
{
    [self loadDataForLocation:location];
    
    [self.locationsArray insertObject:location atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self updateEditButtonState];
}

- (void)loadDataForLocation:(NSString *)location
{
    [self.weatherProvider weatherForLocation:location days:5 withBlock:^(TSWeatherData *data) {
        if (nil != data)
        {
            [self.locationsDataDictionary setObject:data forKey:location];
            [self.tableView reloadData];
        }
    }];
}

- (void)updateEditButtonState
{
    self.editButtonItem.enabled = (self.locationsArray.count != 0);
}

- (void)storeLocations
{
    [[NSUserDefaults standardUserDefaults] setObject:self.locationsArray forKey:kTSLocationsStoringKey];
}

- (void)restoreLocations
{
    self.locationsArray = [[NSUserDefaults standardUserDefaults] objectForKey:kTSLocationsStoringKey];
    
    for (NSString *location in self.locationsArray)
    {
        [self loadDataForLocation:location];
    }
}

#pragma mark - GooglePlacesAutocompleteContainer delegate

- (void)placeSelected:(Place *)place
{
    [self addLocation:place.description];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"TSLocationWeatherController"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *location = self.locationsArray[indexPath.row];
        TSWeatherData *weatherData = self.locationsDataDictionary[location];
        
        ((TSLocationWeatherController *)segue.destinationViewController).location = location;
        ((TSLocationWeatherController *)segue.destinationViewController).weatherData = weatherData;
    }
}

#pragma mark - table view datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.locationsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TSLocationCell *cell = (TSLocationCell *)[tableView dequeueReusableCellWithIdentifier:@"TSLocationCell" forIndexPath:indexPath];

    NSString *location = self.locationsArray[indexPath.row];
    
    cell.location = location;
    cell.weatherData = self.locationsDataDictionary[location];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.locationsArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
