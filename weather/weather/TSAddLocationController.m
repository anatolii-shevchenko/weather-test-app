//
//  TSAddLocationController.m
//  weather
//
//  Created by Tolik on 3/1/15.
//  Copyright (c) 2015 Tolik Shevchenko. All rights reserved.
//

#import "TSAddLocationController.h"
#import "TSWeatherBoardController.h"

@interface TSAddLocationController ()

@property (nonatomic, weak) IBOutlet UITextField *locationField;

- (IBAction)onCancel:(id)sender;
- (IBAction)onDone:(id)sender;

@end

@implementation TSAddLocationController

- (IBAction)onCancel:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)onDone:(id)sender
{
    [self.boardController addLocation:self.locationField.text];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end