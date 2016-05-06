//
//  DataTableViewController.h
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/18/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "JETSSpeakerBean.h"
#import "PeakersNoRe.h"

@interface DataTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *lbl_name;

@property (weak, nonatomic) IBOutlet UILabel *lbl_work;

@property (weak, nonatomic) IBOutlet UILabel *lbl_company;
@property (weak, nonatomic) IBOutlet UITextView *txt_details;
@property (weak, nonatomic) IBOutlet UIImageView *imgVu;

@property (strong , nonatomic) PeakersNoRe
*speaker_bean_obj;
@end
