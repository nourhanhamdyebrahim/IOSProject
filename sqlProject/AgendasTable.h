//
//  AgendasTable.h
//  sqlProject
//
//  Created by JETS on 4/28/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowDataFile.h"
#import "Agendas.h"
#import "AgendaModel.h"
@interface AgendasTable : UITableViewController<ShowDataFile>
@property NSMutableArray * agendasArr ;

@end
