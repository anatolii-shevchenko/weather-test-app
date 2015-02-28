//
//  TSWeatherProvider.m
//  weather
//
//  Created by Tolik on 2/28/15.
//  Copyright (c) 2015 Tolik Shevchenko. All rights reserved.
//

#import "TSWeatherProvider.h"

@interface TSWeatherProvider()
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation TSWeatherProvider

- (id)init
{
    return [self initWithAPIKey:nil];
}

- (id)initWithAPIKey:(NSString *)APIKey
{
    if (self = [super init])
    {
        if (nil == APIKey)
        {
            @throw([NSException exceptionWithName:@"InvalidArgumentException" reason:@"API Key cannot be empty." userInfo:nil]);
        }
        
        _APIKey = APIKey;
        _session = [NSURLSession sharedSession];
    }
    
    return self;
}

- (void)weatherForLocation:(NSString *)location days:(int)days withBlock:(void (^)(TSWeatherData *data))block
{
    NSURL *url = [self URLWithBase:@"api.worldweatheronline.com/free/v2/weather.ashx"
                        parameters:@{@"key": self.APIKey,
                                     @"q": location,
                                     @"num_of_days": @(days),
                                     @"show_comments": @"no",
                                     @"format": @"json",
                                     @"tp": @24}];
    
    
    NSURLSessionDataTask *task = [self.session dataTaskWithURL:url
                                             completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                 NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                 
                                                 TSWeatherData *weatherData = [[TSWeatherData alloc] initWithDictionary:jsonDictionary];
                                                 dispatch_sync(dispatch_get_main_queue(), ^{
                                                     block(weatherData);
                                                 });
                                             }
                                  ];
    [task resume];
}

- (NSURL*)URLWithBase:(NSString *)baseURLString parameters:(NSDictionary *)parameters
{
    NSString *result = [NSString stringWithFormat:@"http://%@?", baseURLString];
    
    for (NSString *key in parameters.allKeys)
    {
        result = [result stringByAppendingFormat:@"%@=%@&", key, [parameters objectForKey:key]];
    }
    
    result = [result substringToIndex:[result length] - 1];
    return [NSURL URLWithString:result];
}

@end
