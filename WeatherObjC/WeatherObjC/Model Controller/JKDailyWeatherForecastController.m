//
//  JKDailyWeatherForecastController.m
//  WeatherObjC
//
//  Created by TuneUp Shop  on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//


//API call:
//http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID={APIKEY}
//Parameters:
//
//APPID {APIKEY} is your unique API key
//Example of API call:
//
//api.openweathermap.org/data/2.5/forecast?id=524901&APPID=1111111111
/// 7a5b07f444731d33ef61e8ea95a7415e

//fully formed URL for zip
/// https://samples.openweathermap.org/data/2.5/forecast/daily?zip=94040&appid=7a5b07f444731d33ef61e8ea95a7415e

#import "JKDailyWeatherForecastController.h"
#import "JKDailyWeatherForecast.h"
#import <objc/runtime.h>

@implementation JKDailyWeatherForecastController

- (instancetype)init{
    self = [super init];
    if (self) {
        //
    }
    return self;
}
- (instancetype)initWithArray:(NSMutableArray *)array {
    self = [super init];
    if (self != nil) {
        [self setDailyWeatherForecasts:@[]];
        [self setBaseURLString:@"https://samples.openweathermap.org/data/2.5/forecast/daily"];
        [self setApiKey:@"7a5b07f444731d33ef61e8ea95a7415e"];
    }
    return self;
}

- (void)fetchJKDailyWeatherForecastForZipCode:(NSString *)zipCode withBlock:(CompletionBlock)block {
    
    NSURL *baseURL = [NSURL URLWithString: _baseURLString];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *queryItemZipCode = [NSURLQueryItem queryItemWithName:@"zip" value:zipCode];
    NSURLQueryItem *queryItemAPIKey = [NSURLQueryItem queryItemWithName:@"appid" value:_apiKey];
    NSArray<NSURLQueryItem *> *queryItems = @[
                                              queryItemZipCode,
                                              queryItemAPIKey
                                              ];
    
    urlComponents.queryItems = queryItems;
    NSURL *searchURL = [urlComponents URL];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:searchURL];
    
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
      ^(NSData * _Nullable data,
      NSURLResponse * _Nullable response,
        NSError * _Nullable error) {
        
          if (error != nil) {
              NSLog(@"Error fetching data: %@", error);
              block(nil, error);
              return;
          }
          
          if (data) {
              NSDictionary *fetchResultsDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
              if (![fetchResultsDict isKindOfClass:[NSDictionary class]]) {
                  NSLog(@"Unable to decode JSON Dictionary");
                  block(nil, error);
                  return;
              }
              NSString *city = fetchResultsDict[@"city"][@"name"];
              NSArray *days = fetchResultsDict[@"list"];
              NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
              
              for (NSDictionary *day in days) {
                  JKDailyWeatherForecast *dailyForecast = [[JKDailyWeatherForecast alloc] initWithDictionary:day forCity:city];
                  if (dailyForecast != nil) {
                      [mutableArray addObject:dailyForecast];
                  }else {
                      NSLog(@"Unable to initialize daily forcast object.");
                  }
              }
              [self setDailyWeatherForecasts:mutableArray];
              block(nil,nil);
          }
      
      }] resume];
}



@end
