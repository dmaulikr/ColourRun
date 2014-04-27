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
        _colourGrid=[[CRColourGrid alloc]initWithWidth:10 andHeight:10];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (int x=0; x<10; ++x)
    {
        for (int y=0; y<10; ++y)
        {
            CGRect rectangle = CGRectMake(x*20, y*20, 20, 20);
            
            CRColourCell* colourCell=[_colourGrid colourAtLocationX:x andY:y];
            struct Colour colour=colourCell.colour;
            
            CGContextSetRGBFillColor(context,colour.r,colour.g,colour.b,colour.alpha);
            
            CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 0.5);
            CGContextFillRect(context, rectangle);
        }
    }
        // Drawing code
    
}

@end
