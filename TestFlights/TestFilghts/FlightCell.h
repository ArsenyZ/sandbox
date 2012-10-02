//
//  FlightCell.h
//  TestFilghts
//
//  Created by Арсений Захаров on 10/1/12.
//  Copyright (c) 2012 Арсений Захаров. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TripEntity.h"

@interface FlightCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *labelDeparture;
@property (strong, nonatomic) IBOutlet UILabel *labelArrival;
@property (strong, nonatomic) IBOutlet UILabel *labelDuration;
@property (strong, nonatomic) IBOutlet UILabel *labelPrice;
@property (strong, nonatomic) IBOutlet UILabel *labelDepTime;
@property (strong, nonatomic) IBOutlet UILabel *labelArrTime;
@property (strong, nonatomic) IBOutlet UILabel *labelCarrier;

@property (strong,nonatomic) TripEntity *trip;

@end
