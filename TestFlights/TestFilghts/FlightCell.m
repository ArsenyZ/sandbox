//
//  FlightCell.m
//  TestFilghts
//
//  Created by Арсений Захаров on 10/1/12.
//  Copyright (c) 2012 Арсений Захаров. All rights reserved.
//

#import "FlightCell.h"

@implementation FlightCell

+(NSString *)reuseIdentifier

{
    return @"FlightCell";

}

NSDateFormatter *df;


-(void)awakeFromNib{
    [super awakeFromNib];
    df = [[NSDateFormatter alloc] init];
 
}

-(void)setTrip:(TripEntity *)trip{
    _trip = trip;
    if(_trip){
    _labelArrival.text = _trip.end.place;
    _labelDeparture.text = _trip.start.place;
    _labelDuration.text = [NSString stringWithFormat:@"%02d:%02d",(int)([_trip.duration integerValue]/60),(int)([_trip.duration integerValue]%60)];
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        [nf setNumberStyle:NSNumberFormatterCurrencyStyle];
        [nf setCurrencyCode:@"RUR "];//NSLocaleCurrencyCode];
        _labelPrice.text = [nf stringFromNumber:_trip.price];
           [df setDateFormat:@"dd-MM-yy HH:mm"];
        _labelArrTime.text = [df stringFromDate:_trip.end.date];
        _labelDepTime.text = [df stringFromDate:_trip.start.date];
        _labelCarrier.text = _trip.carrier;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
