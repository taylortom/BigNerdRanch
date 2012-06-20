//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Thomas Taylor on 12/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

@synthesize circleColour;

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        // add some colours to the list
        colourList = [NSArray arrayWithObjects:[UIColor lightGrayColor], 
                                               [UIColor redColor], 
                                               [UIColor purpleColor],
                                               [UIColor blueColor], 
                                               [UIColor greenColor],
                                               [UIColor yellowColor],
                                               [UIColor orangeColor], nil];
        colourIndex = 0;
                
        // give all HypnosisViews clear background
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColour:[colourList objectAtIndex:0]];
    }
    
    return self;
}

-(void)drawRect:(CGRect)dirtyRect
{
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    // get the centre of the bounds rect
    CGPoint centre;
    centre.x = bounds.origin.x + (bounds.size.width/2);
    centre.y = bounds.origin.y + (bounds.size.height/2);
    
    // set the max radius
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2;
    
    // set line width
    CGContextSetLineWidth(contextRef, 10);
    
    // set line colour
    [[self circleColour] setStroke];
    
    // draw concentric circles from the outside in
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) 
    {
        // add a path to the context
        CGContextAddArc(contextRef, centre.x, centre.y, currentRadius, 0.0, M_PI*2, YES);
        
        // draw the shape with the above state (removes path)
        CGContextStrokePath(contextRef);
    }
    
    // add some text
    NSString* text = @"You are getting sleepy";
    UIFont* font = [UIFont boldSystemFontOfSize:28];
    
    // text container
    CGRect textRect;
    textRect.size = [text sizeWithFont:font];
    textRect.origin.x = centre.x - textRect.size.width/2;
    textRect.origin.y = centre.y - textRect.size.height/2;
    
    [[UIColor blackColor] setFill];
    
    // add a shadow
    CGSize offset = CGSizeMake(2, 1);
    CGColorRef colour = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(contextRef, offset, 2, colour);
    
    [text drawInRect:textRect withFont:font];
}

-(void)setCircleColour:(UIColor *)_circleColour
{
    circleColour = _circleColour;
    [self setNeedsDisplay];
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) 
    {        
        // update the colour index
        if(colourIndex < [colourList count]-1) colourIndex++; 
        else colourIndex = 0;
        
        [self setCircleColour:[colourList objectAtIndex:colourIndex]];
    }
}

@end
