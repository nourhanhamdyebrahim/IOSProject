//
//  AgendaModel.h
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/8/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParseDelegat.h"
#import "NetworkController.h"
#import "JETSURLs.h"
#import "JETSAgendBean.h"
#import "JETSSessionBean.h"
#import "Agendas.h"
#import "Sessions.h"
#import "Speakers.h"
#import "Mobiles.h"
#import "Phones.h"
#import "ManagerClass.h"
#import "ShowDataFile.h"
#import "JETSAddExtension.h"
@interface AgendaModel : NSObject<ParseDelegat>

-(void)test;
@property id <ShowDataFile> showdataDelegate;

@end
