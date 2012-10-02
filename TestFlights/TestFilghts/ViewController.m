//
//  ViewController.m
//  TestFilghts
//
//  Created by Арсений Захаров on 9/30/12.
//  Copyright (c) 2012 Арсений Захаров. All rights reserved.
//

#import "ViewController.h"
#import "XMLParser.h"
#import "FlightsDataSource.h"
#import "URLConnection.h"

@interface ViewController (){
 XMLParser *xmlParser;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [_tableView registerNib:[UINib nibWithNibName:@"FlightCell" bundle:nil] forCellReuseIdentifier:@"FlightCell"];
 
    _dataSource = [[FlightsDataSource alloc] init];
    _tableView.dataSource = _dataSource;
    
    [self loadDataFromUrl:@"http://sevkin.ru/flights.xml"];
    
 
   
    [super viewDidLoad];
}

-(void)loadDataFromUrl:(NSString*)url{
    
   
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self.view addSubview:_preloadView];
    [URLConnection asyncConnectionWithRequest:request
                              completionBlock:^(NSData *data, NSURLResponse *response) {
                                  [ _dataSource populateWithData:data];
                                  [self.tableView reloadData];
                                  [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                                  //  [progress dismiss];
                                
                                  [_preloadView removeFromSuperview];
                              } errorBlock:^(NSError *error) {
                                  NSLog(@"ERROR Loading data");
                                  [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                                   [_preloadView removeFromSuperview];
                                  //  [progress dismissWithError:@"Error!"];
                                  
                              } uploadPorgressBlock:^(float progress) {
                                  
                                  //Upload progress (0..1)
                                  
                              } downloadProgressBlock:^(float progress) {
                                  
                                  //Download progress (0.1)
                                  
                              }];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _dataSource.cellSize.height;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)toggleSortSelector:(id)sender {
    if(self.tableView.tableHeaderView ==nil){
        [_sortSelectorView setFrame:CGRectMake(0, 44, _sortSelectorView.frame.size.width, _sortSelectorView.frame.size.height)];
        self.tableView.tableHeaderView = _sortSelectorView;
    }else{
        self.tableView.tableHeaderView = nil;
    }
}

- (IBAction)sortSelected:(id)sender {
    UISegmentedControl *control = (UISegmentedControl *)sender;
    [_dataSource setSorting:[control selectedSegmentIndex]];
    self.tableView.tableHeaderView = nil;
    [self.tableView reloadData];
  
}

- (IBAction)doRefresh:(id)sender {
    [self loadDataFromUrl:@"http://sevkin.ru/flights.xml"];
}
@end
