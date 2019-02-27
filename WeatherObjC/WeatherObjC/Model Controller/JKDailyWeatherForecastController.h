//
//  JKDailyWeatherForecastController.h
//  WeatherObjC
//
//  Created by TuneUp Shop  on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKDailyWeatherForecast.h"

typedef void (^CompletionBlock)(JKDailyWeatherForecast *dailyWeatherForecast, NSError *error);



@interface JKDailyWeatherForecastController : NSObject

@property NSString *baseURLString;
@property NSString *apiKey;


@property NSArray *dailyWeatherForecasts;

-(instancetype)init;

-(void)fetchJKDailyWeatherForecastForZipCode: (NSString *)zipCode withBlock:
(CompletionBlock)block;

@end


