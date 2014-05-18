//
//  CRColourCell.m
//  ColourRun
//
//  Created by Ian on 27/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "CRColourCell.h"

@implementation CRColourCell

    //@synthesize colour=_colour;
    //@synthesize inSelection=_inSelection;
@synthesize x=_x;
@synthesize y=_y;

-(id)initWithX:(int)x andY:(int)y;
{
    self=[super init];
    
    if (self)
    {
        _state=[[CRColourCellState alloc]init];
        _prevStates=[[NSMutableArray alloc]init];
        
        [self initColour];
        _x=x;
        _y=y;
        _state.inSelection=NO;
            //[self pushVersion];
    }
    
    return self;
}


-(id)initWithX:(int)x andY:(int)y andColour:(int)colour
{
    self=[super init];
    
    if (self)
    {
        _state=[[CRColourCellState alloc]init];
        _prevStates=[[NSMutableArray alloc]init];
        
        _state.colour=colour;
        _x=x;
        _y=y;
        _state.inSelection=NO;
    }
    
    return self;
}


-(void)pushVersion
{
    [_prevStates addObject:_state];
    _state=[_state newState ];
}

-(void)popVersion
{
    if (_prevStates.count==0)
    {
        return;
    }
    
    _state=[_prevStates lastObject];
    [_prevStates removeLastObject];
}


-(void)initColour
{
     _state.colour = arc4random() % 6;
    NSLog(@"Colour %d",_state.colour);
}

-(int)colour
{
    return _state.colour;
}

-(void)setColour:(int)colour
{
    _state.colour=colour;
}

-(BOOL)inSelection
{
    return _state.inSelection;
}

-(void)setInSelection:(BOOL)inSelection
{
    _state.inSelection=inSelection;
}



@end
