//
//  HeavyViewController.m
//  HeavyRotation
//
//  Created by Thomas Taylor on 20/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HeavyViewController.h"

@implementation HeavyViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // yes if orientation is portrait or either landscapes
    return (interfaceOrientation == UIInterfaceOrientationPortrait || UIInterfaceOrientationIsLandscape(interfaceOrientation));
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{    
    if(UIInterfaceOrientationIsPortrait(toInterfaceOrientation))
    {
        [twoButton setCenter: CGPointMake(160, 421.5)];
    }
    else if(UIInterfaceOrientationIsLandscape(toInterfaceOrientation))
    {
        [twoButton setCenter: CGPointMake(57, 150)];        
    }
}

@end
