//
//  User.h
//  sqlProject
//
//  Created by JETS on 5/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MobileUser, PhoneUser;

@interface User : NSManagedObject

@property (nonatomic, retain) NSDate * birthDate;
@property (nonatomic, retain) NSString * cityName;
@property (nonatomic, retain) NSString * code;
@property (nonatomic, retain) NSString * companyName;
@property (nonatomic, retain) NSString * countryName;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSNumber * gender;
@property (nonatomic, retain) NSNumber * idUser;
@property (nonatomic, retain) NSData * imageUser;
@property (nonatomic, retain) NSString * imageUserUrl;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * middleName;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *mobilesUser;
@property (nonatomic, retain) NSSet *phonesUser;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addMobilesUserObject:(MobileUser *)value;
- (void)removeMobilesUserObject:(MobileUser *)value;
- (void)addMobilesUser:(NSSet *)values;
- (void)removeMobilesUser:(NSSet *)values;

- (void)addPhonesUserObject:(PhoneUser *)value;
- (void)removePhonesUserObject:(PhoneUser *)value;
- (void)addPhonesUser:(NSSet *)values;
- (void)removePhonesUser:(NSSet *)values;

@end
