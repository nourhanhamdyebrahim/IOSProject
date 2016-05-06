//
//  SpeakerModel.m
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/7/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "SpeakerModel.h"

@implementation SpeakerModel
{
    ManagerClass *  db ;
}
-(void)test

{
    
     db = [ManagerClass myManagerObjectMethod ];
     NetworkController *NC = [NetworkController ShardedNetworkController];
     [NC setJsonParserDelegate : self];
     [NC GetJsonFromURL:[JETSURLs getSpeackerURL]];
}




-(void)statuesNet:(int)state
{
    NSLog(@"0");
    if(state==0)
    {
        
        NSMutableArray * mR= [[NSMutableArray alloc] initWithArray:[db fetchEnyObj:@"PeakersNoRe"]] ;
        
        [_showdataDelegate  showExFromSql:mR];
    }
}



-(void)jsonParser:(NSDictionary *)JsonData
{
    NSLog(@"heloo");
    NSDictionary *response = [[NSDictionary alloc] initWithDictionary:JsonData];
    NSString *state = [response valueForKey:(@"status")];
    
    if ([state isEqualToString:@"view.success"]) {
        
       [db deleteAnyEntity:@"PeakersNoRe"];
       
       //  _speakerArr =[NSMutableArray new];
        
         NSMutableArray *speakerarr = [NSMutableArray new];
        NSMutableDictionary *speakerDict = [NSMutableDictionary new];

        NSMutableArray *result = [response valueForKey:(@"result")];
        for (int i=0; i<[result count]; i++) {
            // JETSSpeakerBean *speakerObj= [JETSSpeakerBean new];
            
            
            
         PeakersNoRe *speakerObj= [NSEntityDescription insertNewObjectForEntityForName:@"PeakersNoRe" inManagedObjectContext:db.context];
            
            speakerDict = [result objectAtIndex:i];
            
            NSString *url = [JETSAddExtension addExtension:[speakerDict objectForKey:@"imageURL"]];
            // NSString *str=[speakerDict objectForKey:@"firstName"];
            [speakerObj setImagUrlSpea:url];
            
            BOOL gen = [[speakerDict   objectForKey:@"gender"] boolValue];
           
            [speakerObj setGender:  [NSNumber numberWithBool:gen]];
            
            [speakerObj setCompanyName:[speakerDict objectForKey:@"companyName"]];
            [speakerObj setTitle:[speakerDict objectForKey:@"title"]];
            [speakerObj setLastName:[speakerDict objectForKey:@"lastName"]];
            
            NSString *trimdeMidelName = [[speakerDict objectForKey:@"middleName"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] ;
            
            [speakerObj setMiddleName:trimdeMidelName];
            
            NSURL *urlImg =    [NSURL URLWithString:url];
            NSData *dd =     [NSData dataWithContentsOfURL:urlImg] ;
            
            [speakerObj setImageSpeNo:dd ];
            [speakerObj setImagUrlSpea:url];
            [speakerObj setBiography:[speakerDict objectForKey:@"biography"]];
            [speakerObj setFirstName:[speakerDict objectForKey:@"firstName"]];
            [speakerObj setTitle:[speakerDict objectForKey:@"title"]];
            

         
            for (MobileSpeakNore *m in speakerObj.mobilespeakerNo) {
                
                
                MobileSpeakNore *mobilee = [NSEntityDescription insertNewObjectForEntityForName:@"MobileSpeakNore" inManagedObjectContext:db.context];
                
                [mobilee setMobile:m.mobile];
                NSLog(@"\n\n ********* %@ ********** \n\n",m);
                [ speakerObj addMobilespeakerNoObject:mobilee];
            }
            
            for (PhonSpeakNo *m in speakerObj.phonesspeakerNo) {
                
                
                PhonSpeakNo *phonee = [NSEntityDescription insertNewObjectForEntityForName:@"PhonSpeakNo" inManagedObjectContext:db.context];
                
                [phonee setPhone:m.phone];
                NSLog(@"\n\n ********* %@ ********** \n\n",m);
                [ speakerObj addPhonesspeakerNoObject:phonee];
                
            }

            [speakerarr addObject:speakerObj];
            
            NSLog(@"%@",speakerObj.companyName);
            
            NSError * error = nil ;
            if(![db.context save:& error])
            {
                printf("error in speakers ");
            }
            
        }
        NSLog(@"%lu",(unsigned long)_speakerArr.count);
        
        NSLog(@"in model %@",[[speakerarr objectAtIndex:5] firstName]);
        
        
        [_showdataDelegate showDate:speakerarr];
       

        
       }
              else{
                  NSLog(@"No");
              }
              NSLog(@"%@ hhhhh",state);
    
    
}



@end