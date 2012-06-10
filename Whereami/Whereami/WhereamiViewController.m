//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Thomas Taylor on 08/06/2012.
//  Copyright (c) 2012 taylortom. All rights reserved.
//

#import "WhereamiViewController.h"

@interface WhereamiViewController ()

@end

@implementation WhereamiViewController

-(void)dealloc
{
    [locationManager setDelegate:nil];
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self)
    {
        // initialise the object
        locationManager = [[CLLocationManager alloc] init];
        
        // set the delegate
        [locationManager setDelegate:self];
        
        // set the accuracy and sensitivity
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [locationManager setDistanceFilter:50];
        
        // start the heading checker (providing devices supports it...)
        [locationManager setHeadingFilter:90];
        if([CLLocationManager headingAvailable]) [locationManager startUpdatingHeading];
        else NSLog(@"Warning: heading updates unavailable");
    }
    
    return self;
}

-(void)viewDidLoad
{
    [worldView setShowsUserLocation:YES];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{    
    MKCoordinateRegion zoomRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 250, 250);
    [worldView setRegion:zoomRegion animated:YES];
}

-(void)locationManager:(CLLocationManager*)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"didUpdateHeading: %@", newHeading);
}

-(void)locationManager:(CLLocationManager*)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
}

@end
