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
    int rand = arc4random() % 4;
    
    switch (rand) {
        case 0:
            _colour.r=1.0;
            _colour.g=0.0;
            _colour.b= 0.0;
            _colour.alpha= 0.5;
            break;
        case 1:
            _colour.r=0.0;
            _colour.g=1.0;
            _colour.b= 0.0;
            _colour.alpha= 0.5;
            break;
        case 2:
            _colour.r=0.0;
            _colour.g=0.0;
            _colour.b= 1.0;
            _colour.alpha= 0.5;
            break;
        case 3:
            _colour.r=1.0;
            _colour.g=1.0;
            _colour.b= 0.0;
            _colour.alpha= 0.5;
            break;
            
        default:
            _colour.r=0.0;
            _colour.g=0.0;
            _colour.b= 0.0;
            _colour.alpha= 0.5;
            break;
    }
}



@end
