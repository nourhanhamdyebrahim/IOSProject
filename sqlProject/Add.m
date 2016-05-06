//
//  Add.m
//  coreObjective
//
//  Created by JETS on 4/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "Add.h"
//#import "AppDelegate.h"
//
//#import "Speakers.h"
//#import "Sessions.h"
//#import "Agendas.h"
//#import "Phones.h"
//#import "Mobiles.h"
//
////#import "DataBaseManeger.h"
////#import "CoreDataManager.h"
//
//#import "Exhibitors.h"
//#import "MobileEx.h"
//#import "PhonesEx.h"
//#import "User.h"
//
//#import "MobileUser.h"
//#import "PhoneUser.h"

#import "ManagerClass.h"

@implementation Add

ManagerClass * mng;

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
//  CoreDataManager* dbManager=  [CoreDataManager sharedManager];
// _managedObjectContext =   [dbManager managedObjectContext ];
    
//AppDelegate * appDelegate= [[UIApplication sharedApplication] delegate];
// _managedObjectContext =   [appDelegate managedObjectContext] ;
    
	// Do any additional setup after loading the view.
    
    //yasser block of code : singletone initialization
    //{
        mng = [ManagerClass myManagerObjectMethod];
        _context = [mng context];
    
    //}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)retrieveAction:(id)sender {
  
}

//-(void)insertSession
//{
//    
//    Sessions * session = [NSEntityDescription insertNewObjectForEntityForName:@"Sessions" inManagedObjectContext:_context];
//    
//    [session setIdSession:[NSNumber numberWithInteger:1]];
//    [session setDescript:@"discriptionsession"];
//    [session setLiked:[NSNumber numberWithBool:NO] ];
//    [session setNameSession:@"namesession5"];
//    [session setSessionTage:@"tage"];
//    [session setSessionType:@"type"];
//    [session setStatues:[NSNumber numberWithInteger:0]];
//    [session setLocation:@"alex"];
//    [session setStartData:[NSNumber numberWithInteger:451]];
//    [session setEndDate:[NSNumber numberWithInteger:125]];
//    
//    
//    Speakers*speaker = [NSEntityDescription insertNewObjectForEntityForName:@"Speakers" inManagedObjectContext:_context];
//    
//    [speaker setIdSpeaker:[NSNumber numberWithInt:1]];
//    [speaker setFirstName:@"wafaa"];
//    [speaker setMiddleName:@"farrag"];
//    [speaker setLastName:@"ibrahem"];
//    [speaker setBiography:@"hi"];
//    [speaker setCompanyName:@"iti"];
//    [speaker setGender:[NSNumber numberWithBool:YES]];
//    [speaker setTitle:@"maneg"];
//    
//    
//    UIImage *im =  [_imgview image];
//    NSData * imData =    UIImagePNGRepresentation(im);
//    [speaker setImage:imData];
//    
//    Mobiles *mobile = [NSEntityDescription insertNewObjectForEntityForName:@"Mobiles" inManagedObjectContext:_context];
//    
//    [mobile setMobile:@"010225869"];
//    
//    
//    Phones *phone = [NSEntityDescription insertNewObjectForEntityForName:@"Phones" inManagedObjectContext:_context];
//    
//    [phone setPhone:@"03668559"];
//
//    
//    speaker.mobiles= [[NSSet alloc] initWithObjects:mobile, nil];
//    speaker.phones = [[NSSet alloc] initWithObjects:phone, nil];
//    
////  [speaker addMobilesObject:mobile];
////  [speaker addPhonesObject:phone];
//    
//    
//    [session setSpeakers:[[NSSet alloc] initWithObjects:speaker, nil]];
////    
////  [session addSpeakersObject:speaker];
//    
//    Agendas * agenda= [NSEntityDescription insertNewObjectForEntityForName:@"Agendas" inManagedObjectContext:_context];
//    [agenda setStartDate:[NSNumber numberWithInteger:11]];
//    [agenda setEndDate:[NSNumber numberWithInteger:15]];
//    
//    [agenda setSessions:[[NSSet alloc] initWithObjects:session, nil] ] ;
////    
////  [agenda addSessionsObject:session];
//    
//    //    NSArray * ar = NSSearchPathForDirectoriesInDomains(<#NSSearchPathDirectory directory#>, <#NSSearchPathDomainMask domainMask#>, <#BOOL expandTilde#>)
//    
//    
//      printf("done insert session");
//    
//    NSLog(@"%@" ,[[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject]);
//    
//    NSError * error = nil ;
//    if(![_context save:& error])
//    {
//        printf("error");
//    }
//    
//    [_makeTf setText:nil];
//    [_mpgTf setText:nil];
//}

