//
//  ExhibitorsModel.h
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/10/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParseDelegat.h"
#import "NetworkController.h"
#import "JETSURLs.h"
#import "JETSExhibitorsBean.h"
#import "JETSAddExtension.h"
#import "exhibtorDelgate.h"
#import "exhibtorDelgate.h"
#import "Exhibitors.h"
#import "MobileEx.h"
#import "PhonesEx.h"
#import "ManagerClass.h"
@interface ExhibitorsModel : NSObject<ParseDelegat >

@property id<exhibtorDelgate> exhibDelegate;

-(void)test;

@end
