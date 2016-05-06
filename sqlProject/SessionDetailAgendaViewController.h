//
//  SessionDetailAgendaViewController.h
//  sqlProject
//
//  Created by JETS on 4/30/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "ViewController.h"
#import "Sessions.h"
#import "AgendaModel.h"
#import "Agendas.h"
#import "Speakers.h"
#import "Phones.h"
#import "Mobiles.h"
#import "SpeakerDetailViewController.h"

@interface SessionDetailAgendaViewController : ViewController
//@property NSArray *sessionDetail;
@property Sessions *sessionDetails;



@property (weak, nonatomic) IBOutlet UITextField *sessionName;

@property (weak, nonatomic) IBOutlet UITextField *startDate;

@property (weak, nonatomic) IBOutlet UITextField *speaker;

- (IBAction)speakerButton:(id)sender;



@end
