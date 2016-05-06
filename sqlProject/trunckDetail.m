//
//  trunckDetail.m
//  coreObjective
//
//  Created by JETS on 4/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "trunckDetail.h"
#import "AppDelegate.h"
#import "Speakers.h"
#import "Sessions.h"
#import "Agendas.h"
#import "Phones.h"
#import "Mobiles.h"
#import "PeakersNoRe.h"
#import "PhonSpeakNo.h"
#import "MobileSpeakNore.h"
//#import "DataBaseManeger.h"
//#import "CoreDataManager.h"
#import "Add.h"
#import "Exhibitors.h"
#import "User.h"

#import "ManagerClass.h"

@interface trunckDetail ()

@end

@implementation trunckDetail

NSMutableArray *sessionArray;
NSMutableArray *agendaArray;
NSMutableArray *usersArray;
NSMutableArray *exbArray;
NSMutableArray *speakArray;

ManagerClass * mng;

//Add * addObj;


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    mng = [ManagerClass myManagerObjectMethod];
    _context = [mng context];
    
    sessionArray  = [NSMutableArray new];
    agendaArray  = [NSMutableArray new];
    usersArray  = [NSMutableArray new];
    exbArray  = [NSMutableArray new];
    speakArray = [NSMutableArray new];
    
    //addObj = [Add new];
    
    NSArray *array1= [mng fetchEnyObj:@"Sessions"];
    
//    NSArray *arrayReturn =[addObj fetchEnyObj:@"Exhibitors"];

    NSArray *array2 =[mng fetchEnyObj:@"User"];
    NSArray *array3 =[mng fetchEnyObj:@"Exhibitors"];
    NSArray *array4 =[mng fetchEnyObj:@"Agendas"];
    
    NSArray *array5 = [mng fetchEnyObj:@"PeakersNoRe"];
    
    [sessionArray addObjectsFromArray:array1];
    [agendaArray addObjectsFromArray:array4];
    [usersArray addObjectsFromArray:array2];
    [exbArray addObjectsFromArray:array3];
    [speakArray addObjectsFromArray:array5];
 
    
//    AppDelegate * appDell = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    _managedObjectContext= [appDell managedObjectContext];
//    
//    NSFetchRequest * request = [[ NSFetchRequest alloc]initWithEntityName:@"Sessions"];
//
//    
//    
////    NSFetchRequest * request = [[ NSFetchRequest alloc]init];
//    
//    
////    NSEntityDescription * trucks = [NSEntityDescription entityForName:@"Trucks" inManagedObjectContext:_managedObjectContext];
////    [request setEntity:trucks];
//    
////    NSSortDescriptor * discriptor =[[NSSortDescriptor alloc]initWithKey:@"mpg" ascending:YES];
////    NSArray * sortDiscriptors = [[NSArray alloc]initWithObjects:discriptor, nil ];
////    [request setSortDescriptors:sortDiscriptors];
//    NSError * error ;
//    NSMutableArray * result = [[_managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
//    if(result == nil)
//    {
//        
//    }
//    sessionArray = result ;

 //   [self setTrucksArray:result] ;
 // NSLog(@"there is array",[[result objectAtIndex:0] make]) ;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Table view data source

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title;
    
    switch (section)
    {
        case 0:
            
            title = @"Sessions ";
            
            break;
            
        case 1:
            
            title = @"Users ";
            
            break;
            
        case 2:
            
            title = @"Exhibitors ";
            
            break;
            
        case 3:
            
            title = @"Agendas ";
            
            break;
            
            
            
        case 4:
            
            title = @"speakers";
            
            break;
    }
    
    return title;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    int count = 0;
    
    switch (section)
    {
        case 0:
            
            count = [sessionArray count];
            
            break;
            
        case 1:
            
            count = [usersArray count];
            
            break;
            
        case 2:
            
            count = [exbArray count];
            
            break;
            
        case 3:
            
            count = [agendaArray count];
            
            break;
            
        case 4:
            
            count = [speakArray count];
            
            break;

    }
    
    return count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Sessions * ses;
    Exhibitors * exhib;
    User * user;
    Agendas * agenda;
    PeakersNoRe * speak;
    
    NSSet * setObj;
    NSArray * all;
    NSString * firstObj;
    NSArray *arrsp ;
    NSSet *setsp;
        switch (indexPath.section)
        {
            case 0:
                
                ses = (Sessions*) [sessionArray objectAtIndex:indexPath.row];
                //test session
                cell.detailTextLabel.text =[ses nameSession];
                
                setObj = ses.speakerssess;
                all = [setObj allObjects];
                firstObj = [[all objectAtIndex:0] firstName];
                
                cell.textLabel.text= firstObj;
                //[cell.imageView setImage:[[all objectAtIndex:0] image]];
                
              //  NSData *speaIm  = [[all objectAtIndex:0] imageSpe ] ;
                
                 [cell.imageView setImage:  [UIImage imageWithData: [[all objectAtIndex:0] imageSpe] ] ] ;
            
                break;
                
            case 1:
                
                user = (User *) [usersArray objectAtIndex:indexPath.row];
                //test user
                cell.textLabel.text = [user firstName];
                
                setObj = user.phonesUser;
                all = [setObj allObjects];
                firstObj =[[all objectAtIndex:0] phone];
                cell.detailTextLabel.text = firstObj;
                 [cell.imageView setImage:[UIImage imageWithData:user.imageUser]] ;
                
                break;
                
            case 2:
                
                exhib = (Exhibitors *) [exbArray objectAtIndex:indexPath.row];
                //NSData * v = exhib.image;
                
                cell.textLabel.text = [exhib companyName];
                
                setObj = exhib.phones;
                all = [setObj  allObjects];
                firstObj =[[all objectAtIndex:0] phone];
                
                
                cell.detailTextLabel.text = firstObj;
              
                 [cell.imageView setImage:[UIImage imageWithData:exhib.imageEx]] ;
                
                
                break;
                
            case 3:
                
                agenda = (Agendas *) [agendaArray objectAtIndex:indexPath.row];
                setObj = agenda.sessionsAgenda;
                all= [setObj allObjects];
                            firstObj = [[all objectAtIndex:0] sessionType];

                
                cell.textLabel.text = [[NSString alloc] initWithFormat:@"%@",agenda.startDateAgenda];
                 cell.detailTextLabel.text = firstObj;
                setsp =[[all objectAtIndex:0] speakers] ;
                arrsp =[setsp allObjects];
                
         [cell.imageView setImage:  [ UIImage imageWithData: [arrsp[0]  imageSpe ]  ]  ]     ;
                
                break;
                
            case 4:
                
                speak = (PeakersNoRe *) [speakArray objectAtIndex:indexPath.row];
                cell.textLabel.text = [speak firstName];
                
                setObj = speak.phonesspeakerNo;
                all = [setObj  allObjects];
                
               NSData *dIm = speak.imageSpeNo ;
                
                firstObj =[[all objectAtIndex:0] phone];
                
                cell.detailTextLabel.text = firstObj;
                
               [cell.imageView setImage: [UIImage imageWithData:dIm]];

                break;
        }
    
    
    //test exhibtors
