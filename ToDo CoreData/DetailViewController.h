//
//  DetailViewController.h
//  ToDo CoreData
//
//  Created by Alex Wymer  on 2017-07-19.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task+CoreDataProperties.h"

@interface DetailViewController : UIViewController

@property (nonatomic) Task *task;

@property (weak, nonatomic) IBOutlet UILabel *detailNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailTaskLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailDescripLabel;



@end
