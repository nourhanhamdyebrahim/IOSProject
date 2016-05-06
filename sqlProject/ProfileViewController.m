//
//  ProfileViewController.m
//  sqlProject
//
//  Created by JETS on 4/23/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

{int flage;}


-(void) showExFromSql :(NSMutableArray *) dataArr {
    NSLog(@"in sql fun");
    User *userData =dataArr[0];
    
    
    [_fullName setText:[NSString stringWithFormat:@"%@ %@ %@" ,[userData firstName],[userData middleName],[userData lastName]]];
    [_job setText:[userData title]];
    [_companyName setText:[userData companyName]];
    UIImage *myimg = [UIImage imageNamed:@"Desert.jpg"];
    [_qrcode1 setImage:myimg];
    [_email setText:[userData email]];
    NSString *ticket =[userData code];
    
    NSLog(@"the ticket %@",ticket);
    ZXMultiFormatWriter *writer = [[ZXMultiFormatWriter alloc] init];
    ZXBitMatrix *result = [writer encode:ticket
                                  format:kBarcodeFormatQRCode
                                   width:_qrcode1.frame.size.width
                                  height:_qrcode1.frame.size.width
                                   error:nil];
    
    if (result) {
        ZXImage *image = [ZXImage imageWithMatrix:result];
        _qrcode1.image = [UIImage imageWithCGImage:image.cgimage];
    } else {
        _qrcode1.image = nil;
    }
    
    
    
    // NSLog(@"%@ hello from view",[userData mobiles]);
    
    
    [_qrcode2 setImage:myimg];

    
    //add al mobile
    for (MobileUser *m in [userData mobilesUser])
    {
        
        
        [ _mobile setText:m.mobile];
        NSLog(@"\n\n ********* %@ ********** \n\n",m);
        
    }
    
    
    //    for (PhoneUser *m in [userData phonesUser])
    //    {
    //
    //        [ _phon setText:m.PhoneUser];
    //        NSLog(@"\n\n ********* %@ ********** \n\n",m);
    //
    //    }
    
    [ProgressHUD dismiss];

    
    
    
    NSLog(@"%dcount",[dataArr count])  ;
    NSLog(@"state func = 0");

}

-(void)viewDidAppear:(BOOL)animated{
 
    [ProgressHUD show:@""];
}



-(void) showDate:(NSMutableArray *)dataArr
{
    NSLog(@"in network fun");
    User *userData = [dataArr objectAtIndex:0];
    
    [_fullName setText:[NSString stringWithFormat:@"%@ %@ %@" ,[userData firstName],[userData middleName],[userData lastName]]];
    [_job setText:[userData title]];
    [_companyName setText:[userData companyName]];
    UIImage *myimg = [UIImage imageNamed:@"Desert.jpg"];
    //[_qrcode1 setImage:myimg];
    [_email setText:[userData email]];
    
   // NSLog(@"%@ hello from view",[userData mobiles]);
    NSString *ticket =[userData code];
    
    NSLog(@"the ticket %@",ticket);
    ZXMultiFormatWriter *writer = [[ZXMultiFormatWriter alloc] init];
    ZXBitMatrix *result = [writer encode:ticket
                                  format:kBarcodeFormatQRCode
                                   width:_qrcode1.frame.size.width
                                  height:_qrcode1.frame.size.width
                                   error:nil];
    
    if (result) {
        ZXImage *image = [ZXImage imageWithMatrix:result];
        _qrcode1.image = [UIImage imageWithCGImage:image.cgimage];
    } else {
        _qrcode1.image = nil;
    }
    
    
    
    // NSLog(@"%@ hello from view",[userData mobiles]);
    
    
    
    
    
    [_qrcode2 setImage:myimg];
    
  //add al mobile
    for (MobileUser *m in [userData mobilesUser])
    {
        
        
    [ _mobile setText:m.mobile];
        NSLog(@"\n\n ********* %@ ********** \n\n",m);
       
    }

    
//    for (PhoneUser *m in [userData phonesUser])
//    {
//        
//        [ _phon setText:m.PhoneUser];
//        NSLog(@"\n\n ********* %@ ********** \n\n",m);
//        
//    }

        [ProgressHUD dismiss];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UserModel *usermodel = [UserModel new];
    [usermodel setShowdataDelegate:self];
     [usermodel test];
    NSLog(@"hereeeeeeeee");
    
//    UIImage *myimg = [UIImage imageNamed:@"Desert.jpg"];
//    [_qrcode2 setImage:myimg];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    NSLog(@"no of section \n \n ");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    NSLog(@"no of row \n \n ");
    return 3;
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell;
//    NSLog(@"cell");
//    if ([indexPath row] == 0) {
//        cell = [tableView dequeueReusableCellWithIdentifier:@"main" forIndexPath:indexPath];
//        NSLog(@"cell1");
//    }
//    if ([indexPath row] == 1) {
//        cell = [tableView dequeueReusableCellWithIdentifier:@"sub" forIndexPath:indexPath];
//        NSLog(@"cell2");
//    }
//    if ([indexPath row] == 2) {
//        cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//        NSLog(@"cell3");
//    }
//    
//
//
//
//    return cell;
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)moreData:(id)sender {
}
@end
