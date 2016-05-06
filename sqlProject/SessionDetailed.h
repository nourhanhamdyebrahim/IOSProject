//
//  ArticleTableViewController.h
//  TableViewLayout
//
//  Created by Oliver Foggin on 29/10/2014.
//  Copyright (c) 2014 Oliver Foggin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ViewController.h"
#import "Sessions.h"
#import "AgendaModel.h"
#import "Agendas.h"
#import "Speakers.h"
#import "Phones.h"
#import "Mobiles.h"
#import "SpeakerDetailViewController.h"
#import "ProgressHUD.h"


@interface SessionDetailed : UIViewController <UITableViewDataSource,UITableViewDataSource>


@property IBOutlet UITableView *speakerView;

@property Sessions *sessionDetails;

- (IBAction)registerSessionAction:(id)sender;


@end