//
//  MyExhibtorsViewController.h
//  sqlProject
//
//  Created by JETS on 4/26/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "exhibtorDelgate.h"
#import "UIImageView+WebCache.h"
#import "exhibtorUrl.h"
#import "UIImage+GIF.h"
#import "UIImage+MultiFormat.h"
#import "UIImage+WebP.h"
#import "ManagerClass.h"

@interface MyExhibtorsViewController : UIViewController<exhibtorDelgate , UITableViewDataSource , UITableViewDelegate>

@property NSMutableArray * exhibtorArr ;
//@property exhibtorUrl * exUrlObj;
@property int state ;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
