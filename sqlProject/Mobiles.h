//
//  Mobiles.h
//  sqlProject
//
//  Created by JETS on 5/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Speakers;

@interface Mobiles : NSManagedObject

@property (nonatomic, retain) NSString * mobile;
@property (nonatomic, retain) Speakers *speakermobi;

@end
