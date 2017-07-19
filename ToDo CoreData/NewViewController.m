//
//  NewViewController.m
//  ToDo CoreData
//
//  Created by Alex Wymer  on 2017-07-19.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "NewViewController.h"
#import "Task+CoreDataProperties.h"
#import "AppDelegate.h"

@interface NewViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descripField;
@property (weak, nonatomic) IBOutlet UITextField *priorityField;

@property (nonatomic, weak) AppDelegate *appDelegate;
@property (nonatomic, strong) NSManagedObjectContext *context;


@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.context = self.appDelegate.context;
}


- (IBAction)saveTapped:(UIBarButtonItem *)sender {
    
    [self saveData];
    [self.navigationController popViewControllerAnimated:YES];
}



-(void)saveData{
    
    NSString *title = self.titleTextField.text;
    NSString *descrip = self.descripField.text;
    int16_t num = [self.priorityField.text intValue];
    Task *task = [[Task alloc] initWithContext:self.context];
    task.title = title;
    task.taskDescription = descrip;
    task.priorityNumber = num;
    [self.appDelegate saveContext];
}


@end
