//
//  JETSSessionBean.h
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/8/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Speakers.h"
#import "JETSSpeakerBean.h"
@interface JETSSessionBean : NSObject
@property NSString *name;
@property NSString *locat;
@property NSNumber *idNum;
@property NSString *sessionDescription;
@property NSNumber *status;
@property NSString *sessionType;
@property BOOL liked;

@property NSString *sessionTage;

@property NSMutableArray  *speakers; // will subtituted with speakers array


@property NSNumber *startDate;
@property NSNumber *endDate;
@end
