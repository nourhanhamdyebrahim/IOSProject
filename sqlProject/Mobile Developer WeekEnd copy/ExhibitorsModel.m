//
//  ExhibitorsModel.m
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/10/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "ExhibitorsModel.h"
#import "ManagerClass.h"

@implementation ExhibitorsModel
{
    ManagerClass *db ;
}

-(void)test
{
   // ManagerClass *mng= [ManagerClass myManagerObjectMethod];
        db = [ManagerClass myManagerObjectMethod ];

     NetworkController *NC = [NetworkController ShardedNetworkController];
    [NC setJsonParserDelegate : self];
    [NC GetJsonFromURL:[JETSURLs getexhibitorURL]];
}


-(void)statuesNet:(int)state
{
   
    if(state==0)
    {
    NSLog(@"0");
  NSMutableArray * mR= [[NSMutableArray alloc] initWithArray:[db fetchEnyObj:@"Exhibitors"]] ;
    
    [_exhibDelegate showExFromSql:mR];
    }
}




-(void)jsonParser:(NSDictionary *)JsonData
{
//    ManagerClass *db = [ManagerClass myManagerObjectMethod ];
    
      [db deleteAnyEntity:@"Exhibitors"];
    NSLog(@"heloo");
    NSDictionary *response = [[NSDictionary alloc] initWithDictionary:JsonData];
    NSString *state = [response valueForKey:(@"status")];
    if ([state isEqualToString:@"view.success"]) {
       
       
        NSMutableArray *exhibtorArr = [NSMutableArray new];
        NSMutableDictionary *exhibtorDict = [NSMutableDictionary new];
        
        NSMutableArray *result = [response valueForKey:(@"result")];
        
        NSLog(@"%lu",(unsigned long)result.count);
        for (int i=0; i<[result count]; i++)
        {
            exhibtorDict = [result objectAtIndex:i];
//             JETSExhibitorsBean *exhibtorObj= [JETSExhibitorsBean new];
//            Exhibitors *exhibtorObj= [Exhibitors new];
            
            
            Exhibitors *exhibtorObj = [NSEntityDescription insertNewObjectForEntityForName:@"Exhibitors" inManagedObjectContext:db.context];
            
            
            NSString *url = [JETSAddExtension addExtension:[exhibtorDict objectForKey:@"imageURL"]];
            
            NSString *email = [exhibtorDict objectForKey:@"email"];
             NSString *countryname = [exhibtorDict objectForKey:@"countryName"];
             NSString *cityname = [exhibtorDict objectForKey:@"cityName"];
             NSString *CompanyName = [exhibtorDict objectForKey:@"companyName"];
             NSString *companyabout = [exhibtorDict objectForKey:@"companyAbout"];
             NSSet *ph = [exhibtorDict objectForKey:@"phones"];
             NSSet *mo = [exhibtorDict objectForKey:@"mobiles"];
            
            
           //  NSMutableArray *momob = [exhibtorDict objectForKey:@"mobiles"];
           //   NSMutableArray *moPh=   [exhibtorDict objectForKey:@"phones"];
            
            
            NSString *fax =[exhibtorDict objectForKey:@"fax"];
            NSString *contactTitle =[exhibtorDict objectForKey:@"contactTitle"];
            NSString *contactName =[exhibtorDict objectForKey:@"contactName"];
            NSString *companyUrl =[exhibtorDict objectForKey:@"companyUrl"];
            
             NSString *companyAddress =[exhibtorDict objectForKey:@"companyAddress"];
            
            // NSString *str=[speakerDict objectForKey:@"firstName"];
            if(email != nil)
            {
                NSString *s = [exhibtorDict objectForKey:@"email"];
                
                NSLog(@"%@",s);
                [exhibtorObj setEmail:s];
            }
            if(countryname !=nil)
            {

                [exhibtorObj setCountryName: [exhibtorDict  objectForKey:@"countryName"]];
            }
            if(cityname !=nil)
            {

            [exhibtorObj setCityName:[exhibtorDict objectForKey:@"cityName"]];
            }
            
            if(mo !=nil)
            {
                
                
                    for (MobileEx *m in exhibtorObj.mobiles) {
                    
                    
                    MobileEx *mobilee = [NSEntityDescription insertNewObjectForEntityForName:@"MobileEx" inManagedObjectContext:db.context];
                    
                    [mobilee setMobile:m.mobile];
                      NSLog(@"\n\n ********* %@ ********** \n\n",m);
                    [ exhibtorObj addMobilesObject:mobilee];
                    
                }
                
                
               
            }
            if(ph !=nil)
            {
            
                
                for (PhonesEx *p in exhibtorObj.phones)
                {
                    PhonesEx *Phonee = [NSEntityDescription insertNewObjectForEntityForName:@"PhonesEx" inManagedObjectContext:db.context];
                    
                    [Phonee setPhone:p.phone];
                    
                    [ exhibtorObj addPhonesObject:Phonee];
                    NSLog(@"\n\n ********* %@ ********** \n\n",p.phone);

                    
                }
                

                
                
                
                
            }
            if(CompanyName != nil)
            {
            [exhibtorObj setCompanyName:[exhibtorDict objectForKey:@"companyName"]];
            }
            if(companyabout!=nil)
            {
            [exhibtorObj setCompanyAbout:[exhibtorDict objectForKey:@"companyAbout"]];
            }
            
            //wafaa
              NSURL *urlImg =    [NSURL URLWithString:url];
              NSData *dd =     [NSData dataWithContentsOfURL:urlImg] ;
            if(dd!=nil)
            {
            [exhibtorObj setImageEx:dd ];
            [exhibtorObj setImageExUr:url];
            }
            

            if(fax!=nil)
            {
            [exhibtorObj setFax:[exhibtorDict objectForKey:@"fax"]];
            }
            
            if(contactName!=nil)
            {
              [exhibtorObj setContactName:[exhibtorDict objectForKey:@"contactName"]];
            }
             if(contactTitle!=nil)
             {
            [exhibtorObj setContactTitle:[exhibtorDict objectForKey:@"contactTitle"]];
             }
            if(companyUrl!=nil)
            {
                [exhibtorObj setCompanyUrl:[exhibtorDict objectForKey:@"companyUrl"]];
            }
            if(companyAddress!=nil)
            {
            [exhibtorObj setCompanyAddress:[exhibtorDict objectForKey:@"companyAddress"]];
            }
            //[speaker setJobTitle:[speakerDict objectForKey:@"title"]];
            
            //exhibtorArr = [NSMutableArray new];
            
            [exhibtorArr addObject:exhibtorObj];
            
            
            printf("done insert exhibtors");
            
            NSError * error = nil ;
            if(![db.context save:& error])
            {
                printf("error in exhibitors ");
            }

            
            
           // [db insertexhibtors:exhibtorObj];
            //NSLog(@"%@",exhibtorObj.companyName);
          //  NSLog(@"\n\n %@ array in \n\n",[exhibtorArr[i] companyName]);
        }
        
     //   NSLog(@"\n\n number of objects %lu \n\n",(unsigned long)exhibtorArr.count);
        
        NSLog(@"\n\n ********* %@ ********** \n\n",[exhibtorArr[2] companyName]);
        
        [_exhibDelegate showExhibtors:exhibtorArr];
        
        
    
    }
    
    
    else{
        NSLog(@"No");
    }
    
    NSLog(@"%@ hhhhh",state);
}
@end
