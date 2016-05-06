//
//  exhibtorUrl.h
//  sqlProject
//
//  Created by JETS on 4/23/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exhibitors.h"
@interface exhibtorUrl : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webImagEx;
@property Exhibitors * exhibtorUrEx ;
@property NSString *urlCom ;
@end
