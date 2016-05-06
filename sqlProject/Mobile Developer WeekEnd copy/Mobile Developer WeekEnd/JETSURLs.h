//
//  JETSURLs.h
//  ProjectIOS
//
//  Created by JETS on 4/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>

static  NSString *userUrl=@"http://www.mobiledeveloperweekend.net/service/login?userName=eng.medhat.cs.h@gmail.com&password=medhat123";
static  NSString *speakerUrl=@"http://www.mobiledeveloperweekend.net/service/getSpeakers?userName=eng.medhat.cs.h@gmail.com";
static  NSString *exhibitorUrl=@"http://www.mobiledeveloperweekend.net/service/getExhibitors?userName=eng.medhat.cs.h@gmail.com";
static  NSString *agendasUrl=@"http://www.mobiledeveloperweekend.net/service/getSessions?userName=eng.medhat.cs.h%40gmail.com";
@interface JETSURLs : NSObject
+(NSString*) getUserURL;
+(NSString*) getSpeackerURL;
+(NSString*) getexhibitorURL;
+(NSString*) getAgendasURL;
@end
