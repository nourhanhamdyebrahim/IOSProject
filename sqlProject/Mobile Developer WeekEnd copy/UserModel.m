//
//  UserModel.m
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/8/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
{
     ManagerClass *  db ;
}
-(void)test
{
     db = [ManagerClass myManagerObjectMethod ];
    NetworkController *NC = [NetworkController ShardedNetworkController];
    [NC setJsonParserDelegate : self];
    [NC GetJsonFromURL:[JETSURLs getUserURL]];
}


-(void)statuesNet:(int)state
{
    NSLog(@"0");
    if(state==0)
    {
        
        NSMutableArray * mR= [[NSMutableArray alloc] initWithArray:[db fetchEnyObj:@"User"]] ;
        
       [_showdataDelegate  showExFromSql:mR];
    
    }
}



-(void)jsonParser:(NSDictionary *)JsonData
{
    
    NSDictionary *response = [[NSDictionary alloc] initWithDictionary:JsonData];
    NSString *state = [response valueForKey:(@"status")];
    if ([state isEqualToString:@"view.success"]) {

        NSMutableArray * userArr = [NSMutableArray new];
        NSDictionary *result = [response valueForKey:(@"result")];
         User *userData= [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:db.context];
        
        NSString *url = [JETSAddExtension addExtension:[result valueForKey:(@"imageURL")]];
        if ([result valueForKey:(@"imageURL")]== Nil) {
            
            [userData setImageUserUrl:url];
            NSURL *urlImg =    [NSURL URLWithString:url];
            NSData *imgData =     [NSData dataWithContentsOfURL:urlImg] ;
            [userData setImageUser:imgData];
            

        }
        else{
            //add def image
            [userData setImageUserUrl:Nil];
            
            
        }
//    
        
        [userData setIdUser:[result valueForKey:(@"id")]];
        [userData setCode:[result valueForKey:(@"code")]];
        if ([result valueForKey:(@"countryName")] != (id) [NSNull null]) {
        [userData setCountryName:[result valueForKey:(@"countryName")]];
        }
        [userData setCityName:[result valueForKey:(@"cityName")]];
        [userData setCompanyName:[result valueForKey:(@"companyName")]];
        [userData setTitle:[result valueForKey:(@"title")]];
        [userData setMiddleName:[result valueForKey:(@"middleName")]];
        
           if ([result valueForKey:(@"gender")] != (id) [NSNull null]) {
        BOOL gen = [[result valueForKey:(@"gender")]boolValue];
        [userData setGender:  [NSNumber numberWithBool:gen]];
        
        [userData setGender:[result valueForKey:(@"gender")]];
           }
        [userData setEmail:[result valueForKey:(@"email")]];
        [userData setFirstName:[result valueForKey:(@"firstName")]];
        [userData setLastName:[result valueForKey:(@"lastName")]];
        
         if ([result valueForKey:(@"birthDate")] != (id) [NSNull null]) {
        [userData setBirthDate:[result valueForKey:(@"birthDate")]];
             
         }
                for (MobileUser *m in userData.mobilesUser) {
            
            
            MobileUser *mobilee = [NSEntityDescription insertNewObjectForEntityForName:@"mobilesUser" inManagedObjectContext:db.context];
            
            [mobilee setMobile:m.mobile];
            NSLog(@"\n\n ********* %@ ********** \n\n",m);
            [ userData addMobilesUserObject:mobilee];
        }
        
        for (PhoneUser *m in userData.mobilesUser) {
            
            
            PhoneUser *phonee = [NSEntityDescription insertNewObjectForEntityForName:@"PhoneUser" inManagedObjectContext:db.context];
            
            [phonee setPhone:m.phone];
            NSLog(@"\n\n ********* %@ ********** \n\n",m);
            [userData addPhonesUserObject:phonee];
            
        }
        
        [userArr addObject:userData];
        
        NSLog(@"%@",[userData firstName]);
        
        NSError * error = nil ;
        if(![db.context save:& error])
        {
            printf("error in speakers ");
        }
        
    
    [_showdataDelegate showDate:userArr];

}

    
    else{
        NSLog(@"No");
    }
    }



@end
