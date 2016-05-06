//
//  AgendaModel.m
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/8/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "AgendaModel.h"

@implementation AgendaModel
{
    ManagerClass *db;
}

-(void)test
{
    db = [ManagerClass myManagerObjectMethod ];
    NetworkController *NC = [NetworkController ShardedNetworkController];
    [NC setJsonParserDelegate : self];
    [NC GetJsonFromURL:[JETSURLs getAgendasURL]];
}




-(void)statuesNet:(int)state
{
    NSLog(@"0");
    if(state==0)
    {
        
        NSMutableArray * mR= [[NSMutableArray alloc] initWithArray:[db fetchEnyObj:@"Agendas"]] ;
        
        [_showdataDelegate  showExFromSql:mR];
    }
}



-(void)jsonParser:(NSDictionary *)JsonData
{
    NSLog(@"heloo");
     [db deleteAnyEntity:@"Agendas"];
    NSDictionary *response = [[NSDictionary alloc] initWithDictionary:JsonData];
    NSString *state = [response valueForKey:(@"status")];
    
    if ([state isEqualToString:@"view.success"]) {
        NSDictionary *result = [response valueForKey:(@"result")];
    //    NSString *date = [result valueForKey:(@"date")];
        
        NSArray *agends = [result valueForKey:(@"agendas")];
        
        NSMutableArray *allDaysAgend = [[NSMutableArray alloc] init];
        
        for (NSDictionary *agedaPerDay in agends) {
            
 Agendas *agenda = [NSEntityDescription insertNewObjectForEntityForName:@"Agendas" inManagedObjectContext:db.context];
            
            NSNumber *numDateSta=      [agedaPerDay objectForKey:(@"date")];
    
           double d = [numDateSta doubleValue];
         NSTimeInterval interval = d;
           NSDate *date= [NSDate date];
           date= [NSDate dateWithTimeIntervalSince1970:interval];
            [agenda setStartDateAgenda:date];
            
       NSNumber*numDatEnd= [agedaPerDay objectForKey:(@"endDate")];
            if([agedaPerDay objectForKey:(@"endDate")]!= (id) [NSNull null])
            {
            double end = [numDatEnd doubleValue];
            NSTimeInterval intervalEnd = end;
            NSDate *dateEnd= [NSDate date];
            dateEnd= [NSDate dateWithTimeIntervalSince1970:intervalEnd];
            [agenda setEndDateAgenda:dateEnd];
            
             NSLog(@"\n\n ********* %@ ********** \n\n",[agedaPerDay objectForKey:(@"date")]);
            }
            NSMutableArray *sesstionsArray = [agedaPerDay objectForKey:(@"sessions")];
            
          //  NSMutableArray *sesstionsPerAgenda = [NSMutableArray new];
              
            for (NSDictionary *singleSesstion in sesstionsArray) {
                
 Sessions *sessionPerDay= [NSEntityDescription insertNewObjectForEntityForName:@"Sessions" inManagedObjectContext:db.context];
                
                [sessionPerDay setIdSession:[singleSesstion objectForKey:(@"id")]];
                
                [sessionPerDay setSessionType:[singleSesstion objectForKey:(@"sessionType")]];
                
                [sessionPerDay setNameSession:[singleSesstion objectForKey:(@"name")]];
                [sessionPerDay setDescript:[singleSesstion objectForKey:(@"description")]];
                 NSLog(@"\n\n ********* %@ ********** \n\n",[singleSesstion objectForKey:(@"description")]);
//looooooook
               // [sessionPerDay setStartData:[singleSesstion objectForKey:(@"startDate")]];
                
                
                NSNumber *numDateSta= [singleSesstion objectForKey:(@"startDate")];
                
                double d = [numDateSta doubleValue];
                NSTimeInterval interval = d/1000;
                NSDate *date= [NSDate date];
                date= [NSDate dateWithTimeIntervalSince1970:interval];
                [sessionPerDay setStartDateSession:date];

              //  [sessionPerDay setEndDate:[singleSesstion objectForKey:(@"endDate")]];
                
                NSNumber*numDatEnd= [singleSesstion objectForKey:(@"endDate")];
                if([singleSesstion objectForKey:(@"endDate")]!= (id) [NSNull null])
                {
                    double end = [numDatEnd doubleValue];
                    NSTimeInterval intervalEnd = end/1000;
                    NSDate *dateEnd= [NSDate date];
                    dateEnd= [NSDate dateWithTimeIntervalSince1970:intervalEnd];
                     [sessionPerDay setEndDateSession:dateEnd];
                }

                

                [sessionPerDay setLocationSession:[singleSesstion objectForKey:(@"location")]];

                [sessionPerDay setLiked:[singleSesstion objectForKey:(@"liked")]];

                [sessionPerDay setStatues:[singleSesstion objectForKey:(@"status")]];
                
                if([singleSesstion objectForKey:(@"speakers")]!= (id) [NSNull null])
                {
                
                for(NSDictionary *speakerDict  in [singleSesstion objectForKey:(@"speakers")])
                {
                    
                    Speakers *speakerObj= [NSEntityDescription insertNewObjectForEntityForName:@"Speakers" inManagedObjectContext:db.context];
                    NSString *url = [JETSAddExtension addExtension:[speakerDict objectForKey:@"imageURL"]];
                    // NSString *str=[speakerDict objectForKey:@"firstName"];
                    [speakerObj setImageSpeakUrl:url];
                    
                    BOOL gen = [[speakerDict   objectForKey:@"gender"] boolValue];
                    
                    [speakerObj setGender:  [NSNumber numberWithBool:gen]];
                    
                    [speakerObj setCompanyName:[speakerDict objectForKey:@"companyName"]];
                     NSLog(@"\n\n ********* %@ ********** \n\n",[speakerDict objectForKey:@"companyName"]);
                    [speakerObj setTitle:[speakerDict objectForKey:@"title"]];
                    [speakerObj setLastName:[speakerDict objectForKey:@"lastName"]];
                    
                    NSString *trimdeMidelName = [[speakerDict objectForKey:@"middleName"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] ;
                    
                    [speakerObj setMiddleName:trimdeMidelName];
                    
                    NSURL *urlImg =    [NSURL URLWithString:url];
                    NSData *dd =     [NSData dataWithContentsOfURL:urlImg] ;
                    
                    [speakerObj setImageSpe:dd ];
                    [speakerObj setImageSpeakUrl:url];
                    [speakerObj setBiography:[speakerDict objectForKey:@"biography"]];
                    [speakerObj setFirstName:[speakerDict objectForKey:@"firstName"]];
                    [speakerObj setTitle:[speakerDict objectForKey:@"title"]];
                    
                    
                    
                    for (NSString *m  in [speakerDict objectForKey:(@"mobiles")]) {
                        
                        
                        Mobiles *mobilee = [NSEntityDescription insertNewObjectForEntityForName:@"Mobiles" inManagedObjectContext:db.context];
                        
                        [mobilee setMobile:m];
                        NSLog(@"\n\n ********* %@ ********** \n\n",m);
                        
                        [ speakerObj addMobilesspseObject:mobilee];
                    }
                    
                    for (NSString *m in [speakerDict objectForKey:(@"phones")]) {
                        
                        
                        Phones *phonee = [NSEntityDescription insertNewObjectForEntityForName:@"Phones" inManagedObjectContext:db.context];
                        
                        [phonee setPhone:m];
                        
                        NSLog(@"\n\n ********* %@ ********** \n\n",m);
                        [ speakerObj addPhonesspseObject:phonee];
                        
                    }
                    
                    [sessionPerDay addSpeakerssessObject:speakerObj];
                    NSLog(@"%@location: ",sessionPerDay.locationSession);
                }
                }
                [agenda addSessionsAgendaObject:sessionPerDay];
                
               // [agenda setSessionsAgenda:sesstionsPerAgenda];
                NSLog(@"%@",[singleSesstion objectForKey:(@"liked")]);
            }
            
            
            [allDaysAgend addObject:agenda];
            
    }
        
        NSError * error = nil ;
        if(![db.context save:& error])
        {
            printf("error in speakers ");
        }
        
        [_showdataDelegate showDate:allDaysAgend];
            }
    
    else{
        NSLog(@"No");
    }
    NSLog(@"%@ hhhhh",state);
}

@end
