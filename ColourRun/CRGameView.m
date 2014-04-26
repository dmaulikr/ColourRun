//
//  CRGameView.m
//  ColourRun
//
//  Created by Ian on 26/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "CRGameView.h"

@implementation CRGameView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super initWithCoder:aDecoder];
    
    if (self)
    {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
        // Drawing code
    CGRect rectangle = CGRectMake(0, 100, 320, 100);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.5);
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 0.5);
    CGContextFillRect(context, rectangle);
    
}

@end
