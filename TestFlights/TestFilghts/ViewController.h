//
//  ViewController.h
//  TestFilghts
//
//  Created by Арсений Захаров on 9/30/12.
//  Copyright (c) 2012 Арсений Захаров. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlightsDataSource.h"

@interface ViewController : UIViewController <UITableViewDelegate>

@property (nonatomic, strong) IBOutlet FlightsDataSource *dataSource;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UIView *sortSelectorView;
@property (strong, nonatomic) IBOutlet UIView *preloadView;
- (IBAction)toggleSortSelector:(id)sender;
- (IBAction)sortSelected:(id)sender;

- (IBAction)doRefresh:(id)sender;

@end
