//
//  ManagerClass.h
//  sqlProject
//
//  Created by JETS on 4/12/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//  Yasser Ahmed

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "JETSSpeakerBean.h"
#import "JETSSessionBean.h"
#import "Speakers.h"
#import "Sessions.h"
#import "Agendas.h"
#import "Phones.h"
#import "Mobiles.h"
#import "Exhibitors.h"
#import "MobileEx.h"
#import "PhonesEx.h"
#import "User.h"
#import "MobileUser.h"
#import "PhoneUser.h"
#import "PeakersNoRe.h"
#import "PhonSpeakNo.h"
#import "MobileSpeakNore.h"

#import "JETSAgendBean.h"
#import "JETSExhibitorsBean.h"
#import "JETSSessionBean.h"
//#import "JETSSpeakerBean.h"
//#import "JETSSpeakerBean.m"
#import "JETSUserBean.h"
@interface ManagerClass : NSObject

@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) NSManagedObjectModel *model;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistSC;

+(ManagerClass *) myManagerObjectMethod;

//-(void)insertSession;
-(void)insertSession :(Sessions*) ses ;
//-(void)insertusers;
-(void)insertusers :(User*)u ;


//-(void)insertexhibtors;
-(void)insertexhibtors :(Exhibitors*)ex ;

//-(void) createAgenda;
-(void) createAgenda : (Agendas*) agendaBean ;


-(void)insertSpeaker :(JETSSpeakerBean*) speak ;


-(void) deleteAnyEntity : (NSString*) entityName;
-(NSArray*) fetchEnyObj : (NSString*) entityName;

@end