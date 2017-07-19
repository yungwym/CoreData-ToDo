//
//  TableViewController.m
//  ToDo CoreData
//
//  Created by Alex Wymer  on 2017-07-19.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "TableViewController.h"
#import "Task+CoreDataProperties.h"
#import "AppDelegate.h"
#import "TaskTableViewCell.h"
#import "DetailViewController.h"

@interface TableViewController ()

@property (nonatomic, strong) NSArray <Task*>*taskArray;
@property (weak, nonatomic) AppDelegate *appDelegate;
@property (nonatomic, strong) NSManagedObjectContext *context;


@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.taskArray = [NSArray new];
    self.appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.context = self.appDelegate.context;
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchWithSort];
    
    
}

-(void)setTaskArray:(NSArray<Task *> *)taskArray {
    
    _taskArray = taskArray;
    [self.tableView reloadData];
}


- (void)fetchWithSort {
    NSSortDescriptor *prioritySort = [NSSortDescriptor sortDescriptorWithKey:@"priorityNumber" ascending:NO];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    request.sortDescriptors = @[prioritySort];
    NSArray <Task*>*result = [self.context executeFetchRequest:request error:nil];
    self.taskArray = result;
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.taskArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Task *t = self.taskArray[indexPath.row];
    cell.titleLabel.text = t.title;
    cell.descriptionLabel.text = t.taskDescription;
    cell.numberLabel.text = [NSString stringWithFormat:@"%hd", t.priorityNumber];
    return cell; 
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"cell"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        Task *detailTask = self.taskArray[indexPath.row];
        
        DetailViewController *dvc = segue.destinationViewController;
        
        dvc.task = detailTask;
    }
}


@end
