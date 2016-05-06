//
//  Agendas.h
//  sqlProject
//
//  Created by JETS on 5/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Sessions;

@interface Agendas : NSManagedObject

@property (nonatomic, retain) NSDate * endDateAgenda;
@property (nonatomic, retain) NSDate * startDateAgenda;
@property (nonatomic, retain) NSSet *sessionsAgenda;
@end

@interface Agendas (CoreDataGeneratedAccessors)

- (void)addSessionsAgendaObject:(Sessions *)value;
- (void)removeSessionsAgendaObject:(Sessions *)value;
- (void)addSessionsAgenda:(NSSet *)values;
- (void)removeSessionsAgenda:(NSSet *)values;

@end
