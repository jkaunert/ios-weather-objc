//
//  JKDailyWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by TuneUp Shop  on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JKDailyWeatherCollectionViewCell.h"
#import "JKDailyWeatherForecast.h"

@implementation JKDailyWeatherCollectionViewCell

- (JKDailyWeatherForecast *)dailyForecast {
    return [self dailyForecast];
}

- (void)setDailyForecast:(JKDailyWeatherForecast *)dailyForecast {
    dailyForecast = dailyForecast;
    [[self weatherIconImageView] setImage:[dailyForecast icon]];
    [[self cityNameLabel] setText:[dailyForecast city]];
    [[self temperatureLabel]setText:[NSString stringWithFormat:@"%@", [dailyForecast temperature]]];
}

@end
