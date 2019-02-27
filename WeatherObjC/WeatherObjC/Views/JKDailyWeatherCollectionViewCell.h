//
//  JKDailyWeatherCollectionViewCell.h
//  WeatherObjC
//
//  Created by TuneUp Shop  on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKDailyWeatherForecast.h"


@interface JKDailyWeatherCollectionViewCell : UICollectionViewCell

@property (nonatomic)JKDailyWeatherForecast *dailyForecast;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;

@end

