//
//  exhibtorDelgate.h
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/23/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol exhibtorDelgate <NSObject>
@required
-(void) showExhibtors : (NSMutableArray *) exhibtorArray;
-(void) showExFromSql :(NSMutableArray *) exhibtorArray ;
@end
