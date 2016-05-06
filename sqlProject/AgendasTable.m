//
//  AgendasTable.m
//  sqlProject
//
//  Created by JETS on 4/28/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "AgendasTable.h"

@interface AgendasTable ()

@end

@implementation AgendasTable

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _agendasArr= [NSMutableArray new];
    AgendaModel *agendaModel = [AgendaModel new];
    
    [agendaModel test];
    [agendaModel setShowdataDelegate:self];
    NSLog(@"view did load agendatable");
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(void) showExFromSql :(NSMutableArray *) dataArr{
    
    // NSLog(@"showExFromSql func");
    
    _agendasArr=dataArr;
    NSLog(@"state func = 0");
    //  NSLog(@"%@",[_exhibtorArr[1] companyName])  ;
    
    //  NSLog(@"%@", [_exhibtorArr[1] imageURLExh])  ;
    
    [self.tableView reloadData];

}




-(void) showDate : (NSMutableArray *) dataArr
{
    _agendasArr= dataArr;
    [self.tableView reloadData];
    
    NSLog(@"showDate");
    NSLog(@"%d sizee of arr"  , dataArr.count );
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _agendasArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellAgenda" forIndexPath:indexPath];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"yyyy-MM-dd HH:mm:ss zzz"];
     NSDate *myNSDateInstance= [_agendasArr[indexPath.row] startDate ];
    NSString *stringFromDate = [formatter stringFromDate:myNSDateInstance];
    cell.textLabel.text= stringFromDate;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
