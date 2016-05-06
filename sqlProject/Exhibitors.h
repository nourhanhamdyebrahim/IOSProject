//
//  Exhibitors.h
//  sqlProject
//
//  Created by JETS on 5/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MobileEx, PhonesEx;

@interface Exhibitors : NSManagedObject

@property (nonatomic, retain) NSString * cityName;
@property (nonatomic, retain) NSString * companyAbout;
@property (nonatomic, retain) NSString * companyAddress;
@property (nonatomic, retain) NSString * companyName;
@property (nonatomic, retain) NSString * companyUrl;
@property (nonatomic, retain) NSString * contactName;
@property (nonatomic, retain) NSString * contactTitle;
@property (nonatomic, retain) NSString * countryName;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * fax;
@property (nonatomic, retain) NSNumber * idEx;
@property (nonatomic, retain) NSData * imageEx;
@property (nonatomic, retain) NSString * imageExUr;
@property (nonatomic, retain) NSSet *mobiles;
@property (nonatomic, retain) NSSet *phones;
@end

@interface Exhibitors (CoreDataGeneratedAccessors)

- (void)addMobilesObject:(MobileEx *)value;
- (void)removeMobilesObject:(MobileEx *)value;
- (void)addMobiles:(NSSet *)values;
- (void)removeMobiles:(NSSet *)values;

- (void)addPhonesObject:(PhonesEx *)value;
- (void)removePhonesObject:(PhonesEx *)value;
- (void)addPhones:(NSSet *)values;
- (void)removePhones:(NSSet *)values;

@end
