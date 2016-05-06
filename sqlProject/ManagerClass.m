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


-(void)insertSpeaker :(JETSSpeakerBean*) speak

{
    
    
     PeakersNoRe *speaker = [NSEntityDescription insertNewObjectForEntityForName:@"PeakersNoRe" inManagedObjectContext:_context];
    
    [speaker setIdSpeaker:[speak idSpeaker ]];
    [speaker setFirstName:[speak firstName ]];
    [speaker setMiddleName:[speak  middleName]];
    [speaker setLastName:[speak lastName]];
    [speaker setBiography:[speak biography]];
    [speaker setCompanyName:[speak  companyName]];
    [speaker setTitle:[speak  title]];
    
    
       // UIImage *im =  [UIImage imageNamed:@"Lighthouse.jpg"];
       // NSData * imData =    UIImagePNGRepresentation(im);
       [speaker setImageSpeNo:[speak imageDataSp]];
    
    
    
    
    NSMutableArray *mobArr =[speak  mobiles] ;
    
    for(int j=0 ; j<[mobArr count] ; j++)
    {
        MobileSpeakNore *mobil = [NSEntityDescription insertNewObjectForEntityForName:@"MobileSpeakNore" inManagedObjectContext:_context];
        
    [mobil setMobile:mobArr[j]];
        
        
        [speaker addMobilespeakerNoObject:mobil];
        
        
        
//        NSError * error = nil ;
//        if(![_context save:& error])
//        {
//            printf("error in mobiless ");
//        }
        

    }
    
    
    
    NSMutableArray *phonArr = [speak phones] ;
    for(int p =0; p < [phonArr count] ; p++)
    {
        
        
        PhonSpeakNo *phoneSpea = [NSEntityDescription insertNewObjectForEntityForName:@"PhonSpeakNo" inManagedObjectContext:_context];
        
        [phoneSpea setPhone: phonArr[p]];
    
        [speaker addPhonesspeakerNoObject:phoneSpea];
        
        
//        NSError * error = nil ;
//        if(![_context save:& error])
//        {
//            printf("error in phones ");
//        }
        

    }
    
    NSError * error = nil ;
    if(![_context save:& error])
    {
        printf("error in speakers ");
    }
    
    printf("done insert speaker\n");
    
    
}

