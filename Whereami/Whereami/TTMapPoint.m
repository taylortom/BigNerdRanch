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
        coordinate = _coord;
        [self setTitle:_title];
    }
    
    return self;
}

-(id)init
{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Hometown"];
}

@end
