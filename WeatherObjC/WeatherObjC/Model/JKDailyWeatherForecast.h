//
//  JKDailyWeatherForecast.h
//  WeatherObjC
//
//  Created by TuneUp Shop  on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

// To parse this JSON:
//
//   NSError *error;
//   JKDailyWeatherForecast *dailyWeatherForecast = [JKDailyWeatherForecast fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class JKDailyWeatherForecast;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface JKDailyWeatherForecast : NSObject

@property NSString *city;
@property NSNumber *temperature;
@property UIImage *icon;

- (instancetype)initFromCity: (NSString *)city withTemperature: (NSNumber *)temperature usingIconWithName: (NSString *)iconName;

- (instancetype)initWithDictionary: (NSDictionary *)dictionary forCity: (NSString *)city;

@end

NS_ASSUME_NONNULL_END
