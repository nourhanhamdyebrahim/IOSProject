//
//  ManagerClass.h
//  sqlProject
//
//  Created by JETS on 4/12/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//  Yasser Ahmed

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface ManagerClass : NSObject

@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) NSManagedObjectModel *model;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistSC;

+(ManagerClass *) myManagerObjectMethod;

- (void)insertSession;
-(void)insertusers;
-(NSArray*) fetchEnyObj : (NSString*) entityName;

//-(void) deleteEnyEntity : (NSString*) entityName ;

@end