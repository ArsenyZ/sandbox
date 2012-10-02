//
//  XMLParser.m
//  TestFilghts
//
//  Created by Арсений Захаров on 9/30/12.
//  Copyright (c) 2012 Арсений Захаров. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser
static NSLocale* en_US_POSIX = nil;
NSDateFormatter *df;
NSMutableArray  *currArray;



- (id) parseData:(NSData *)data toArray:(NSMutableArray *)array{
    df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm'\a'"];//date="2010-06-19" time="07:20"
    en_US_POSIX = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [df setLocale:en_US_POSIX];
    [df setTimeZone:[NSTimeZone systemTimeZone]];

    parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    [array removeAllObjects];
    currArray = array;
   
    [parser parse];
    return self;

    
}
-(NSDate*) dateFromStringDate:(NSString *)rawDate withFormat:(NSString *)format{
    [df setDateFormat:format];
    NSDate *res =[df dateFromString:rawDate];
    return res;
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementname isEqualToString:@"trip"])
    {
        currentTrip = [TripEntity alloc];
        NSString *rDuration =[attributeDict valueForKey:@"duration"];
        NSNumber *duration =  [NSNumber numberWithInt:([[rDuration substringToIndex:2] integerValue]*60+[[rDuration substringFromIndex:3] integerValue])];
        currentTrip.duration =  duration; 
    }
    if ([elementname isEqualToString:@"takeoff"] || [elementname isEqualToString:@"landing"]){
        TripPoint *nPoint =  [TripPoint alloc];
        NSDate *nDate = [self dateFromStringDate:[[attributeDict valueForKey:@"date"] stringByAppendingFormat:@" %@", [attributeDict valueForKey:@"time"]] withFormat:@"yyyy-MM-dd HH:mm"];
        //
            nPoint.date = nDate;
            nPoint.place = [attributeDict valueForKey:@"city"];
      
            if([elementname isEqualToString:@"takeoff"]){
                currentTrip.start = nPoint;
            }else{
                currentTrip.end = nPoint;
            }
    }
    if ([elementname isEqualToString:@"flight"]){
        currentTrip.carrier = [attributeDict valueForKey:@"carrier"];
        currentTrip.number = [attributeDict valueForKey:@"number"];
        currentTrip.eq = [attributeDict valueForKey:@"eq"];
    }
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementname isEqualToString:@"price"])
    {
        currentTrip.price = [NSNumber numberWithFloat:[currentNodeContent floatValue]];
    }
    if ([elementname isEqualToString:@"trip"])
    {
        [currArray addObject:currentTrip];
               currentTrip = nil;
        currentNodeContent = nil;
    }
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    currentNodeContent = (NSMutableString *) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
