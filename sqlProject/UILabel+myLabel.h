//
//  UILabel+myLabel.h
//  customLabel
//
//  Created by JETS on 4/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
NSAttributedString *attrString;

@interface UILabel (myLabel)

-(NSAttributedString*) convertHtml :(NSString*)string;

@end
