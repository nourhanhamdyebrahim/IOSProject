//
//  MyExhibtorsViewController.m
//  sqlProject
//
//  Created by JETS on 4/26/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "MyExhibtorsViewController.h"
#import "ExhibitorsModel.h"
#import "ProgressHUD.h"
@interface MyExhibtorsViewController ()

@end

@implementation MyExhibtorsViewController

{
    ManagerClass *db ;
    exhibtorUrl * exUrlObj;
    int flage;
    int statusNet  ;
}


-(void)viewDidAppear:(BOOL)animated{
    if(flage!=1)
    [ProgressHUD show:@""];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"MDW 2016 Mobile APP-01.png"]]];
    
    ExhibitorsModel *model= [ExhibitorsModel new];
    [model test];
    
    db =[ManagerClass myManagerObjectMethod];
    
   [model setExhibDelegate:self];
    _exhibtorArr = [NSMutableArray new];


}




-(void) showExhibtors : (NSMutableArray *) exhibtorArray
{
    
    _exhibtorArr = exhibtorArray;
    
    [_tableView reloadData];
    
    [db deleteAnyEntity:@"Exhibitors"];
    
    for(int i =0 ; i<[_exhibtorArr count]; i++)
    {
        
        
        
        JETSExhibitorsBean *oneEx = [JETSExhibitorsBean new];
        
        oneEx.companyName = [_exhibtorArr[i] companyName];
        oneEx.idEx = [_exhibtorArr[i] idEx];
        
        // [ sd_setImageWithURL:[NSURL URLWithString:[_exhibtorArr[i] imageURLExh] ] placeholderImage:[UIImage imageNamed:@"d.png"]];
        
        
        //  NSURL *urlImg =    [NSURL URLWithString:[_exhibtorArr[i]imageURLExh]];
        //   UIImage *img = [UIImage new];
        //   NSData *dd =     [NSData dataWithContentsOfURL:urlImg] ;
        
        oneEx.imageDataExh = [_exhibtorArr[i] imageDataExh];
        
        
        oneEx.imageURLExh = [_exhibtorArr[i] imageURLExh];
        oneEx.companyAddress= [_exhibtorArr[i] companyAddress];
        oneEx.companyAbout = [_exhibtorArr[i] companyAbout];
        oneEx.fax = [_exhibtorArr[i] fax];
        oneEx.contactName = [_exhibtorArr[i] contactName];
        oneEx.contactTitle = [_exhibtorArr[i] contactTitle];
        oneEx.companyUrl = [_exhibtorArr[i] companyUrl];
        oneEx.email = [_exhibtorArr[i] email];
        oneEx.countryName = [_exhibtorArr[i] countryName];
        oneEx.cityName= [_exhibtorArr[i] cityName];
        oneEx.companyName= [_exhibtorArr[i] companyName];
        oneEx.cityName= [_exhibtorArr[i] cityName];
        
        NSArray *arEs=   [[_exhibtorArr[i] phones] allObjects];
        NSMutableArray *muEx = [[NSMutableArray alloc] initWithArray:arEs];
        oneEx.phones= muEx;
        
        
        NSArray *arEs2=   [[_exhibtorArr[i] phones] allObjects];
        NSMutableArray *muEx2 = [[NSMutableArray alloc] initWithArray:arEs2];
        oneEx.mobiles= muEx2;
        
        
        //oneEx.mobiles= [_exhibtorArr[i] mobiles];
        [ProgressHUD dismiss];
        
        
       
    }
}

-(void) showExFromSql:(int) statusOfInternet
{
    
    // NSLog(@"showExFromSql func");
    statusNet = statusOfInternet ;
    
    //    //tes
    //    JETSExhibitorsBean *exObj = [JETSExhibitorsBean new];
    //    exObj.companyName =@"com";
    //    NSArray *ppEs = [[NSArray alloc] initWithObjects:@"258", nil];
    //
    //    exObj.phones = [[NSMutableArray alloc] initWithArray:ppEs];
    //    [db insertexhibtors:exObj];
    
    if(statusOfInternet==0)
    {
        
        
        NSLog(@"state func = 0");
        _exhibtorArr= [[NSMutableArray alloc] initWithArray:[db fetchEnyObj:@"Exhibitors"]] ;
        
        //  NSLog(@"%@",[_exhibtorArr[1] companyName])  ;
        
        //  NSLog(@"%@", [_exhibtorArr[1] imageURLExh])  ;
        
        [_tableView reloadData];
       [ProgressHUD dismiss];
        
        
    }
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



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_exhibtorArr count];
}






- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellExhib"forIndexPath:indexPath];
    flage=1;
    //    [_imgVu sd_setImageWithURL:[NSURL URLWithString:[_speaker_bean_obj imageUrl]]
    //              placeholderImage:[UIImage imageNamed:@"avatar-placeholder.png"]
    //     ];
    
    cell.textLabel.text = [_exhibtorArr[indexPath.row] companyName];
    
    if(statusNet==1)
    {
        
        
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[_exhibtorArr[indexPath.row]imageURLExh]] placeholderImage:[UIImage imageNamed:@"exihiptors.png"]];
    }
    
    else{
        
        cell.imageView.image = [UIImage imageWithData:[_exhibtorArr[indexPath.row]imageEx]];
    }
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
