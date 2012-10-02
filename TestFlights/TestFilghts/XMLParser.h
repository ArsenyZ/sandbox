//
//  XMLParser.h
//  TestFilghts
//
//  Created by Арсений Захаров on 9/30/12.
//  Copyright (c) 2012 Арсений Захаров. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TripEntity.h"

@interface XMLParser : NSObject <NSXMLParserDelegate>
{
    
    NSMutableString *currentNodeContent;
    NSMutableArray  *trips;
    NSXMLParser     *parser;
    TripEntity      *currentTrip;
    
}

@property (readonly, retain) NSMutableArray *loadedArray;

//-(id) loadXMLByURL:(NSString *)urlString toArray:(NSMutableArray *)array;
- (id) parseData:(NSData *)data toArray:(NSMutableArray *)array;

@end
