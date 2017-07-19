//
//  DetailViewController.m
//  ToDo CoreData
//
//  Created by Alex Wymer  on 2017-07-19.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self updateTask];
}




-(void)updateTask {
    
    self.detailNumberLabel.text = [NSString stringWithFormat:@"%hd",self.task.priorityNumber];
    self.detailTaskLabel.text = self.task.title;
    self.detailDescripLabel.text = self.task.taskDescription;
    
    
}
@end
