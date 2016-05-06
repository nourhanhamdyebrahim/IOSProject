//
//  JETSUserBean.h
//  ProjectIOS
//
//  Created by JETS on 4/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JETSUserBean : NSObject

@property(nonatomic) NSNumber *idUser;
@property(strong,nonatomic) NSDate *birthDate;
@property(strong,nonatomic) NSString *code;
@property(strong,nonatomic) NSString *imageURL;
@property(strong,nonatomic) NSString *middleName;
@property(strong,nonatomic) NSString *gender;
@property(strong,nonatomic) NSString *firstName;
@property(strong,nonatomic) NSString *email;
@property(strong,nonatomic) NSString *lastName;
@property(strong,nonatomic) NSString *countryName;
@property(strong,nonatomic) NSString *cityName;
@property(strong,nonatomic) NSString *companyName;
@property(strong,nonatomic) NSString *title;
@property(strong,nonatomic) NSMutableArray *phones;
@property(strong,nonatomic) NSMutableArray *mobiles;
@end
