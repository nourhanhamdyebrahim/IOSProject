//
//  JETSSpeakerBean.h
//  ProjectIOS
//
//  Created by JETS on 4/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JETSSpeakerBean : NSObject

@property NSNumber *idSpeaker ;
@property NSString *imageUrl ;
@property BOOL * gender ;
@property NSString * firstName ;
@property NSString * middleName ;
@property NSString * lastName ;
@property NSString * companyName;
@property NSString * title;
@property NSString * biography;
@property NSData * imageDataSp;
@property NSMutableArray * phones ;
@property NSMutableArray * mobiles ;

@end
