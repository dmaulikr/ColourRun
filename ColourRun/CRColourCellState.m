//
//  CRColourCellState.m
//  ColourRun
//
//  Created by Ian on 10/05/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "CRColourCellState.h"

@implementation CRColourCellState

-(CRColourCellState*)newState
{
    CRColourCellState* newState=[[CRColourCellState alloc]init];
    
    newState.inSelection=self.inSelection;
    newState.colour=self.colour;
    
    return newState;
}
@end
