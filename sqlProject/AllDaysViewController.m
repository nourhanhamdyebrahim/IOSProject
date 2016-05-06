//
//  AllDaysViewController.m
//  sqlProject
//
//  Created by JETS on 4/29/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "AllDaysViewController.h"

@interface AllDaysViewController ()

@end

@implementation AllDaysViewController
{
    NSArray *sesssionArray;
    ManagerClass *db;
    UIRefreshControl *refreshControl;
    UITableViewController *tableViewController;
    AgendaModel *agendaModel;
    Sessions *detailOfSession;
    SessionDetailAgendaViewController *detail;
    int flage ;
    
}


-(void)viewDidAppear:(BOOL)animated{
    if(flage != 1)
    [ProgressHUD show:@""];
}

static NSArray * firstSesstionArr = nil ;
static NSArray * secoundSesstionArr= nil ;
static NSArray * thirdSesstionArr = nil ;
+(NSArray *)getSesstionForm:(int)DayNumber
{
    if (DayNumber==1) {
        return firstSesstionArr;
    }
    else if (DayNumber==2)
    {
        return secoundSesstionArr;
    }
    else if (DayNumber == 3)
    {
        return thirdSesstionArr;
    }
    else{
        return nil;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //    db = [ManagerClass myManagerObjectMethod];
    //    NSLog(@"in view did load of agenda");
    //    _sesstionArr= [NSMutableArray new];
    //    AgendaModel *agendaModel = [AgendaModel new];
    //
    //    [agendaModel test];
    //    [agendaModel setShowdataDelegate:self];
    //   // NSLog(@"view did load agendatable");
    //
    //  self.navigationItem.hidesBackButton=YES;
    //    _allDays.backgroundColor = [UIColor clearColor];
    //    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:self.view.frame];
    //
    //    bgImage.image = [UIImage imageNamed:@"MDW 2016 Mobile APP-01.png"];
    //    [self.view addSubview:bgImage];
    //    [self.view sendSubviewToBack:bgImage];
    // Do any additional setup after loading the view.
    NSLog(@"in view did load \n \n \n");
    db = [ManagerClass myManagerObjectMethod ];
    _sesstionArr= [NSMutableArray new];
    
    detail = [SessionDetailAgendaViewController new];
    detailOfSession = [NSEntityDescription insertNewObjectForEntityForName:@"Sessions" inManagedObjectContext:db.context];
    
    agendaModel = [AgendaModel new];
    tableViewController=[[UITableViewController alloc]init];
    tableViewController.tableView=self.allDays;
    refreshControl=[[UIRefreshControl alloc] init];
    refreshControl.backgroundColor=[UIColor purpleColor];
    refreshControl.tintColor=[UIColor whiteColor];
    refreshControl.alpha=0.50;
    [refreshControl addTarget:self action:@selector(getdata) forControlEvents:UIControlEventValueChanged];
    [self getdata];
    [self performSelectorOnMainThread:@selector(rerenderTable) withObject:nil waitUntilDone:NO];
    tableViewController.refreshControl=refreshControl;
    
}

- (void) getdata
{
    
    NSLog(@"in get data function tayseer\n \n \n \n");
    
    //    [self performSelectorOnMainThread:@selector(rerenderTable) withObject:nil waitUntilDone:NO];
    //    tableViewController.refreshControl=refreshControl;
    [agendaModel test];
    [agendaModel setShowdataDelegate:self];
    // NSLog(@"view did load agendatable");
    
    self.navigationItem.hidesBackButton=YES;
    _allDays.backgroundColor = [UIColor clearColor];
    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:self.view.frame];
    
    bgImage.image = [UIImage imageNamed:@"MDW 2016 Mobile APP-01.png"];
    [self.view addSubview:bgImage];
    [self.view sendSubviewToBack:bgImage];
    [ProgressHUD dismiss];
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

-(void) showExFromSql :(NSMutableArray *) dataArr{
    
    // NSLog(@"showExFromSql func");
    [self SorttedTheSesstionFrom:dataArr];
    
    NSLog(@"in state func of agenda = 0\n \n \n");
    //  NSLog(@"%@",[_exhibtorArr[1] companyName])  ;
    
    //  NSLog(@"%@", [_exhibtorArr[1] imageURLExh])  ;
    
    [self.allDays reloadData];
    [ProgressHUD dismiss];
    
}




-(void) showDate : (NSMutableArray *) dataArr
{
    [self SorttedTheSesstionFrom:dataArr];
    [self.allDays reloadData];
    [ProgressHUD dismiss];

    NSLog(@"in showDate of agenda heres tayseer\n\n\n");
}

-(void) SorttedTheSesstionFrom:(NSMutableArray*) Agenda
{
    [refreshControl endRefreshing];
    NSLog(@"\n \n \n \nhere in sorrted sesstion tayseer\n \n \n \n");
    NSLog(@"%d no of agnda\n \n \n \n",[Agenda count]);
    firstSesstionArr= nil ;
    secoundSesstionArr=nil;
    thirdSesstionArr=nil;
    _sesstionArr= [NSMutableArray new];
    
    NSSortDescriptor *myDescribtour = [[NSSortDescriptor alloc] initWithKey:@"startDateSession" ascending:YES];
    NSArray *theArrayOfDescriptour = [[NSArray alloc] initWithObjects:myDescribtour, nil];
    Agendas *agendaOfDay = [NSEntityDescription insertNewObjectForEntityForName:@"Agendas" inManagedObjectContext:db.context];
    
    for (int i=0; i<[Agenda count]; i++) {
        NSLog(@"%d no of i \n \n \n \n ",i);
        agendaOfDay = [Agenda objectAtIndex:i];
        if (i==0) {
            firstSesstionArr=[[agendaOfDay sessionsAgenda] sortedArrayUsingDescriptors:theArrayOfDescriptour];
            [_sesstionArr addObjectsFromArray:firstSesstionArr];
            // NSLog(@"_firstSesstionArr : \n \n %@ \n",[firstSesstionArr objectAtIndex:0]);
            NSLog(@"%d \n",[_sesstionArr count]);
            
        }
        else if (i==1) {
            secoundSesstionArr=[[agendaOfDay sessionsAgenda] sortedArrayUsingDescriptors:theArrayOfDescriptour];
            [_sesstionArr addObjectsFromArray:secoundSesstionArr];
            //NSLog(@"_secoundSesstionArr: \n \n%@ \n",[secoundSesstionArr objectAtIndex:0]);
            NSLog(@"%d \n",[_sesstionArr count]);
            
        }
        
        else {
            thirdSesstionArr=[[agendaOfDay sessionsAgenda] sortedArrayUsingDescriptors:theArrayOfDescriptour];
            [_sesstionArr addObjectsFromArray:thirdSesstionArr];
            //   NSLog(@"_thirdSesstionArr: \n \n %@ \n ",[thirdSesstionArr objectAtIndex:0]);
            NSLog(@"%d \n",[_sesstionArr count]);
            
        }
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    NSLog(@"in no of row of sesstion\n \n \n");
    
    return [_sesstionArr count];
    
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    flage=1;
    NSLog(@"in cell render\n\n \n");
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    UILabel *sesstionName = (UILabel*)[cell viewWithTag:3];
   
    
    
    
    UILabel *l1=[UILabel new];
    // Do any additional setup after loading the view, typically from a nib.
    //htmlString=@"<Font name=\"verdana\" size=\"4\" color=\"blue\">your</Font>
    NSString*  htmlString=[_sesstionArr[indexPath.row] nameSession];    //self.myHtmlLabel.Text=htmlString;
    NSAttributedString*  f=[l1 convertHtml:htmlString];
    [sesstionName setAttributedText:f];
    
    
    
    UIImageView *imageBackground = (UIImageView*)[cell viewWithTag:1];
    imageBackground.frame= CGRectMake(5, 5, 55, 55);
    if([[_sesstionArr[indexPath.row] sessionType] isEqual:@"Workshop"])
    {
        imageBackground.image=[UIImage imageNamed:@"green.png"];
    }
    else if ([[_sesstionArr[indexPath.row] sessionType] isEqual:@"Hackathon"])
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
    
    
    NSDate *startDate = [_sesstionArr[indexPath.row] startDateSession];
    NSString *startTime = [timeFormater stringFromDate:startDate];
    
    
    NSDate *endDate = [_sesstionArr[indexPath.row] endDateSession];
    NSString *endTime = [timeFormater stringFromDate:endDate];
    UILabel *timelabel = (UILabel*)[cell viewWithTag:4];
    [timelabel setText:[NSString stringWithFormat:@"%@   %@",startTime,endTime]];
    
    
    NSString *day = [dateFormater stringFromDate:startDate];
    NSLog(@"%@\n \n \n%@\n \n \n ",day,startDate);
    UILabel *dayNumber =(UILabel*) [cell viewWithTag:2];
    [dayNumber setText:day];
    
    
    
    UILabel *locationlabel=(UILabel*) [cell viewWithTag:5];
    [locationlabel setText:[_sesstionArr[indexPath.row] locationSession]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    detailOfSession.nameSession=[_sesstionArr[indexPath.row] nameSession ];
    //detailOfSession.liked=[_sesssionArray[indexPath.row] liked ];
    detailOfSession.sessionTage=[_sesstionArr[indexPath.row] sessionTage ];
    detailOfSession.sessionType=[_sesstionArr[indexPath.row] sessionType ];
    detailOfSession.startDateSession=[_sesstionArr[indexPath.row] startDateSession ];
    detailOfSession.locationSession=[_sesstionArr[indexPath.row] locationSession];
    detailOfSession.descript=[_sesstionArr[indexPath.row] descript ];
    detailOfSession.idSession=[_sesstionArr[indexPath.row] idSession ];
    detailOfSession.speakerssess=[_sesstionArr[indexPath.row] speakerssess ];
    detailOfSession.agenda=[_sesstionArr[indexPath.row] agenda ];
    detailOfSession.endDateSession=[_sesstionArr[indexPath.row] endDateSession ];
    detailOfSession.statues=[_sesstionArr[indexPath.row] statues ];
    
    //detail.sessionDetails=detailOfSession ;
    //[self performSegueWithIdentifier:@"detail" sender:self];
    
    //[_sesssionArray[0] ]
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier ]isEqualToString:@"detail"]){
        detail = segue.destinationViewController;
        
        detail.sessionDetails=detailOfSession;
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
