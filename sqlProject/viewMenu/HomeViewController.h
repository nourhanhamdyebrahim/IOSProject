//
//  HomeViewController.h
//  TesterMenu
//
//  Created by JETS on 4/7/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"


@interface HomeViewController : UIViewController <SlideNavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imgHome;

@end

