//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by Thomas Taylor on 12/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HypnosisView.h"
#import <UIKit/UIKit.h>

@interface HypnosisterAppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate>
{
    HypnosisView* view;
}

@property (strong, nonatomic) UIWindow *window;

@end
