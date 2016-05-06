//
//  exhibtorsTable.m
//  Mobile Developer WeekEnd
//
//  Created by JETS on 4/23/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "exhibtorsTable.h"
#import "ExhibitorsModel.h"
#import "ProgressHUD.h"

@interface exhibtorsTable ()

@end

@implementation exhibtorsTable


{
    ManagerClass *db ;
    exhibtorUrl * exUrlObj;
    ManagerClass *mng ;
    int statusNet  ;
}


- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    UIImageView * bgImage =[[UIImageView alloc]initWithFrame:self.view.frame];
    
    bgImage.image = [UIImage imageNamed:@"MDW 2016 Mobile APP-01.png"]; [self.view addSubview:bgImage];
    
    [self.view sendSubviewToBack:bgImage];
 
    
    ExhibitorsModel *model= [ExhibitorsModel new];
    [model test];
    [model setExhibDelegate:self];
    _exhibtorArr = [NSMutableArray new];
    

}




-(void) showExhibtors : (NSMutableArray *) exhibtorArray
{
    
    
    _exhibtorArr = exhibtorArray;
    
    //NSLog(@"\n\n $$$$$$  %@  $$$$$$ \n\n",[exhibtorArray[5] companyName]);
    
    //NSLog(@"\n\n $$$$$$  %@  $$$ property $$$ \n\n",[_exhibtorArr[5] companyName]);
    
    [self.tableView reloadData];
    
    [ProgressHUD dismiss];
    
    
    NSLog(@"\n\n $$$$$$  %@  $$$$$$ \n\n",[exhibtorArray[5] companyName]);
    NSLog(@"\n\n $$$$$$  %@  $$$$$$ \n\n",[_exhibtorArr[5] companyName]);
}



-(void)viewDidAppear:(BOOL)animated{
    [ProgressHUD show:@""];
}
-(void) showExFromSql :(NSMutableArray *) exhibtorArray {
    
// NSLog(@"showExFromSql func");
    
    _exhibtorArr=exhibtorArray;
    NSLog(@"state func = 0");
    //  NSLog(@"%@",[_exhibtorArr[1] companyName])  ;
        
     //  NSLog(@"%@", [_exhibtorArr[1] imageURLExh])  ;
       
    [self.tableView reloadData];
    [ProgressHUD dismiss];
    
    
        
    
}


//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier  isEqual: @"mySeg"]) {
//        
//        //get a reference to the destination view controller
//        exUrlObj = segue.destinationViewController ;
//        
//        //set properties on the destination view controller
//        
//        //etc...
//    }
//}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSLog(@"%ld",(long)indexPath.row);
 
    
    //using web image in exhibtor url another view have wimage
////  exhibitorUrl * exu =  [exhibitorUrl ];
//    [exUrlObj setExhibtorUrEx:_exhibtorArr [indexPath.row]] ;
//    
//    [exUrlObj setUrlCom:[_exhibtorArr[indexPath.row] companyUrl]];
//    NSLog(@"%@",[_exhibtorArr[indexPath.row] companyUrl]);
//    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[_exhibtorArr[indexPath.row] companyUrl]]];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_exhibtorArr count];
}






- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellExhib"forIndexPath:indexPath];
    
//    [_imgVu sd_setImageWithURL:[NSURL URLWithString:[_speaker_bean_obj imageUrl]]
//              placeholderImage:[UIImage imageNamed:@"avatar-placeholder.png"]
//     ];
    
    cell.textLabel.text = [_exhibtorArr[indexPath.row] companyName];
    
//   if(statusNet==1)
//   {
//    
//    NSLog(@"%ld",(long)indexPath.row);
//         NSLog(@"%@",[_exhibtorArr[indexPath.row] companyName]);
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[_exhibtorArr[indexPath.row]imageURLExh]] placeholderImage:[UIImage imageNamed:@"exihiptors.png"]];
//   }
//    
//   else{
    
    cell.imageView.image = [UIImage imageWithData:[_exhibtorArr[indexPath.row]imageEx]];
  // }
    return cell;
}
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return NO;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return YES;
}

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
 //wafaa
 
 UIWebView *webView = [[UIWebView alloc] initWithFrame: CGRectMake(0.0, 0.0, 1.0, 1.0)];
 webView.delegate = self;
 
 NSURLRequest *request = [[NSURLRequest alloc] initWithURL: [NSURL URLWithString: @"www.url.com"] cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: myTimeoutValue];
 [self.webView loadRequest: request];
}
*/



@end
