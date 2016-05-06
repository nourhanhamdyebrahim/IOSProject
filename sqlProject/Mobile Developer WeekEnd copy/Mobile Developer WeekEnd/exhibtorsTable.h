//
//  exhibtorsTable.h
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/23/16.
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
@interface exhibtorsTable : UITableViewController <exhibtorDelgate>
@property NSMutableArray * exhibtorArr ;
//@property exhibtorUrl * exUrlObj;
@property int state ;
@end
