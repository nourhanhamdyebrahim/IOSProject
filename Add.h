//
//  Add.h
//  coreObjective
//
//  Created by JETS on 4/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Add : UIViewController



@property (weak, nonatomic) IBOutlet UIImageView *imgview;
- (IBAction)retrieveAction:(id)sender;
- (IBAction)addAction:(id)sender;

//- (void)insertSession;
//-(void)insertusers;
//-(NSArray*) fetchEnyObj : (NSString*) entityName;
-(void) deleteEnyEntity : (NSString*) entityName ;

@property (strong, nonatomic) IBOutlet UITextField *mpgTf;
@property (strong, nonatomic) IBOutlet UITextField *makeTf;

@property (strong , nonatomic) NSManagedObjectContext * context;

//@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
//@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


@end
