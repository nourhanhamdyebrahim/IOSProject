//
//  SpeakerModel.h
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/7/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParseDelegat.h"
#import "NetworkController.h"
#import "JETSURLs.h"
#import "JETSSpeakerBean.h"
#import "JETSAddExtension.h"
#import "TableViewController.h"
#import "ShowDataFile.h"
#import "PeakersNoRe.h"
#import "PhonSpeakNo.h"
#import "MobileSpeakNore.h"
#import "ManagerClass.h"


@interface SpeakerModel : NSObject <ParseDelegat>

@property(strong,nonatomic) NSMutableArray *speakerArr;
-(void)test;

@property id <ShowDataFile> showdataDelegate;



@end