//-(void)insertexhibtors
//{
//
//    Exhibitors * Exhibitor = [NSEntityDescription insertNewObjectForEntityForName:@"Exhibitors" inManagedObjectContext:_context];
//
//    [Exhibitor setIdEx:[NSNumber numberWithInteger:1]];
//    [Exhibitor setFax:@"fax"];
//
//   NSData * imdata=  UIImagePNGRepresentation(_imgview.image) ;
//
//    [Exhibitor setImage:imdata];
//    [Exhibitor setEmail:@"wwwwwww"];
//    [Exhibitor setCityName:@"alexan"];
//    [Exhibitor setCompanyAbout:@"about compaany"];
//    [Exhibitor setContactTitle:@"title"];
//
//    [Exhibitor setCompanyAddress:@"alexaddress"];
//    [Exhibitor setCompanyUrl:@"urlcompany"];
//
//    [Exhibitor setCompanyName:@"companyname"];
//     [Exhibitor setCountryName:@"egypt"];
//
//
//    MobileEx *mobilee = [NSEntityDescription insertNewObjectForEntityForName:@"MobileEx" inManagedObjectContext:_context];
//
//    [mobilee setMobile:@"010000025"];
//
//
//    PhonesEx *phonee = [NSEntityDescription insertNewObjectForEntityForName:@"PhonesEx" inManagedObjectContext:_context];
//
//    [phonee setPhone:@"02668559"];
//    
//
//
//
//
//    Exhibitor.mobiles= [[NSSet alloc] initWithObjects:mobilee, nil];
//
//    Exhibitor.phones= [[NSSet alloc] initWithObjects:phonee, nil];
//    
//    
//
////    [Exhibitor addMobilesObject:mobilee];
////
////    [Exhibitor addPhonesObject:phonee];
//
//    
//    printf("done insert exhibtors");
//
//
//
//}

//-(void)insertusers
//{
//    
//    User * user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:_context];
//    
//    [user setIdUser:[NSNumber numberWithInteger:1]];
//    [user setLastName:@"ibrahem"];
//    [user setFirstName:@"eslam"];
//    [user setMiddleName:@"farrag"];
//    [user setTitle:@"eng"];
//    [user setEmail:@"w.eman"];
//    [user setCompanyName:@"iti"];
//    [user setCode:@"2588555"];
//    [user setCityName:@"alex"];
//    
//    NSData * imageWithdata =  UIImagePNGRepresentation([_imgview image]) ;
//    [user setImage:imageWithdata] ;
//    
//
//    
//    
//    MobileUser *mobileUs= [NSEntityDescription insertNewObjectForEntityForName:@"MobileUser" inManagedObjectContext:_context];
//    
//    [mobileUs setMobile:@"010000025"];
//    
//    
//    PhoneUser *phoneUs = [NSEntityDescription insertNewObjectForEntityForName:@"PhoneUser" inManagedObjectContext:_context];
//    
//    [phoneUs setPhone:@"02668559"];
//    
//    
//    
//    
//    user.mobiles= [[NSSet alloc] initWithObjects:mobileUs, nil];
//    
//    user.phones= [[NSSet alloc] initWithObjects:phoneUs, nil];
//    
////    [user addMobilesObject:mobileUs];
////    
////    [user addPhonesObject:phoneUs];
//    
//    
//    printf("done insert user");
//    
//    
//    
//}

//-(NSArray*) fetchEnyObj : (NSString*) entityName
//{
//  
////    AppDelegate * appDelegate= [[UIApplication sharedApplication] delegate];
////    _managedObjectContext =   [appDelegate managedObjectContext] ;
//    
//    ManagerClass * mng = [ManagerClass myManagerObjectMethod];
//    _context = [mng context];
//    
//    NSFetchRequest * request = [[ NSFetchRequest alloc]initWithEntityName:entityName];
//    
//    NSError * error ;
//    NSMutableArray * resultArray = [[_context executeFetchRequest:request error:&error] mutableCopy];
//
//    
//    if(resultArray == nil)
//    {
//        printf("result is null from fetch");
//    }
//   
//    return resultArray ;
//}

