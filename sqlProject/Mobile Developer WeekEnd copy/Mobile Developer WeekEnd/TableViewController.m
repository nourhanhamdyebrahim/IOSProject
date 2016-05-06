//
//  TableViewController.m
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/6/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController




-(void)showDate:(NSMutableArray *) dataArr
{
    _arr = dataArr;
    NSLog(@"in show data%@",[[_arr objectAtIndex:5] firstName]);
    [self.tableView reloadData];
    NSLog(@"here");
    NSLog(@"%d sizee of arr"  , _arr.count );
}


-(void)viewWillAppear:(BOOL)animated
{
    
    //[self setArr:agendaModel.speakerArr];
    // _arr = agendaModel.speakerArr;
    
    //NSLog(@"the size  is   >>  %d" , _arr.count );
}

//NSMutableArray *arr ;
- (void)viewDidLoad {
    [super viewDidLoad];
   
    SpeakerModel *agendaModel = [SpeakerModel new];
    
    [agendaModel test];
    [agendaModel setShowdataDelegate:self];
    NSLog(@"here2");
    _arr = [NSMutableArray new];
    NSLog(@"here3");
   //
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   

    
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
    
    NSLog(@"%lu",(unsigned long)_arr.count);
    return _arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    NSLog(@"d5l %ld",(long)indexPath.row);
    
    if([[_arr[indexPath.row] middleName] isEqualToString:@""]  )
    {
        NSLog(@"%@",[_arr[indexPath.row] middleName]);
        NSLog(@"hellp");
        cell.textLabel.text =[NSString stringWithFormat:@"%@ %@" ,[_arr[indexPath.row] firstName],[_arr[indexPath.row] lastName]];
        
    }
    else
    {
       NSLog(@"%@",[_arr[indexPath.row] middleName]);
        NSLog(@"hi");
        cell.textLabel.text =[NSString stringWithFormat:@"%@ %@ %@" ,[_arr[indexPath.row] firstName],[_arr[indexPath.row] middleName],[_arr[indexPath.row] lastName] ];
    }
    //cell.imageView.image = [UIImage imageNamed:[_arr[indexPath.row] imageUrl]];
    cell.detailTextLabel.text=[_arr[indexPath.row] companyName];
   
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[_arr[indexPath.row] imageUrl]]
                      placeholderImage:[UIImage imageNamed:@"d.png"]];
   // cell.imageView.image = [UIImage imageNamed:@"d.png"];
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    return cell;
}




-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    DataTableViewController *obj =[self.storyboard instantiateViewControllerWithIdentifier:@"myStaticView"];
    obj.speaker_bean_obj = [_arr objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:obj animated:YES];
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
