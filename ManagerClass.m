//
//  ManagerClass.m
//  sqlProject
//
//  Created by JETS on 4/12/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//  Yasser Ahmed

#import "ManagerClass.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import <UIKit/UIKit.h>

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

@interface ManagerClass ()

- (void)setupManagedObjects;

@end

@implementation ManagerClass

static ManagerClass *manager;

+(ManagerClass *)myManagerObjectMethod
{
    if (!manager)
    {
        static dispatch_once_t onceToken;
        dispatch_once( &onceToken ,
        ^{
            manager = [[ManagerClass alloc] init];
            printf("\n*** the manager initialized ***\n");
        });
        
    }
    
    printf("\n return the singletone manager object \n");
    return manager;
}


- (id)init
{
    self = [super init];
    
    if (self)
    {
        [self setupManagedObjects];
    }
    
    return self;
}


-(void)setupManagedObjects
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSURL *documentDirectoryURL = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask][0];
    NSURL *persistentURL = [documentDirectoryURL URLByAppendingPathComponent:@"sqlProject.sqlite"];
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"sqlProject" withExtension:@"momd"];
    
    self.model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    self.persistSC = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.model];
    
    NSError *error = nil;
    NSPersistentStore *persistentStore = [self.persistSC addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:persistentURL options:nil error:&error];
    
    if (persistentStore)
    {
        self.context = [[NSManagedObjectContext alloc] init];
        self.context.persistentStoreCoordinator = self.persistSC;
    }
    else
    {
        NSLog(@"ERROR IN MANAGER CLASS : %@", error.description);
    }
}


//--------------------------------------------------------------------------------------------


-(void)insertSession
{
    Sessions * session = [NSEntityDescription insertNewObjectForEntityForName:@"Sessions" inManagedObjectContext:_context];
    
    [session setIdSession:[NSNumber numberWithInteger:1]];
    [session setDescript:@"discriptionsession"];
    [session setLiked:[NSNumber numberWithBool:NO]];
    [session setNameSession:@"session name"];
    [session setSessionTage:@"tage"];
    [session setSessionType:@"type"];
    [session setStatues:[NSNumber numberWithInteger:0]];
    [session setLocation:@"alex"];
    [session setStartData:[NSNumber numberWithInteger:451]];
    [session setEndDate:[NSNumber numberWithInteger:125]];
    
    
    Speakers*speaker = [NSEntityDescription insertNewObjectForEntityForName:@"Speakers" inManagedObjectContext:_context];
    
    [speaker setIdSpeaker:[NSNumber numberWithInt:1]];
    [speaker setFirstName:@"speaker name"];
    [speaker setMiddleName:@"farrag"];
    [speaker setLastName:@"ibrahem"];
    [speaker setBiography:@"hi"];
    [speaker setCompanyName:@"iti"];
    [speaker setGender:[NSNumber numberWithBool:YES]];
    [speaker setTitle:@"maneg"];
    
//    
//    UIImage *im =  [_imgview image];
//    NSData * imData =    UIImagePNGRepresentation(im);
    //[speaker setImage:imData];
    
    Mobiles *mobile = [NSEntityDescription insertNewObjectForEntityForName:@"Mobiles" inManagedObjectContext:_context];
    
    [mobile setMobile:@"010225869"];
    
    
    Phones *phone = [NSEntityDescription insertNewObjectForEntityForName:@"Phones" inManagedObjectContext:_context];
    
    [phone setPhone:@"03668559"];
    
    
    speaker.mobiles= [[NSSet alloc] initWithObjects:mobile, nil];
    speaker.phones = [[NSSet alloc] initWithObjects:phone, nil];
    
    //  [speaker addMobilesObject:mobile];
    //  [speaker addPhonesObject:phone];
    
    
    [session setSpeakers:[[NSSet alloc] initWithObjects:speaker, nil]];
    //
    //  [session addSpeakersObject:speaker];
    
    Agendas * agenda= [NSEntityDescription insertNewObjectForEntityForName:@"Agendas" inManagedObjectContext:_context];
    [agenda setStartDate:[NSNumber numberWithInteger:11]];
    [agenda setEndDate:[NSNumber numberWithInteger:15]];
    
    [agenda setSessions:[[NSSet alloc] initWithObjects:session, nil] ] ;
    //
    //  [agenda addSessionsObject:session];
    
    //    NSArray * ar = NSSearchPathForDirectoriesInDomains(<#NSSearchPathDirectory directory#>, <#NSSearchPathDomainMask domainMask#>, <#BOOL expandTilde#>)
    
    
    printf("done insert session\n");
    
    NSLog(@"%@" ,[[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject]);
    
    NSError * error = nil ;
    if(![_context save:& error])
    {
        printf("error");
    }
    
//    [_makeTf setText:nil];
//    [_mpgTf setText:nil];
}

//--------------------------------------------------------------------------------------------

-(void)insertusers
{
    
    User * user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:_context];
    
    [user setIdUser:[NSNumber numberWithInteger:1]];
    [user setLastName:@"ibrahem"];
    [user setFirstName:@"user name"];
    [user setMiddleName:@"farrag"];
    [user setTitle:@"eng"];
    [user setEmail:@"w.eman"];
    [user setCompanyName:@"iti"];
    [user setCode:@"2588555"];
    [user setCityName:@"alex"];
    
//    NSData * imageWithdata =  UIImagePNGRepresentation([_imgview image]) ;
//    [user setImage:imageWithdata];

    MobileUser *mobileUs= [NSEntityDescription insertNewObjectForEntityForName:@"MobileUser"inManagedObjectContext:_context];
    [mobileUs setMobile:@"010000025"];
    
    user.mobiles= [[NSSet alloc] initWithObjects:mobileUs, nil];
        [user addMobilesObject:mobileUs];
    
    
    PhoneUser *phoneUs = [NSEntityDescription insertNewObjectForEntityForName:@"PhoneUser"
        inManagedObjectContext:_context];
    [phoneUs setPhone:@"02668559"];
    
    user.phones= [[NSSet alloc] initWithObjects:phoneUs, nil];
        [user addPhonesObject:phoneUs];
    
    
    printf("done insert user\n");
    
}


-(NSArray*) fetchEnyObj : (NSString*) entityName
{
    
    NSFetchRequest * request = [[ NSFetchRequest alloc]initWithEntityName:entityName];
    
    NSError * error ;
    NSMutableArray * resultArray = [[_context executeFetchRequest:request error:&error] mutableCopy];
    
    
    if(resultArray == nil)
    {
        printf("result is null from fetch");
    }
    
    return resultArray ;
}


@end