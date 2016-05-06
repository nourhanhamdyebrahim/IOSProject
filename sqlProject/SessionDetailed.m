//
//  ArticleTableViewController.m
//  TableViewLayout
//
//  Created by Oliver Foggin on 29/10/2014.
//  Copyright (c) 2014 Oliver Foggin. All rights reserved.
//

#import "SessionDetailed.h"

#import "DataTableViewController.h"

@interface SessionDetailed ()

@property (weak, nonatomic) IBOutlet UILabel *sessionName;
@property (weak, nonatomic) IBOutlet UILabel *sessionDate;
@property (weak, nonatomic) IBOutlet UILabel *sessionTime;
@property (weak, nonatomic) IBOutlet UIButton *starIcon;
@property (weak, nonatomic) IBOutlet UILabel *locationNum;
@property (weak, nonatomic) IBOutlet UITextView *sessionDescription;

//@property (weak, nonatomic) IBOutlet UIImageView *speakerImg;
//@property (weak, nonatomic) IBOutlet UILabel *speakerName;


@end

@implementation SessionDetailed{
    
        SpeakerDetailViewController *speaker;
        Speakers *SpeakerDetails;
        NSArray *speakerArr;
        ManagerClass *db;
        BOOL imageFlag;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.storyboard instantiateViewControllerWithIdentifier:@"speakerViewTable"];
    
    
    imageFlag = YES;
    
    _speakerView.delegate = self;
    _speakerView.dataSource = self;
    
    
    UIImage *backgroundImage = [UIImage imageNamed:@"MDW 2016 Mobile APP-01.png"];
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image = backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
    speakerArr=[NSArray new];
  
    
    speaker=[SpeakerDetailViewController new];
    db = [ManagerClass myManagerObjectMethod ];
    SpeakerDetails= [NSEntityDescription insertNewObjectForEntityForName:@"Speakers" inManagedObjectContext:db.context];
    
  
    self.sessionName.text = [_sessionDetails nameSession];
    
    NSDateFormatter *formatterDate = [[NSDateFormatter alloc] init];
    [formatterDate setDateFormat: @"yyyy-MM-dd"];
    NSLog(@"%@",_sessionDetails.startDateSession);
    
    NSDateFormatter *formatterTime = [[NSDateFormatter alloc] init];
    [formatterTime setDateFormat: @"HH:mm"];

    NSDate *myNSDateInstance= [_sessionDetails startDateSession];
    
    NSString *stringFromDate = [formatterDate stringFromDate:myNSDateInstance];
    NSString *stringFromTime = [formatterTime stringFromDate:myNSDateInstance];

    

    self.sessionDate.text =stringFromDate;
    self.sessionTime.text=stringFromTime;
    self.locationNum.text = [_sessionDetails locationSession];
    //self.starIcon.image = [UIImage imageNamed:@"MDW 2016 Mobile APP tab icon-41.png"];
    NSLog(@"%@jjjj",_sessionDetails.locationSession);
    self.locationNum.text = [_sessionDetails locationSession];
    self.sessionDescription.text = [_sessionDetails descript];
    //self.speakerImg.image = [UIImage imageNamed:@"speaker.png"];
    speaker=[SpeakerDetailViewController new];
    db = [ManagerClass myManagerObjectMethod ];
    SpeakerDetails= [NSEntityDescription insertNewObjectForEntityForName:@"Speakers" inManagedObjectContext:db.context];
    
    NSSet *speakerDetails=[_sessionDetails speakerssess];
    
    speakerArr= [speakerDetails allObjects];
    
    //self.speakerName.text = [speakerArr[0] firstName];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [speakerArr count];
}

//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
//    cell.textLabel.text = speakerArr[indexPath.row];
//    
//    return cell;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"speakersDetailsView"])
    {
        DataTableViewController  *speakerDetailes = segue.destinationViewController;
        
        PeakersNoRe *currentSpeaker = [NSEntityDescription insertNewObjectForEntityForName:@"PeakersNoRe" inManagedObjectContext:db.context];
        
        [currentSpeaker setBiography:[speakerArr[[_speakerView indexPathForCell:sender].row] biography]];
        [currentSpeaker setCompanyName:[speakerArr[[_speakerView indexPathForCell:sender].row] companyName]];
        [currentSpeaker setFirstName:[speakerArr[[_speakerView indexPathForCell:sender].row] firstName]];
        
        currentSpeaker.gender = [speakerArr[[_speakerView indexPathForCell:sender].row] gender];
        currentSpeaker.idSpeaker = [speakerArr[[_speakerView indexPathForCell:sender].row] idSpeaker];
        currentSpeaker.imageSpeNo = [speakerArr[[_speakerView indexPathForCell:sender].row] imageSpe];
        currentSpeaker.imagUrlSpea = [speakerArr[[_speakerView indexPathForCell:sender].row] imageSpeakUrl];
        currentSpeaker.lastName = [speakerArr[[_speakerView indexPathForCell:sender].row] lastName];
        
        currentSpeaker.middleName = [speakerArr[[_speakerView indexPathForCell:sender].row] middleName];
        currentSpeaker.title = [speakerArr[[_speakerView indexPathForCell:sender].row] title];
        
        currentSpeaker.mobilespeakerNo = [speakerArr[[_speakerView indexPathForCell:sender].row] mobilesspse];
        currentSpeaker.phonesspeakerNo = [speakerArr[[_speakerView indexPathForCell:sender].row] phonesspse];
        
        speakerDetailes.speaker_bean_obj = currentSpeaker;
    }
}

//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [speakerArr count];
//}
//
//
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SpeakersCell"];
        
    UILabel *name = (UILabel *) [cell viewWithTag:1];
    UILabel *company = (UILabel *) [cell viewWithTag:2];
    UIImage *img = (UIImage *) [cell viewWithTag:3];
    
    name.text = [speakerArr[indexPath.row] firstName];
    company.text = [speakerArr[indexPath.row] companyName];
    //img = [UIImage imageWithData:[speakerArr[indexPath.row] imageSpeNo]];
    
    return cell;
}


- (IBAction)registerSessionAction:(id)sender
{
    if(imageFlag == YES)
    {
        UIImage *img1 = [UIImage imageNamed:@"speaker.png"];
        [_starIcon setImage:img1 forState:UIControlStateNormal];
        imageFlag = NO;
    }
    else if(imageFlag == NO)
    {
        UIImage *img2 = [UIImage imageNamed:@"orange.png"];
        [_starIcon setImage:img2 forState:UIControlStateNormal];
        imageFlag = YES;
    }
}














@end