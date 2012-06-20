//
//  MapViewController.m
//  Hypnotime
//
//  Created by Thomas Taylor on 20/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        // initialise the object
        locationManager = [[CLLocationManager alloc] init];
        
        // set the delegate
        [locationManager setDelegate:self];
        
        // set the accuracy and sensitivity
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [locationManager setDistanceFilter:50];
        
        // set the view's tab bar title
        UITabBarItem* tbi = [self tabBarItem];
        [tbi setTitle:@"Map"];
        
        // set the tab bar's icon
        UIImage* icon = [UIImage imageNamed:@"Map.png"];
        [tbi setImage:icon];   
    }
    return self;
}

-(void)viewDidLoad
{
    [worldView setShowsUserLocation:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self findLocation];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{    
    NSLog(@"FLAG ->");
    MKCoordinateRegion zoomRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 250, 250);
    [worldView setRegion:zoomRegion animated:YES];
}

-(void)locationManager:(CLLocationManager*)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    
    // don't bother using old data
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    if(t < -180) return;
    
    [self foundLocation:newLocation];
}

-(void)findLocation
{
    [locationManager startUpdatingLocation];
}

-(void)foundLocation:(CLLocation *)_location
{
    // store the coordinate
    CLLocationCoordinate2D coord = [_location coordinate];
    
    // zoom to the annotation area
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES];
    
    [locationManager stopUpdatingLocation];
}

@end