//        cell.detailTextLabel.text =[exhib countryName] ;
//    
//        NSSet * setspe = exhib.mobiles;
//        NSArray * arsess = [setspe allObjects];
//    
//       NSString * mobEx=[[arsess objectAtIndex:0] mobile];
//        cell.textLabel.text= mobEx;
        
    
    //NSData* img =[[arsess objectAtIndex:0] image];
//
//
//cell.imageView.image=[ UIImage imageWithData:img];
//cell.imageView.image = img ;
//
    
    // Configure the cell...
    
    return cell;
}

//
//// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObject * sToDelete;
    NSManagedObject * uToDelete;
    NSManagedObject * exToDelete;
    NSManagedObject * agendaToDelete;
    
    NSError * error;
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        switch (indexPath.section)
        {
            case 0:
                
                sToDelete = [sessionArray objectAtIndex:indexPath.row];
                [_context deleteObject:sToDelete];
                //[_context deleteObject:[sessionArray objectAtIndex:indexPath.row]];
                [sessionArray removeObjectAtIndex:indexPath.row];
                
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                
                error = nil ;
                if(![_context save:& error])
                {
                    printf("error deleting session ");
                }
                
                break;
                
            case 1:
                
                uToDelete = [usersArray objectAtIndex:indexPath.row];
                [_context deleteObject:uToDelete];
                //[_context deleteObject:[usersArray objectAtIndex:indexPath.row]];
                [usersArray removeObjectAtIndex:indexPath.row];
                
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                
                error = nil ;
                if(![_context save:& error])
                {
                    printf("error deleting user ");
                }
                break;
                
            case 2:
                
                exToDelete = [exbArray objectAtIndex:indexPath.row];
                [_context deleteObject:exToDelete];
                //[_context deleteObject:[exbArray objectAtIndex:indexPath.row]];
                [exbArray removeObjectAtIndex:indexPath.row];
                
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
                
                error = nil ;
                if(![_context save:& error])
                {
                    printf("error deleting exibitors ");
                }
                
                break;
                
            case 3:
                
                agendaToDelete = [agendaArray objectAtIndex:indexPath.row];
                [_context deleteObject:agendaToDelete];
                //[_context deleteObject:[exbArray objectAtIndex:indexPath.row]];
                [agendaArray removeObjectAtIndex:indexPath.row];
                
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
                
                error = nil ;
                if(![_context save:& error])
                {
                    printf("error deleting agenda ");
                }
                
                break;
        }
        
       
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
