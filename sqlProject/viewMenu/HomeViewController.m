//
//  HomeViewController.m
//  TesterMenu
//
//  Created by JETS on 4/7/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "HomeViewController.h"


@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_imgHome setImage:[UIImage imageNamed:@"speaker.png"]];
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
	return NO;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
	return YES;
}

@end
