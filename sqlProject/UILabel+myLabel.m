//
//  UILabel+myLabel.m
//  customLabel
//
//  Created by JETS on 4/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "UILabel+myLabel.h"

@implementation UILabel (myLabel)

-(NSAttributedString*) convertHtml:(NSString*) String{
    // String=@"<Font name=\"verdana\" size=\"4\" color=\"blue\">your</Font>";
    attrString=[[NSAttributedString alloc]initWithData:[String dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
        //self.myHLabel.attributedText=attrString;
       // htmlString=self.attributedText=attrString;
    
    return attrString;
}

@end
