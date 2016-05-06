//
//  RightMenuViewController.m
//  TesterMenu
//
//  Created by JETS on 4/6/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "RightMenuViewController.h"
#import "HomeViewController.h"


@implementation RightMenuViewController
{
    NSArray *names; 
    NSArray *images;
}
#pragma mark - UIViewController Methods -

- (void)viewDidLoad
{
	[super viewDidLoad];
    [_imgv setImage:[UIImage imageNamed:@"speaker.png"]];
    images=@[@"agenda.png",@"myagenda.png",@"speaker.png",@"exihiptors.png",@"profile.png",@"logout.png"];
    names=@[@"Agenda",@"MyAgenda",@"Speakers",@"Exhibitors",@"Profile",@"LogOut"];
	self.tableView.separatorColor = [UIColor grayColor];
	
	//UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightMenu.jpg"]];
	//self.tableView.backgroundView = imageView;
}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 6;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
	view.backgroundColor = [UIColor clearColor];
	return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rightMenuCell"];
    
	
	    cell.contentView.transform=CGAffineTransformMakeScale(-1, 1);
    cell.textLabel.transform=CGAffineTransformMakeScale(-1, 1);
      cell.imageView.transform=CGAffineTransformMakeScale(-1, 1);
    cell.textLabel.text=[names objectAtIndex:indexPath.row];
    cell.imageView.image=[UIImage imageNamed:[images objectAtIndex:indexPath.row]];
   
	
	cell.backgroundColor = [UIColor clearColor];
    //cell.imageView.image = [[UIImage imageNamed:@"agenda.png"]];
    
    cell.textLabel.textColor = [UIColor blackColor];
   // [[cell imageView] initWithImage:[UIImage imageWithContentsOfFile:@"agenda.png"]];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	id <SlideNavigationContorllerAnimator> revealAnimator;
	CGFloat animationDuration = 0;
    
    UIStoryboard *mainStoryboard =self.storyboard;
    UIViewController *vc ;

	
	switch (indexPath.row)
	{
		case 0:
			revealAnimator = nil;
			animationDuration = .19;
            NSLog(@"asmaaAß");
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"TabBarViewController"];
            [self.navigationController pushViewController:vc animated:YES];
			
            break;
			
		case 1:
			revealAnimator = [[SlideNavigationContorllerAnimatorSlide alloc] init];
			animationDuration = .19;
             vc= [mainStoryboard instantiateViewControllerWithIdentifier: @"HomeViewController"];
			break;
			
		case 2:
			revealAnimator = [[SlideNavigationContorllerAnimatorFade alloc] init];
			animationDuration = .18;
            vc= [mainStoryboard instantiateViewControllerWithIdentifier: @"test2"];
            break;
			
		case 3:
			revealAnimator = [[SlideNavigationContorllerAnimatorSlideAndFade alloc] initWithMaximumFadeAlpha:.8 fadeColor:[UIColor blackColor] andSlideMovement:100];
			animationDuration = .19;
            vc= [mainStoryboard instantiateViewControllerWithIdentifier: @"exhibtorsTable"];
            break;
			
		case 4:
			revealAnimator = [[SlideNavigationContorllerAnimatorScale alloc] init];
			animationDuration = .22;
            vc= [mainStoryboard instantiateViewControllerWithIdentifier: @"ProfileViewController"];
            break;
			
		case 5:
			revealAnimator = [[SlideNavigationContorllerAnimatorScaleAndFade alloc] initWithMaximumFadeAlpha:.6 fadeColor:[UIColor blackColor] andMinimumScale:.8];
			animationDuration = .22;
            vc= [mainStoryboard instantiateViewControllerWithIdentifier: @"HomeViewController"];
            break;
			
		default:
			return;
	}
    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
                                                             withSlideOutAnimation:
     YES
                                                                     andCompletion:nil];
	
	[[SlideNavigationController sharedInstance] closeMenuWithCompletion:^{
		[SlideNavigationController sharedInstance].menuRevealAnimationDuration = animationDuration;
		[SlideNavigationController sharedInstance].menuRevealAnimator = revealAnimator;
	}];
    
}

@end