//-----------------------------------------------------------------------------------------------------------
-(void)insertSession :(Sessions*) ses
{
    Sessions * session = [NSEntityDescription insertNewObjectForEntityForName:@"Sessions" inManagedObjectContext:_context];
    
    [session setIdSession:ses.idSession];
    [session setDescript:ses.descript];
[session setLiked:ses.liked];
    [session setLiked:0];
    [session setNameSession:ses.nameSession];
    [session setSessionTage:ses.sessionTage];
    [session setSessionType:ses.sessionType];
    [session setStatues:ses.statues];
    [session setLocationSession:ses.locationSession];
    
    [session setStartDateSession:ses.startDateSession];
    [session setEndDateSession:ses.endDateSession];
    
    //3k i cant force array to sesific object
    NSMutableArray   *speak = [NSMutableArray new];
    speak = ses.speakerssess ;
//    JETSSpeakerBean *b = [JETSSpeakerBean new];
//    [speak addObject:b];
  
    
   for(int i = 0 ; i<speak.count ; i++)
   {
        
          Speakers*speaker = [NSEntityDescription insertNewObjectForEntityForName:@"Speakers" inManagedObjectContext:_context];
    
    [speaker setIdSpeaker:[speak[i] idSpeaker ]];
    [speaker setFirstName:[speak [i] firstName ]];
    [speaker setMiddleName:[speak [i] middleName]];
    [speaker setLastName:[speak [i] lastName]];
    [speaker setBiography:[speak[i] biography]];
    [speaker setCompanyName:[speak [i] companyName]];
       
       
       //error change *** ///////////
 //   [speaker setGender:[ NSNumber numberWithBool:[speak [i] gender]]];
       
       
    [speaker setTitle:[speak [i] title]];
    
       //
    NSData * imdata=  UIImagePNGRepresentation([UIImage imageNamed:@"Lighthouse.jpg"]) ;
    [speaker setImageSpe:imdata];
    
   
       
       
       NSMutableArray *mobArr =[speak [i] mobiles] ;
       
       for(int j=0 ; j<[mobArr count] ; j++)
       {
            Mobiles *mobile = [NSEntityDescription insertNewObjectForEntityForName:@"Mobiles" inManagedObjectContext:_context];
           
          [mobile setMobile:mobArr[j] ];
           [speaker addMobilesspseObject:mobile];
       }
       
       
       
       NSMutableArray *phonArr = [speak[i] phones] ;
       for(int p ; p<[phonArr count] ; p++)
       {
           
    
    Phones *phone = [NSEntityDescription insertNewObjectForEntityForName:@"Phones" inManagedObjectContext:_context];
    
          [phone setPhone: phonArr[p]];
           
          [speaker addPhonesspseObject:phone];
           
           
    
       }
    
//    speaker.mobiles= [[NSSet alloc] initWithObjects:mobile,nil];
 //   speaker.phones = [[NSSet alloc] initWithObjects:phone,nil];
    
      
    
   // [session setSpeakers:[[NSSet alloc] initWithObjects:speaker,nil]];
    
      [session addSpeakerssessObject:speaker];
    
    //[self createAgenda:session];
//    Agendas * agenda= [NSEntityDescription insertNewObjectForEntityForName:@"Agendas" inManagedObjectContext:_context];
//    [agenda setStartDate:[NSNumber numberWithInteger:11]];
//    [agenda setEndDate:[NSNumber numberWithInteger:15]];
//    
//    [agenda setSessions:[[NSSet alloc] initWithObjects:session, nil] ] ;
//    
//      [agenda addSessionsObject:session];
    
    //    NSArray * ar = NSSearchPathForDirectoriesInDomains(<#NSSearchPathDirectory directory#>, <#NSSearchPathDomainMask domainMask#>, <#BOOL expandTilde#>)
    
    
    printf("done insert session\n");
    
    //NSLog(@"%@" ,[[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject]);
//    
//    NSError * error = nil ;
//    if(![_context save:& error])
//    {
//        printf("error in session ");
//    }
    
//    [_makeTf setText:nil];
//    [_mpgTf setText:nil];
       
       
       
}
    
    
    NSError * error = nil ;
    if(![_context save:& error])
    {
        printf("error in session ");
    }
    
}

//--------------------------------------------------------------------------------------------

-(void)insertusers :(User*)u
{
    
    

    
    User * user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:_context];
    
    [user setIdUser:u.idUser];
    [user setLastName:u.lastName];
    [user setFirstName:u.firstName];
    [user setMiddleName:u.middleName];
    [user setTitle:u.title];
    [user setEmail:u.email];
    [user setCompanyName:u.companyName];
    [user setCode:u.code];
    [user setCityName:u.cityName];
    
    
    NSData * imdata=  UIImagePNGRepresentation([UIImage imageNamed:@"Lighthouse.jpg"]) ;
    [user setImageUser:imdata];
    
    
    NSMutableArray *mobArr =[u mobilesUser] ;
    
    for(int j=0 ; j<[mobArr count] ; j++)
    {
        MobileUser *mobileUs = [NSEntityDescription insertNewObjectForEntityForName:@"MobileUser"inManagedObjectContext:_context];
        
        [mobileUs setMobile:mobArr[j] ];
        
        
        [user addMobilesUserObject:mobileUs];
        
        
    }

  
  
        //[user addMobilesObject:mobileUs];
    
    NSMutableArray *phonArr =[u phonesUser] ;
    
    for(int x=0 ; x<[phonArr count] ; x++)
    {
        PhoneUser *phoneUs = [NSEntityDescription insertNewObjectForEntityForName:@"PhoneUser"
                                                           inManagedObjectContext:_context];
        [phoneUs setPhone: phonArr[x] ];
        
        [user addPhonesUserObject:phoneUs];
    }

        //[user addPhonesObject:phoneUs];
    
    printf("done insert user\n");
    
    NSError * error = nil ;
    if(![_context save:& error])
    {
        printf("error in user ");
    }
}

//----------------------------------------------------------

