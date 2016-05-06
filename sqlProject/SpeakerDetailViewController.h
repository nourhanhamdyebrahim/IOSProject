//
//  SpeakerDetailViewController.h
//  sqlProject
//
//  Created by JETS on 5/1/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "ViewController.h"
#import "Sessions.h"
#import "AgendaModel.h"
#import "Agendas.h"
#import "Speakers.h"
#import "Phones.h"
#import "Mobiles.h"

@interface SpeakerDetailViewController : ViewController
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UITextView *speakerDesc;
@property (weak, nonatomic) IBOutlet UILabel *speakerName;
@property Speakers *speakerDetail;
@end
