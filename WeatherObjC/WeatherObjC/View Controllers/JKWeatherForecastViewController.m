//
//  JKWeatherForecastViewController.m
//  WeatherObjC
//
//  Created by TuneUp Shop  on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JKWeatherForecastViewController.h"
#import <UIKit/UIKit.h>

@interface JKWeatherForecastViewController ()
@end

@implementation JKWeatherForecastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark SearchBar Delegate
-(void)citySearchBarSearchButtonClicked:(UISearchBar *)citySearchBar {
    [citySearchBar resignFirstResponder];
    [_dailyWeatherForecastController fetchJKDailyWeatherForecastForZipCode:[citySearchBar text] withBlock:^(JKDailyWeatherForecast *dailyWeatherForecast, NSError *error) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [[self dailyWeatherForecastCollectionView] reloadData];
        }];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark CollectionView Data Source
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_dailyWeatherForecastController dailyWeatherForecasts].count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JKDailyWeatherCollectionViewCell *cell = (JKDailyWeatherCollectionViewCell *)[_dailyWeatherForecastCollectionView dequeueReusableCellWithReuseIdentifier:@"DailyWeatherCollectionViewCell" forIndexPath:indexPath];
    JKDailyWeatherForecast *dailyForecast = [[_dailyWeatherForecastController dailyWeatherForecasts] objectAtIndex:indexPath.row];
    
    [cell setDailyForecast:dailyForecast];
    
    return cell;
}



@end
