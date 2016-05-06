//
//  TableViewController.h
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/6/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpeakerModel.h"
#import "UserModel.h"
#import "AgendaModel.h"
#import "SpeakerModel.h"
#import "ExhibitorsModel.h"
#import "ShowDataFile.h"
#import "UIImageView+WebCache.h"
#import "DataTableViewController.h"

@interface TableViewController : UITableViewController <ShowDataFile>
@property NSMutableArray *arr;

@end
