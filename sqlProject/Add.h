//
//  Add.h
//  coreObjective
//
//  Created by JETS on 4/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Add : UIViewController

- (IBAction)addSpeak:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imgview;
- (IBAction)retrieveAction:(id)sender;
- (IBAction)addAction:(id)sender;
- (IBAction)addEx:(id)sender;
- (IBAction)addUser:(id)sender;
- (IBAction)deleteEntity:(id)sender;
- (IBAction)addAgenda:(id)sender;


//- (void)insertSession;
//-(void)insertusers;
//-(void)insertexhibtors;
//-(NSArray*) fetchEnyObj : (NSString*) entityName;
//-(void) deleteAnyEntity : (NSString*) entityName;

@property (strong, nonatomic) IBOutlet UITextField *mpgTf;
@property (strong, nonatomic) IBOutlet UITextField *makeTf;

@property (strong , nonatomic) NSManagedObjectContext * context;

//@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
//@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


@end