-(void) createAgenda : (JETSAgendBean *) agendaBean
{
    Agendas * agenda= [NSEntityDescription insertNewObjectForEntityForName:@"Agendas" inManagedObjectContext:_context];
    
    
    
//    NSNumber *time = [NSNumber numberWithDouble:([agendaBean.startDate doubleValue] - 3600)];
    double d = [agendaBean.startDate doubleValue];
    NSTimeInterval interval = d;
    NSDate *online = [NSDate date];
    online = [NSDate dateWithTimeIntervalSince1970:interval];
    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
////    [dateFormatter setDateFormat:@"HH:mm:ss"];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSLog(@"result: %@", online);
    
   [agenda setStartDateAgenda:online];
    
    
//    NSNumber *timeEnd = [NSNumber numberWithDouble:([agendaBean.endDate doubleValue] - 3600)];
    NSTimeInterval intervalEnd = [agendaBean.endDate doubleValue];
    NSDate *onlineEn = [NSDate date];
    onlineEn = [NSDate dateWithTimeIntervalSince1970:intervalEnd];
    
//    NSDateFormatter *dateFormatterEnd = [[NSDateFormatter alloc] init];
//    //    [dateFormatter setDateFormat:@"HH:mm:ss"];
//    [dateFormatterEnd setDateFormat:@"yyyy-MM-dd"];
    NSLog(@"result: %@", onlineEn);
    
    

    [agenda setEndDateAgenda: onlineEn];
    
    NSMutableArray* ses=   [agendaBean sessions];
    
    for(int i= 0 ; i<[ ses count] ; i++ )
    {
    Sessions * session = [NSEntityDescription insertNewObjectForEntityForName:@"Sessions" inManagedObjectContext:_context];
    
        
        
    [session setIdSession:[ses[i] idNum]];
    [session setDescript:[ses[i] sessionDescription] ];
    //  [session setLiked:ses.liked];
    [session setLiked:0];
        
    [session setNameSession:[ses[i] name]];
    [session setSessionTage:[ses[i] sessionTage]];
    [session setSessionType:[ses[i] sessionType]];
    [session setStatues:[ses[i] status]];
    [session setLocationSession:[ses[i] locat]];
        
        double d = [[ses[i] startDate] doubleValue];
        NSTimeInterval interval = d;
        NSDate *online = [NSDate date];
        online = [NSDate dateWithTimeIntervalSince1970:interval];
    
        NSLog(@"result: %@", online);
        [session setStartDateSession:online];
        
        NSTimeInterval intervalEnd = [[ses[i] endDate] doubleValue];
        NSDate *onlineEn = [NSDate date];
        onlineEn = [NSDate dateWithTimeIntervalSince1970:intervalEnd];
        
        //    NSDateFormatter *dateFormatterEnd = [[NSDateFormatter alloc] init];
        //    //    [dateFormatter setDateFormat:@"HH:mm:ss"];
        //    [dateFormatterEnd setDateFormat:@"yyyy-MM-dd"];
        NSLog(@"result: %@", onlineEn);

        
        
    [session setEndDateSession:onlineEn];
    
    //3k i cant force array to sesific object
    NSMutableArray   *speak = [ses[i] speakers] ;
    //    JETSSpeakerBean *b = [JETSSpeakerBean new];
    //    [speak addObject:b];
    
    
    for(int i = 0 ; i<speak.count ; i++)
    {
        
        Speakers*speaker = [NSEntityDescription insertNewObjectForEntityForName:@"Speakers" inManagedObjectContext:_context];
        
        [speaker setIdSpeaker:[speak[i] idSpeaker ]];
        [speaker setFirstName:[speak [i] firstName ]];
        [speaker setMiddleName:[speak [i] middleName]];
        [speaker setLastName:[speak [i] lastName]];
        [speaker setBiography:[speak[i] biography]];
        [speaker setCompanyName:[speak [i] companyName]];
        
        
        //error change *** ///////////
        //   [speaker setGender:[ NSNumber numberWithBool:[speak [i] gender]]];
        
        
        [speaker setTitle:[speak [i] title]];
        
        
        
       // NSData * imdata=  UIImagePNGRepresentation([UIImage imageNamed:@"Lighthouse.jpg"]) ;
        [speaker setImageSpe:[speak[i] imageUser]];
        
        
        
        
        NSMutableArray *mobArr =[speak [i] mobiles] ;
        
        for(int j=0 ; j<[mobArr count] ; j++)
        {
            Mobiles *mobile = [NSEntityDescription insertNewObjectForEntityForName:@"Mobiles" inManagedObjectContext:_context];
            
            [mobile setMobile:mobArr[j] ];
            [speaker addMobilesspseObject:mobile];
        }
        
        
        
        NSMutableArray *phonArr = [speak[i] phones] ;
        for(int p ; p<[phonArr count] ; p++)
        {
            
            
            Phones *phone = [NSEntityDescription insertNewObjectForEntityForName:@"Phones" inManagedObjectContext:_context];
            
            [phone setPhone: phonArr[p]];
            [speaker addPhonesspseObject:phone];
        }

        
      //  [session setSpeakers:[[NSSet alloc] initWithObjects:speaker,nil]];
        [session addSpeakerssessObject:speaker];
    
    }
        [agenda addSessionsAgendaObject:session];
        
    }
    
   
    
    printf("create agenda done \n");
    
    NSError * error = nil ;
    if(![_context save:& error])
    {
        printf("error in creating agenda \n");
    }

}
//----------------------------------------------------------

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

