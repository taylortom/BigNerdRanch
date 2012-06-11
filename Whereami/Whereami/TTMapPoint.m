//
//  TTMapPoint.m
//  Whereami
//
//  Created by Thomas Taylor on 11/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TTMapPoint.h"

@implementation TTMapPoint

@synthesize coordinate, title;

-(id)initWithCoordinate:(CLLocationCoordinate2D)_coord title:(NSString *)_title
{
    self = [super init];
    
    if(self)
    {
        date = [[NSDate alloc] init];
        NSString* annotation = [NSString stringWithFormat:@"%@ (%@)", _title, [self getDate]];
        
        coordinate = _coord;
        [self setTitle:annotation];
    }
    
    return self;
}

-(id)init
{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Hometown"];
}

-(NSString*)getDate
{
    NSDateFormatter* format = [[NSDateFormatter alloc] init];
    [format setTimeStyle:NSDateFormatterNoStyle];
    [format setDateStyle:NSDateFormatterMediumStyle];
    return [format stringFromDate:date];
}

@end
