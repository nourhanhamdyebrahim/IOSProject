//
//  JETSExhibitorsBean.h
//  ProjectIOS
//
//  Created by JETS on 4/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JETSExhibitorsBean : NSObject
@property(nonatomic) NSNumber *idEx;
@property(strong,nonatomic) NSString *imageURLExh;


@property(strong,nonatomic) NSData *imageDataExh;


@property(strong,nonatomic) NSString *companyAddress;
@property(strong,nonatomic) NSString *companyAbout;
@property(strong,nonatomic) NSString *fax;
@property(strong,nonatomic) NSString *contactName;
@property(strong,nonatomic) NSString *contactTitle;
@property(strong,nonatomic) NSString *companyUrl;
@property(strong,nonatomic) NSString *email;
@property(strong,nonatomic) NSString *countryName;
@property(strong,nonatomic) NSString *cityName;
@property(strong,nonatomic) NSString *companyName;
@property(strong,nonatomic) NSMutableArray *phones;
@property(strong,nonatomic) NSMutableArray *mobiles;
@end
