//
//  JKWeatherForecastViewController.h
//  WeatherObjC
//
//  Created by TuneUp Shop  on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKDailyWeatherForecastController.h"
#import "JKDailyWeatherCollectionViewCell.h"

@interface JKWeatherForecastViewController : UIViewController <UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

- (void)citySearchBarSearchButtonClicked:(UISearchBar *)citySearchBar;

@property JKDailyWeatherForecastController *dailyWeatherForecastController;
@property (weak, nonatomic) IBOutlet UICollectionView *dailyWeatherForecastCollectionView;
@property (weak, nonatomic) IBOutlet UISearchBar *citySearchBar;

@end