//
//-(NSManagedObject*) fetchToDelete :(NSString*) entityName
//{
//
//    
//    NSFetchRequest * request = [[ NSFetchRequest alloc]initWithEntityName:entityName];
//    
//    NSError * error2 ;
//    NSManagedObject * resultManegObj = [[_managedObjectContext executeFetchRequest:request error:&error2] mutableCopy] ;
//    
//    if(resultManegObj == nil)
//    {
//        printf("result is null from fetch");
//    }
//    
//    return resultManegObj ;
//    
//}


//-(void) deleteAnyEntity : (NSString*) entityName
//{
//    
////  NSManagedObject * objFetch =   [self fetchToDelete:entityName];
//    
//    
//    NSFetchRequest * request = [[ NSFetchRequest alloc]initWithEntityName:entityName];
//    
//        NSError * error2 ;
//        NSManagedObject * resultManegObj = [[_context executeFetchRequest:request error:&error2] mutableCopy] ;
//    
//        if(resultManegObj == nil)
//        {
//            printf("result is null from fetch");
//        }
//        
//
//    [_context deleteObject:resultManegObj];
//    
//    NSError * error1 ;
//    if(![_context save:&error1])
//    {
//        printf("error to delete");
//    }
//    
//    printf("the entity delete ");
//}

- (IBAction)addAction:(id)sender
{
    JETSSessionBean *s = [JETSSessionBean new];
    s.name=@"ses name" ;
  //  s.locat = @"alex";
    s.idNum = [NSNumber numberWithInteger:5 ] ;
    s.sessionDescription = @"dis";
    s.liked = true ;
    s.status =[NSNumber numberWithInt:0];
    
    NSString * str = @"ss" ;
    //[s.sessionTage appendString:str];
    s.sessionTage =str;
    s.sessionType  = @"type" ;
    s.startDate = [NSNumber numberWithInt:55]  ;
    s.endDate = [ NSNumber numberWithInt:44];
    
    
   
    
    JETSSpeakerBean *sp = [JETSSpeakerBean new];
    
    sp.idSpeaker = [NSNumber numberWithInt:5];
    sp.imageUrl = @"img";
    //sp.gender = true; /// boolean
    sp.firstName =@"eman";
    sp.middleName =@"midd";
    sp.lastName =@"las";
    sp.companyName =@"company";
    sp.title =@"comp";
    sp.biography= @"bio";
    
    
    NSMutableArray *ph = [ NSMutableArray new];
    NSArray *nsPh = [[NSArray alloc] initWithObjects:@"255887" ,@"45845", nil];
    [ph  addObjectsFromArray:nsPh ];
    
    sp.phones = ph ;
    
    
    NSMutableArray *mb = [ NSMutableArray new];
    NSArray *nsmb = [[NSArray alloc] initWithObjects:@"255887" ,@"45845", nil];
    [mb  addObjectsFromArray:nsmb ];
    
    sp.mobiles = mb ;
    
    
//    [[s speakers] addObject:sp] ; ///looooook yaser
    
   // NSArray *nsarrsp = [[NSArray alloc ] initWithObjects:sp, nil ];//have value
    
    
    //[[ s speakers] addObjectsFromArray:nsarrsp ];//null value
    
    
    
    [[s speakers] addObject:sp];
    
    s.speakers = [[NSMutableArray alloc] initWithObjects:sp, nil] ;
    
    
    [mng insertSession :s];
}

- (IBAction)addEx:(id)sender
{
    
    JETSExhibitorsBean *exObj = [JETSExhibitorsBean new];
    exObj.companyName =@"com";
    NSArray *ppEs = [[NSArray alloc] initWithObjects:@"258", nil];

    exObj.phones = [[NSMutableArray alloc] initWithArray:ppEs];
    [mng insertexhibtors:exObj];
}

