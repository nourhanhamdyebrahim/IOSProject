//
//  ProfileViewController.h
//  sqlProject
//
//  Created by JETS on 4/23/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkController.h"
#import "ShowDataFile.h"
#import "UserModel.h"
#import "UIImageView+WebCache.h"
#import  "JETSUserBean.h"
#import "ProgressHUD.h"
#import "User.h"
#import "MobileUser.h"
#import "PhoneUser.h"
#import "ZXingObjC.h"
@interface ProfileViewController : UITableViewController <ShowDataFile>
@property (weak, nonatomic) IBOutlet UIImageView *qrcode2;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *fullName;
@property (weak, nonatomic) IBOutlet UILabel *job;
@property (weak, nonatomic) IBOutlet UILabel *companyName;
- (IBAction)moreData:(id)sender;
@property (weak, nonatomic) IBOutlet UITableViewCell *moreDataCell;
@property (weak, nonatomic) IBOutlet UITextView *email;
@property (weak, nonatomic) IBOutlet UITextView *mobile;
@property (weak, nonatomic) IBOutlet UIImageView *qrcode1;

@end
