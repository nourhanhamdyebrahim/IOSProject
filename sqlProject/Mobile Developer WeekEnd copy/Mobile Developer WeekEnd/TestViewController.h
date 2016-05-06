//
//  TestViewController.h
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/22/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpeakerModel.h"
#import "UserModel.h"
#import "AgendaModel.h"
#import "ShowDataFile.h"
#import "UIImageView+WebCache.h"
#import "DataTableViewController.h"
#import "UIImage+GIF.h"
#import "UIImage+MultiFormat.h"
#import "UIImage+WebP.h"
#import "ManagerClass.h"
#import "PeakersNoRe.h"
@interface TestViewController : UIViewController <UITableViewDataSource, UITableViewDelegate , ShowDataFile>


@property NSMutableArray *arr;
@property (weak, nonatomic) IBOutlet UITableView *uitableview;


//@property exhibtorUrl * exUrlObj;
@property int state ;

@end
