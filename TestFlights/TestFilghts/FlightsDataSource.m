//
//  FlightsDataSource.m
//  TestFilghts
//
//  Created by Арсений Захаров on 10/1/12.
//  Copyright (c) 2012 Арсений Захаров. All rights reserved.
//

#import "FlightsDataSource.h"
#import "TripEntity.h"
#import "FlightCell.h"


@implementation FlightsDataSource
NSSortDescriptor *sortPrice;
NSSortDescriptor *sortDuration;

-(id)init{
    
    self = [super init];
    if ( self != nil ) {
        _cellSize.height = 65;
        dataSource = [[NSMutableArray alloc] init];
        sortPrice = [[NSSortDescriptor alloc] initWithKey:@"price" ascending:YES];
        sortDuration = [[NSSortDescriptor alloc] initWithKey:@"duration" ascending:YES];

    }
    return self;
}

-(void)populateWithData:(NSData *)data{
    xmlParser = [[XMLParser alloc] parseData:data toArray:dataSource];
    NSLog(@"%d",[dataSource count]);
}


-(void)setSorting:(int)sortId{
   
    switch (sortId){
        case 1:
            [dataSource sortUsingDescriptors:[NSArray arrayWithObject:sortDuration]];
         //   NSArray *newArray = [preArray sortedArrayUsingDescriptors:[NSArrayarrayWithObject:sortDescriptor]];
        break;
            
        case 0:
            [dataSource sortUsingDescriptors:[NSArray arrayWithObject:sortPrice]];
        break;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    tableView.hidden = dataSource.count==0;
    return [dataSource count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FlightCell";
    FlightCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    TripEntity *aTrip = [dataSource objectAtIndex:indexPath.row];
    cell.trip = aTrip;
    
    return cell;
}




@end
