//
//  TTMapPoint.h
//  Whereami
//
//  Created by Thomas Taylor on 11/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface TTMapPoint : NSObject <MKAnnotation>
{
    NSDate* date;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString* title;

-(id)initWithCoordinate:(CLLocationCoordinate2D)_coord title:(NSString*)_title;
-(NSString*)getDate;

@end
