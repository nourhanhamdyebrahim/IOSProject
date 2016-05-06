//
//  ParseDelegat.h
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/7/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

@protocol ParseDelegat <NSObject>

@required
-(void)jsonParser:(NSDictionary*)JsonData;
-(void) statuesNet:(int)state;


@end