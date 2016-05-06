//
//  TestViewController.m
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/22/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "TestViewController.h"
#import "SpeakerModel.h"
#import "ProgressHUD.h"
@interface TestViewController ()

@end

@implementation TestViewController

{
    ManagerClass *db ;
   // exhibtorUrl * exUrlObj;
    int flage;
    int statusNet  ;
}

-(void)showDate:(NSMutableArray *) dataArr
{
    _arr = dataArr;
    NSLog(@"in show data%@",[[_arr objectAtIndex:5] firstName]);
    [self.uitableview reloadData];
    NSLog(@"here");
    NSLog(@"%d sizee of arr"  , _arr.count );
      [ProgressHUD dismiss];
}

//////////// delgate functions



-(void) showExFromSql :(NSMutableArray *) speakerArray {
    
    
    _arr =speakerArray ;
    
               NSLog(@"%dcount",[_arr count])  ;
         NSLog(@"state func = 0");
        
        //  NSLog(@"%@", [_exhibtorArr[1] imageURLExh])  ;
        
        [_uitableview reloadData];
  [ProgressHUD dismiss];
    
}


///////////////////////////////////


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton=YES;
    _uitableview.backgroundColor = [UIColor clearColor];
    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:self.view.frame];
    
    bgImage.image = [UIImage imageNamed:@"MDW 2016 Mobile APP-01.png"]; [self.view addSubview:bgImage];
    
    [self.view sendSubviewToBack:bgImage];
    SpeakerModel *speakerModel = [SpeakerModel new];
    
    [speakerModel test];
    [speakerModel setShowdataDelegate:self];
    NSLog(@"here2");
    _arr = [NSMutableArray new];
    NSLog(@"here3");
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return YES;
}



-(void)viewDidAppear:(BOOL)animated{
    if(flage!=1)
    [ProgressHUD show:@""];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arr count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    flage=1;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    NSLog(@"d5l %d",indexPath.row);
    
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
    
    
//    if(statusNet==1)
//    {
//        
//        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[_arr[indexPath.row] imageUrl]]
//                          placeholderImage:[UIImage imageNamed:@"speaker.png"]];
//
//    }
    
   // else{
        
        cell.imageView.image = [UIImage imageWithData:[_arr[indexPath.row]imageSpeNo]];
  //  }

    
    
    
    
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
