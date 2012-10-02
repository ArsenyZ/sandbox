//
//  FlightEntity.h
//  TestFilghts
//
//  Created by Арсений Захаров on 9/30/12.
//  Copyright (c) 2012 Арсений Захаров. All rights reserved.
//

#import <Foundation/Foundation.h>


//<trip duration="03:50">
//<takeoff date="2010-06-19" time="07:20" city="Санкт-Петербург"/>
//<landing date="2010-06-19" time="14:15" city="Барселона"/>
//<flight carrier="AirFrance" number="1100" eq="320"/>
//<price>13329.00</price>
//</trip>
@interface TripPoint :  NSObject
@property (nonatomic) NSDate *date;
@property (nonatomic) NSString *place;
@end

@interface TripEntity : NSObject
@property (nonatomic) NSNumber *duration;
@property (nonatomic) NSNumber *price;
@property (nonatomic) TripPoint *start;
@property (nonatomic) TripPoint *end;
@property (nonatomic) NSString *carrier;
@property (nonatomic) NSString *number;
@property (nonatomic) NSString *eq;

@end


