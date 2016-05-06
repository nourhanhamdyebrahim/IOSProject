//
//  SecondDayViewController.m
//  sqlProject
//
//  Created by JETS on 4/29/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "SecondDayViewController.h"
#import "ProgressHUD.h"
@interface SecondDayViewController ()

@end

@implementation SecondDayViewController
UIRefreshControl *refreshControl;
UITableViewController *tableViewController;
NSArray *secoundDaySesstion;
Sessions *detailOfSession;
SessionDetailAgendaViewController *detail;
ManagerClass *db;


- (void)viewDidLoad {
    [super viewDidLoad];
    db = [ManagerClass myManagerObjectMethod ];
    detail = [SessionDetailAgendaViewController new];
    detailOfSession = [NSEntityDescription insertNewObjectForEntityForName:@"Sessions" inManagedObjectContext:db.context];
    tableViewController=[[UITableViewController alloc]init];
    tableViewController.tableView=self.secondDay;
    refreshControl=[[UIRefreshControl alloc] init];
    refreshControl.backgroundColor=[UIColor purpleColor];
    refreshControl.tintColor=[UIColor whiteColor];
    refreshControl.alpha=0.50;
    [refreshControl addTarget:self action:@selector(getdata) forControlEvents:UIControlEventValueChanged];
    [self getdata];
    [self performSelectorOnMainThread:@selector(rerenderTable) withObject:nil waitUntilDone:NO];
    tableViewController.refreshControl=refreshControl;
    // Do any additional setup after loading the view.
}
-(void)rerenderTable
{NSLog(@"in rnder table tayseer\n\n\n");
    UITableView *tableView=[[UITableView alloc] init];
    [tableView reloadData];
    if(refreshControl){
        NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM d,h:mm a"];
        NSString *title=[NSString stringWithFormat:@"Last update: %@",[formatter stringFromDate:[NSDate date]]];
        NSDictionary *attrsDictionary=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
        NSAttributedString *attributedTitle=[[NSAttributedString alloc]initWithString:title attributes:attrsDictionary];
        refreshControl.attributedTitle=attributedTitle;
        
        
        
    }
}

- (void)getdata
{
    self.navigationItem.hidesBackButton=YES;
    _secondDay.backgroundColor = [UIColor clearColor];
    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:self.view.frame];
    
    bgImage.image = [UIImage imageNamed:@"MDW 2016 Mobile APP-01.png"]; [self.view addSubview:bgImage];
    
    [self.view sendSubviewToBack:bgImage];
    secoundDaySesstion=[AllDaysViewController getSesstionForm:2];
    
    NSLog(@"%d",[secoundDaySesstion count]);
    [self.secondDay reloadData];
    [refreshControl endRefreshing];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [secoundDaySesstion count];
}

-(void)viewDidAppear:(BOOL)animated{
    [ProgressHUD show:@""];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    UILabel *sesstionName = (UILabel*)[cell viewWithTag:3];
    
    
    UILabel *l1=[UILabel new];
    // Do any additional setup after loading the view, typically from a nib.
    //htmlString=@"<Font name=\"verdana\" size=\"4\" color=\"blue\">your</Font>;
    NSString*  htmlString=[secoundDaySesstion[indexPath.row] nameSession] ;    //self.myHtmlLabel.Text=htmlString;
    NSAttributedString*  f=[l1 convertHtml:htmlString];
    [sesstionName setAttributedText:f];
    
//    
//    [sesstionName setText:[secoundDaySesstion[indexPath.row] nameSession]];
    
    
    UIImageView *imageBackground = (UIImageView*)[cell viewWithTag:1];
    imageBackground.frame= CGRectMake(5, 5, 55, 55);
    if([[secoundDaySesstion[indexPath.row] sessionType] isEqual:@"Workshop"])
    {
        imageBackground.image=[UIImage imageNamed:@"green.png"];
    }
    else if ([[secoundDaySesstion[indexPath.row] sessionType] isEqual:@"Hackathon"])
    {
        imageBackground.image=[UIImage imageNamed:@"orange.png"];
    }
    else
    {
        imageBackground.image=[UIImage imageNamed:@"blue.png"];
    }
    
    
    NSDateFormatter *timeFormater = [[NSDateFormatter alloc] init];
    [timeFormater setDateFormat:@"HH:mm"];
    [timeFormater setTimeZone:[NSTimeZone timeZoneWithName:@"Africa/Cairo"]];
    
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd"];
    
    
    NSDate *startDate = [secoundDaySesstion[indexPath.row] startDateSession];
    NSString *startTime = [timeFormater stringFromDate:startDate];
    
    
    NSDate *endDate = [secoundDaySesstion[indexPath.row] endDateSession];
    NSString *endTime = [timeFormater stringFromDate:endDate];
    UILabel *timelabel = (UILabel*)[cell viewWithTag:4];
    [timelabel setText:[NSString stringWithFormat:@"%@   %@",startTime,endTime]];
    
    
    NSString *day = [dateFormater stringFromDate:startDate];
    UILabel *dayNumber =(UILabel*) [cell viewWithTag:2];
    [dayNumber setText:day];
    
    
    
    UILabel *locationlabel=(UILabel*) [cell viewWithTag:5];
    [locationlabel setText:[secoundDaySesstion[indexPath.row] locationSession]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    detailOfSession.nameSession=[secoundDaySesstion[indexPath.row] nameSession ];
    //detailOfSession.liked=[_sesssionArray[indexPath.row] liked ];
    detailOfSession.sessionTage=[secoundDaySesstion[indexPath.row] sessionTage ];
    detailOfSession.sessionType=[secoundDaySesstion[indexPath.row] sessionType ];
    detailOfSession.startDateSession=[secoundDaySesstion[indexPath.row] startDateSession ];
    detailOfSession.locationSession=[secoundDaySesstion[indexPath.row] locationSession];
    detailOfSession.descript=[secoundDaySesstion[indexPath.row] descript ];
    detailOfSession.idSession=[secoundDaySesstion[indexPath.row] idSession ];
    detailOfSession.speakerssess=[secoundDaySesstion[indexPath.row] speakerssess ];
    detailOfSession.agenda=[secoundDaySesstion[indexPath.row] agenda ];
    detailOfSession.endDateSession=[secoundDaySesstion[indexPath.row] endDateSession ];
    detailOfSession.statues=[secoundDaySesstion[indexPath.row] statues ];
    
    //detail.sessionDetails=detailOfSession ;
    //[self performSegueWithIdentifier:@"detail" sender:self];
    
    //[_sesssionArray[0] ]
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier ]isEqualToString:@"detail"]){
        detail=segue.destinationViewController;
        
        detail.sessionDetails=detailOfSession;
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
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
