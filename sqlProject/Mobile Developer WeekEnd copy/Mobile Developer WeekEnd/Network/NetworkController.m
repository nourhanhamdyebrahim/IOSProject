//
//  NetworkController.m
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/6/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "NetworkController.h"

@implementation NetworkController

+(id)ShardedNetworkController
{
    static NetworkController *SharedNetworkObj=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        SharedNetworkObj = [[self alloc] init];
        NSLog(@"heloo");
    });
    return SharedNetworkObj;
}


-(void)GetJsonFromURL:(NSString*)stringURL
{
    NSURL *url = [NSURL URLWithString:stringURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        
//        // 3
        NSDictionary *result = (NSDictionary *)responseObject;
        //self.title = @"JSON Retrieved";
//        [self.tableView reloadData];
        
        [self.jsonParserDelegate jsonParser:result];
        [self.jsonParserDelegate statuesNet:1];
         NSLog(@"heloo succ");
        
   
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 4
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
//                                                            message:[error localizedDescription]
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"Ok"
//                                                  otherButtonTitles:nil];
//         NSLog(@"heloofaild");
//        
          [self.jsonParserDelegate statuesNet:0];
//        
//       [alertView show];
        
        
        
    }];
    
    // 5
    [operation start];
}
@end
