//
//  PeakersNoRe.h
//  sqlProject
//
//  Created by JETS on 5/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MobileSpeakNore, PhonSpeakNo;

@interface PeakersNoRe : NSManagedObject

@property (nonatomic, retain) NSString * biography;
@property (nonatomic, retain) NSString * companyName;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSNumber * gender;
@property (nonatomic, retain) NSNumber * idSpeaker;
@property (nonatomic, retain) NSData * imageSpeNo;
@property (nonatomic, retain) NSString * imagUrlSpea;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * middleName;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *mobilespeakerNo;
@property (nonatomic, retain) NSSet *phonesspeakerNo;
@end

@interface PeakersNoRe (CoreDataGeneratedAccessors)

- (void)addMobilespeakerNoObject:(MobileSpeakNore *)value;
- (void)removeMobilespeakerNoObject:(MobileSpeakNore *)value;
- (void)addMobilespeakerNo:(NSSet *)values;
- (void)removeMobilespeakerNo:(NSSet *)values;

- (void)addPhonesspeakerNoObject:(PhonSpeakNo *)value;
- (void)removePhonesspeakerNoObject:(PhonSpeakNo *)value;
- (void)addPhonesspeakerNo:(NSSet *)values;
- (void)removePhonesspeakerNo:(NSSet *)values;

@end
