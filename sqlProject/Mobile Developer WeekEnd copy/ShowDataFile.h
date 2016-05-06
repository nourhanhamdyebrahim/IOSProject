//
//  ShowDataFile.h
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/17/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

@protocol ShowDataFile <NSObject>

@required
-(void) showDate : (NSMutableArray *) dataArr;
-(void) showExFromSql :(NSMutableArray *) dataArr ;




@end

