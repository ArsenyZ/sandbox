//
//  FlightsDataSource.h
//  TestFilghts
//
//  Created by Арсений Захаров on 10/1/12.
//  Copyright (c) 2012 Арсений Захаров. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLParser.h"

@interface FlightsDataSource : NSObject <UITableViewDataSource>{
    NSMutableArray *dataSource;
    XMLParser *xmlParser;
}
@property(nonatomic) CGSize cellSize;

-(void)setSorting:(int)sortId;
-(void)populateWithData:(NSData *)data;
@end
