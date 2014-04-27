//
//  CRColourCell.m
//  ColourRun
//
//  Created by Ian on 27/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "CRColourCell.h"

@implementation CRColourCell

@synthesize colour=_colour;
@synthesize inSelection=_inSelection;
@synthesize x=_x;
@synthesize y=_y;

-(id)initWithX:(int)x andY:(int)y;
{
    self=[super init];
    
    if (self)
    {
        [self initColour];
        _x=x;
        _y=y;
    }
    
    return self;
}


-(void)initColour
{
     _colour = arc4random() % 4;
}



@end
