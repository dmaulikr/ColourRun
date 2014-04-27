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

-(id)init
{
    self=[super init];
    
    if (self)
    {
        [self initColour];
    }
    
    return self;
}


-(void)initColour
{
     _colour = arc4random() % 4;
}



@end
