//
//  SessionDetailAgendaViewController.m
//  sqlProject
//
//  Created by JETS on 4/30/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "SessionDetailAgendaViewController.h"

@interface SessionDetailAgendaViewController ()

@end

@implementation SessionDetailAgendaViewController
{
    SpeakerDetailViewController *speaker;
    Speakers *SpeakerDetails;
    NSArray *speakerArr;
    ManagerClass *db;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    speakerArr=[NSArray new];
    _sessionName.text=[_sessionDetails nameSession];
   // _speaker.text=[_sessionDetails sessionTage];
    
    _startDate.text=[_sessionDetails sessionType];
    
    speaker=[SpeakerDetailViewController new];
     db = [ManagerClass myManagerObjectMethod ];
    SpeakerDetails= [NSEntityDescription insertNewObjectForEntityForName:@"Speakers" inManagedObjectContext:db.context];
       // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier ]isEqualToString:@"speaker"]){
        speaker=segue.destinationViewController;
        
        speaker.speakerDetail=SpeakerDetails;
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
- (IBAction)speakerButton:(id)sender {
    //
    NSSet *speakerDetails=[_sessionDetails speakerssess];
    
    speakerArr= [speakerDetails allObjects];
    _speaker.text=[speakerArr[0] biography];
    NSLog(@"%@speakerarr ",speakerArr[0]);
    NSLog(@"%dCountOfSpeakerArr",speakerArr.count);
    NSLog(@"%@speakerarr fn",[speakerArr[0] firstName]);
    NSLog(@"%@speakerarr ln",[speakerArr[0] lastName]);
    
    //  NSLog(@"%@speakerarr bio",[speakerArr[1] biography]);
    SpeakerDetails.firstName=[speakerArr[0] firstName];
    SpeakerDetails.biography=[speakerArr[0] biography];
    NSLog(@"%@biography: ",SpeakerDetails.biography);
    SpeakerDetails.imageSpe=[speakerArr[0] imageSpe];
    SpeakerDetails.imageSpeakUrl=[speakerArr[0] imageSpeakUrl];
    SpeakerDetails.lastName=[speakerArr[0] lastName];
    SpeakerDetails.companyName=[speakerArr[0] companyName];
    SpeakerDetails.middleName=[speakerArr[0] middleName];
    SpeakerDetails.title=[speakerArr[0] title];
    SpeakerDetails.phonesspse=[speakerArr[0] phonesspse];
    SpeakerDetails.mobilesspse=[speakerArr[0] mobilesspse];
    SpeakerDetails.gender=[speakerArr[0] gender];
    SpeakerDetails.sessionsSpea=[speakerArr[0] sessionsSpea];
    SpeakerDetails.idSpeaker=[speakerArr[0] idSpeaker];
    speaker.speakerDetail=self->SpeakerDetails;
    NSLog(@"%@speakerDetail ln",speaker.speakerDetail.lastName);
    //

 
  //  [self performSegueWithIdentifier:@"speaker" sender:self];
    
}
@end
