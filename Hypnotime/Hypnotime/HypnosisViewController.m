//
//  HypnosisViewController.m
//  Hypnotime
//
//  Created by Thomas Taylor on 17/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

-(void)loadView
{
    // Create a view
    CGRect frame = [[UIScreen mainScreen] bounds];
    HypnosisView* view = [[HypnosisView alloc] initWithFrame:frame];
    [self setView:view];
}

@end
