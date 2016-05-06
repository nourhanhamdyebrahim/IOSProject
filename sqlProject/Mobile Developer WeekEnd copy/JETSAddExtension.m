//
//  JETSAddExtension.m
//  ProjectIOS
//
//  Created by JETS on 4/9/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "JETSAddExtension.h"

@implementation JETSAddExtension

  +(NSString *) addExtension : (NSString *) str
   {
       NSString *list = str;
       NSArray *item = [list componentsSeparatedByString:@"?"];
       NSString *add = [item[0] stringByAppendingString:@".jpg?"];
       NSString *all = [add stringByAppendingString:item[1]];
       return all;
   }


@end
