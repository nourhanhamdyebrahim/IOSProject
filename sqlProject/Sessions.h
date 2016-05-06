//
//  Sessions.h
//  sqlProject
//
//  Created by JETS on 5/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Agendas, Speakers;

@interface Sessions : NSManagedObject

@property (nonatomic, retain) NSString * descript;
@property (nonatomic, retain) NSDate * endDateSession;
@property (nonatomic, retain) NSNumber * idSession;
@property (nonatomic, retain) NSNumber * liked;
@property (nonatomic, retain) NSString * locationSession;
@property (nonatomic, retain) NSString * nameSession;
@property (nonatomic, retain) NSString * sessionTage;
@property (nonatomic, retain) NSString * sessionType;
@property (nonatomic, retain) NSDate * startDateSession;
@property (nonatomic, retain) NSNumber * statues;
@property (nonatomic, retain) Agendas *agenda;
@property (nonatomic, retain) NSSet *speakerssess;
@end

@interface Sessions (CoreDataGeneratedAccessors)

- (void)addSpeakerssessObject:(Speakers *)value;
- (void)removeSpeakerssessObject:(Speakers *)value;
- (void)addSpeakerssess:(NSSet *)values;
- (void)removeSpeakerssess:(NSSet *)values;

@end
