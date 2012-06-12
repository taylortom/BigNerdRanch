//
//  LogoView.m
//  Hypnosister
//
//  Created by Thomas Taylor on 12/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LogoView.h"

@implementation LogoView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if(self)
    {
        // give all HypnosisViews clear background
        [self setBackgroundColor:[UIColor clearColor]];
    }

    return self;
}
    
-(void)drawRect:(CGRect)dirtyRect
{
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    // add the circle 'mask'
    CGContextAddArc(contextRef, bounds.origin.x+bounds.size.width/2, bounds.origin.y+bounds.size.height/2, 150, 0.0, M_PI*2, YES);
    CGContextClip(contextRef);
    
    NSString* logoName = [[NSBundle mainBundle] pathForResource:@"applelogo" ofType:@"png"];
    UIImage* logo = [[UIImage alloc] initWithContentsOfFile:logoName];
    CGPoint logoPoint = CGPointMake(bounds.origin.x+bounds.size.width/2-75, bounds.origin.y+bounds.size.height/2-75);
    [logo drawAtPoint:logoPoint];
    
    // set line colour
    [[UIColor greenColor] setStroke];
}


@end