//----------------------------------------------------------



-(void)insertexhibtors :(Exhibitors*)ex
{
    
    Exhibitors * exhibitor = [NSEntityDescription insertNewObjectForEntityForName:@"Exhibitors" inManagedObjectContext:_context];
    
    [exhibitor setIdEx:ex.idEx];
    [exhibitor setFax:ex.fax];
    
    
   //NSData * imdata=  UIImagePNGRepresentation([UIImage imageNamed:@"Lighthouse.jpg"]) ;
    
    [exhibitor setImageEx:ex.imageEx];
    [exhibitor setImageExUr:ex.imageExUr];
    [exhibitor setEmail:ex.email];
    [exhibitor setCityName:ex.cityName];
    [exhibitor setCompanyAbout:ex.companyAbout];
    
    [exhibitor setContactTitle:ex.contactTitle];
    
    [exhibitor setCompanyAddress:ex.companyAddress];
    [exhibitor setCompanyUrl:ex.companyUrl];
    
    [exhibitor setCompanyName:ex.companyName];
    [exhibitor setCountryName:ex.countryName];
    

        
        for (MobileEx *m in exhibitor.mobiles) {
            
            
            MobileEx *mobilee = [NSEntityDescription insertNewObjectForEntityForName:@"MobileEx" inManagedObjectContext:_context];
            
            [mobilee setMobile:m.mobile];
            NSLog(@"\n\n ********* %@ ********** \n\n",m);
            [ exhibitor addMobilesObject:mobilee];
            
        }
        
        
        
    
    
        
        for (PhonesEx *p in exhibitor.phones)
        {
            PhonesEx *Phonee = [NSEntityDescription insertNewObjectForEntityForName:@"PhonesEx" inManagedObjectContext:_context];
            
            [Phonee setPhone:p.phone];
            
            [ exhibitor addPhonesObject:Phonee];
            NSLog(@"\n\n ********* %@ ********** \n\n",p.phone);
            
            
        }
        
        
        

    
    

    

    
    printf("done insert exhibtors");
    
    NSError * error = nil ;
    if(![_context save:& error])
    {
        printf("error in exhibitors ");
    }
    
}

//--------------------------------------------------

-(void) deleteAnyEntity : (NSString*) entityName
{
    
    NSFetchRequest * request = [[NSFetchRequest alloc]initWithEntityName:entityName];
    [request setIncludesPropertyValues:NO];
    
    NSError * error2;
    NSArray * resultManegObj = [_context executeFetchRequest:request error:&error2];
    
    if(resultManegObj == nil)
    {
        printf("result is null from fetch");
    }
    
    for(NSManagedObject *object in resultManegObj)
    {
        [_context deleteObject:object];
    }
    
    error2 = nil;
    if(![_context save:&error2])
    {
        printf("error to delete the entity ");
    }
    
    
    printf("the entity deleted ");
}


@end