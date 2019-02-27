//
//  JKDailyWeatherForecast.m
//  WeatherObjC
//
//  Created by TuneUp Shop  on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JKDailyWeatherForecast.h"


NS_ASSUME_NONNULL_BEGIN


@implementation JKDailyWeatherForecast

- (instancetype)initFromCity:(NSString *)city withTemperature:(NSNumber *)temperature usingIconWithName:(NSString *)iconName {
    self = [super init];
    if (self != nil) {
        [self setCity:city];
        [self setTemperature:temperature];
        [self setIcon:[UIImage imageNamed:iconName]];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary forCity:(NSString *)city {
    
    NSNumber *temperature = dictionary[@"temp"][@"day"];
    NSString *iconName = [dictionary[@"weather"] objectAtIndex:0][@"icon"];
    return [self initFromCity:city withTemperature:temperature usingIconWithName:iconName];
}

@end

NS_ASSUME_NONNULL_END

