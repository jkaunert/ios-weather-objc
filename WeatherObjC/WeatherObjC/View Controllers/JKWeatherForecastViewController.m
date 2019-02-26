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


-(void)citySearchBarSearchButtonClicked:(UISearchBar *)citySearchBar {
    [citySearchBar resignFirstResponder];
}

- (void)citySearchBar:(UISearchBar *)citySearchBar textDidChange:(NSString *)citySearchText {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
