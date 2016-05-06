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
NSMutableArray *usersArray;
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
    usersArray  = [NSMutableArray new];

    //addObj = [Add new];
    
    NSArray *array1= [mng fetchEnyObj:@"Sessions"];
    
//    NSArray *arrayReturn =[addObj fetchEnyObj:@"Exhibitors"];

    NSArray *array2 =[mng fetchEnyObj:@"User"];
    
    [sessionArray addObjectsFromArray:array1];
    [usersArray addObjectsFromArray:array2];
 
    
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
    }
    
    return title;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    int count = 0;
    
    switch (section)
    {
        case 0:
            
            count = [sessionArray  count];
            
            break;
            
        case 1:
            
            count = [usersArray  count];
            
            break;
    }
    
    return count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Sessions * ses;
    //   Exhibitors * exhib =(Exhibitors *) [sessionArray objectAtIndex:indexPath.row];
    User * user;
    
    NSSet * setSpeaker;
    NSArray * all;
    NSString * firstObj;
    
        switch (indexPath.section)
        {
            case 0:
                
                ses = (Sessions*) [sessionArray objectAtIndex:indexPath.row];
                //test session
                cell.detailTextLabel.text =[ses nameSession];
                
                setSpeaker = ses.speakers;
                all = [setSpeaker allObjects];
                firstObj = [[all objectAtIndex:0] firstName];
                
                cell.textLabel.text= firstObj;
                //cell.textLabel.text=[[ses startData] stringValue];
                break;
                
            case 1:
                
                user = (User *) [usersArray objectAtIndex:indexPath.row];
                //test user
                cell.textLabel.text = [user firstName];
                
                setSpeaker = user.phones;
                all = [setSpeaker  allObjects];
                firstObj =[[all objectAtIndex:0] phone];
                
                cell.detailTextLabel.text = firstObj;
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
        
    
   // NSData* img =[[arsess objectAtIndex:0] image];
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
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        switch (indexPath.section)
        {
            case 0:
                
                sToDelete = [sessionArray objectAtIndex:indexPath.row];
                [sessionArray removeObjectAtIndex:indexPath.row];
                [_context deleteObject:sToDelete];
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                
                break;
                
            case 1:
                
                uToDelete = [usersArray objectAtIndex:indexPath.row];
                [_context deleteObject:uToDelete];
                [usersArray removeObjectAtIndex:indexPath.row];
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                
                break;
        }
        // Delete the row from the data source
        
       
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
