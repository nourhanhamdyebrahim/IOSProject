//
//  Speakers.h
//  sqlProject
//
//  Created by JETS on 5/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Mobiles, Phones, Sessions;

@interface Speakers : NSManagedObject

@property (nonatomic, retain) NSString * biography;
@property (nonatomic, retain) NSString * companyName;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSNumber * gender;
@property (nonatomic, retain) NSNumber * idSpeaker;
@property (nonatomic, retain) NSData * imageSpe;
@property (nonatomic, retain) NSString * imageSpeakUrl;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * middleName;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *mobilesspse;
@property (nonatomic, retain) NSSet *phonesspse;
@property (nonatomic, retain) NSSet *sessionsSpea;
@end

@interface Speakers (CoreDataGeneratedAccessors)

- (void)addMobilesspseObject:(Mobiles *)value;
- (void)removeMobilesspseObject:(Mobiles *)value;
- (void)addMobilesspse:(NSSet *)values;
- (void)removeMobilesspse:(NSSet *)values;

- (void)addPhonesspseObject:(Phones *)value;
- (void)removePhonesspseObject:(Phones *)value;
- (void)addPhonesspse:(NSSet *)values;
- (void)removePhonesspse:(NSSet *)values;

- (void)addSessionsSpeaObject:(Sessions *)value;
- (void)removeSessionsSpeaObject:(Sessions *)value;
- (void)addSessionsSpea:(NSSet *)values;
- (void)removeSessionsSpea:(NSSet *)values;

@end
