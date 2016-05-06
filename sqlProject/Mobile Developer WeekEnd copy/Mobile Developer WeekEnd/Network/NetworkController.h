//
//  NetworkController.h
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/6/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "ParseDelegat.h"
#import "exhibtorDelgate.h"
@interface NetworkController : NSObject

@property id <ParseDelegat> jsonParserDelegate;


+ (id) ShardedNetworkController;
-(void)GetJsonFromURL:(NSString*)url;

@end
