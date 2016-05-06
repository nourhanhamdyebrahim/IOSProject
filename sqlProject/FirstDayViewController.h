//
//  FirstDayViewController.h
//  sqlProject
//
//  Created by JETS on 4/29/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllDaysViewController.h"
#import "SessionDetailAgendaViewController.h"
#import "UILabel+myLabel.h"
@interface FirstDayViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *firstDay;
@end
