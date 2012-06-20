//
//  HypnosisView.h
//  Hypnosister
//
//  Created by Thomas Taylor on 12/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HypnosisView : UIView
{
    NSArray* colourList;
    int colourIndex;
}

@property (nonatomic, strong) UIColor* circleColour;

@end