- (IBAction)addUser:(id)sender
{
    
    JETSUserBean *usObj = [JETSUserBean new];
//    usObj.companyName=@"kk";
//    usObj.idUser =[NSNumber numberWithInt:5];
//    usObj.cityName=@"alex";
    usObj.firstName=@"emo";
    
    NSArray *nsPoUs = [[NSArray alloc] initWithObjects:@"25555557" ,@"45544845", nil];
    usObj.phones = [[NSMutableArray  alloc] initWithArray:nsPoUs];
    
    [mng insertusers:usObj];
}

- (IBAction)deleteEntity:(id)sender
{
    [mng deleteAnyEntity:@"Sessions"];
    [mng deleteAnyEntity:@"User"];
    [mng deleteAnyEntity:@"Exhibitors"];
    [mng deleteAnyEntity:@"Agendas"];
    [mng deleteAnyEntity:@"PeakersNoRe"];
}

- (IBAction)addAgenda:(id)sender
{
    
    JETSAgendBean *agen = [JETSAgendBean new];
    agen.startDate = [NSNumber numberWithInt:555];
    agen.endDate= [NSNumber numberWithInt:558];
    
    
    
    
    JETSSessionBean *s = [JETSSessionBean new];
    s.name=@"ses" ;
    s.locat = @"alex";
    s.idNum = [NSNumber numberWithInteger:5 ] ;
    s.sessionDescription = @"dis";
    s.liked = true ;
    s.status =[NSNumber numberWithInt:0];
    
    NSString * str = @"ss" ;
    //[s.sessionTage appendString:str];
    s.sessionTage =str;
    s.sessionType  = @"type" ;
    s.startDate = [NSNumber numberWithInt:55]  ;
    s.endDate = [ NSNumber numberWithInt:44];
    
    
    
    
    JETSSpeakerBean *sp = [JETSSpeakerBean new];
    
    sp.idSpeaker = [NSNumber numberWithInt:5];
    sp.imageUrl = @"img";
  //  sp.gender = @"gg"; /// boolean
    sp.firstName =@"emo";
    sp.middleName =@"midd";
    sp.lastName =@"las";
    sp.companyName =@"company";
    sp.title =@"comp";
    sp.biography= @"bio";
    
    
    NSMutableArray *ph = [ NSMutableArray new];
    NSArray *nsPh = [[NSArray alloc] initWithObjects:@"255887" ,@"45845", nil];
    [ph  addObjectsFromArray:nsPh ];
    
    sp.phones = ph ;
    
    
    NSMutableArray *mb = [ NSMutableArray new];
    NSArray *nsmb = [[NSArray alloc] initWithObjects:@"255887" ,@"45845", nil];
    [mb  addObjectsFromArray:nsmb ];
    
    sp.mobiles = mb ;
    
    
    //    [[s speakers] addObject:sp] ; ///looooook yaser
    
   // NSArray *nsarrsp = [[NSArray alloc ] initWithObjects:sp, nil ];//have value
    
    
  //  [[ s speakers] addObjectsFromArray:nsarrsp ];//null value
    
    s.speakers =[[NSMutableArray alloc] initWithObjects:sp, nil] ;
    
    agen.sessions = [[NSMutableArray alloc] initWithObjects: s, nil] ;
    
    
    [mng createAgenda:agen];
}

- (IBAction)addSpeak:(id)sender {
    
    
    
    JETSSpeakerBean *sp = [JETSSpeakerBean new];
    
    sp.idSpeaker = [NSNumber numberWithInt:5];
    sp.imageUrl = @"img";
   // sp.gender = @"gg"; /// boolean
    sp.firstName =@"emo";
    sp.middleName =@"midd";
    sp.lastName =@"las";
    sp.companyName =@"company";
    sp.title =@"comp";
    sp.biography= @"bio";
    
    
    NSMutableArray *ph = [ NSMutableArray new];
    
    NSArray *nsPh = [[NSArray alloc] initWithObjects:@"255887" ,@"45845", nil];
    
    [ph  addObjectsFromArray:nsPh ];
    
    sp.phones = ph ;
    
    
    NSMutableArray *mb = [ NSMutableArray new];
    NSArray *nsmb = [[NSArray alloc] initWithObjects:@"255887" ,@"45845", nil];
    [mb  addObjectsFromArray:nsmb ];
    
    sp.mobiles = mb ;
    
    [mng insertSpeaker:sp ];
    

}
@end
