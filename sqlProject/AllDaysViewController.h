//
//  AllDaysViewController.h
//  sqlProject
//
//  Created by JETS on 4/29/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AgendaModel.h"
#import "Agendas.h"
#import "Sessions.h"
#import "Speakers.h"
#import "Phones.h"
#import "Mobiles.h"
#import "SessionDetailAgendaViewController.h"
#import "UILabel+myLabel.h"
#import "ProgressHUD.h"
@interface AllDaysViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,ShowDataFile>
@property (strong, nonatomic) IBOutlet UITableView *allDays;
@property NSMutableArray * sesstionArr ;
//@property NSArray * firstSesstionArr ;
//@property NSArray * secoundSesstionArr ;
//@property NSArray * thirdSesstionArr ;
+(NSArray*) getSesstionForm:(int)DayNumber;

//@property Sessions *detailOfSession;
@end
