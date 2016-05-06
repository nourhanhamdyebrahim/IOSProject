//
//  PhoneUser.h
//  sqlProject
//
//  Created by JETS on 5/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface PhoneUser : NSManagedObject

@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) User *userPh;

@end
