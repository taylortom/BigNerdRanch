//
//  MapViewController.h
//  Hypnotime
//
//  Created by Thomas Taylor on 20/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

@interface MapViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
{
    CLLocationManager* locationManager;
    IBOutlet MKMapView* worldView;
}

-(void)findLocation;
-(void)foundLocation:(CLLocation*)_location;

@end
