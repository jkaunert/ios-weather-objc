//
//  JKWeatherForecastViewController.h
//  WeatherObjC
//
//  Created by TuneUp Shop  on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JKWeatherForecastViewController : UIViewController <UISearchBarDelegate>

- (void)citySearchBar:(UISearchBar *)citySearchBar textDidChange:(NSString *)citySearchText;

- (void)citySearchBarSearchButtonClicked:(UISearchBar *)citySearchBar;

@property (weak, nonatomic) IBOutlet UISearchBar *citySearchBar;

@end

NS_ASSUME_NONNULL_END
