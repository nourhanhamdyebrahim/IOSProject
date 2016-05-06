//
//  SpeakerDetailViewController.m
//  sqlProject
//
//  Created by JETS on 5/1/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "SpeakerDetailViewController.h"
#import "ProgressHUD.h"
@interface SpeakerDetailViewController ()

@end

@implementation SpeakerDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _speakerDesc.text=[_speakerDetail lastName];
    _speakerName.text=[_speakerDetail firstName];
    NSLog(@"%@speakerdeatils FirstName",_speakerDetail.firstName);
    _imgView.image= [UIImage imageNamed:@"speaker.png"];
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

@end
