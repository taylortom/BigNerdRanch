//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Thomas Taylor on 08/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "TTMapPoint.h"
#import <UIKit/UIKit.h>

@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
{
    CLLocationManager* locationManager;
    
    IBOutlet MKMapView* worldView;
    IBOutlet UIActivityIndicatorView* activityIndicator;
    IBOutlet UITextField* locationTitleField;
    IBOutlet UISegmentedControl* mapTypeSwitch;
}

-(void)findLocation;
-(void)foundLocation:(CLLocation*)_location;
-(IBAction)onSegmentedControlUpdated:(UISegmentedControl*)sender;

@end
