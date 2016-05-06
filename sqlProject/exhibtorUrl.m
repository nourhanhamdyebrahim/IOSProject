//
//  exhibtorUrl.m
//  sqlProject
//
//  Created by JETS on 4/23/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "exhibtorUrl.h"

@interface exhibtorUrl ()

@end

@implementation exhibtorUrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
     NSLog(@"%@",[_exhibtorUrEx companyUrl]);
    NSLog(@"%@",_urlCom);
    
//    UIWebView *webView = [[UIWebView alloc] initWithFrame: CGRectMake(0.0, 0.0, 1.0, 1.0)];
//    webView.delegate = self;
//    
//     NSURLRequest *request = [[NSURLRequest alloc] initWithURL: [NSURL URLWithString: [_exhibtorUrEx companyUrl]] cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval:NSTimeIntervalSince1970];
//    
//    [self.webImagEx loadRequest: request];

    
    
//    NSURL *url = [NSURL URLWithString:[_exhibtorUrEx companyUrl]]; // NOTE: https secure request
//    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
//    [_webImagEx loadRequest:req];
//    [_webImagEx setScalesPageToFit:true] ;
    
    
    
    
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
