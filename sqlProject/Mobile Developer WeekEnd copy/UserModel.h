//
//  UserModel.h
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/8/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParseDelegat.h"
#import "NetworkController.h"
#import "JETSURLs.h"
#import  "JETSUserBean.h"
#import "JETSAddExtension.h"
#import "User.h"
#import "ShowDataFile.h"
#import "ManagerClass.h"
#import "MobileUser.h"
#import "PhoneUser.h"
@interface UserModel : NSObject<ParseDelegat>

-(void)test;
@property id <ShowDataFile> showdataDelegate;

@end
