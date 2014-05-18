//
//  CRColourGrid.m
//  ColourRun
//
//  Created by Ian on 26/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "CRColourGrid.h"

@implementation CRColourGrid
@synthesize count=_count;


-(id)initWithLevel:(CRLevel*)newLevel
{
    self=[super init];
    
    if (self)
    {
        _width=newLevel.width;
        _height=newLevel.height;
        _count=0;
        
        for (int x=0; x<_width; ++x)
        {
            for (int y=0;y<_height;++y)
            {
                CRColourCell* newCell=[[CRColourCell alloc]initWithX:x andY:y andColour:[newLevel colourAtX:x andY:y]];
                                       
                                       //[newLevel colourAt:x andY:y]];
                
                _cells[x][y]=newCell;
            }
        }
        
        _cells[0][0].inSelection=YES;
        [self checkCellsSurroundingSelection];
        
    }
    
    return self;
}



-(id)initWithWidth:(int)width andHeight:(int)height
{
    self=[super init];
    
    if (self)
    {
        _width=width;
        _height=height;
        _count=0;
        
        for (int x=0; x<width; ++x)
        {
            for (int y=0;y<height;++y)
            {
                CRColourCell* newCell=[[CRColourCell alloc]initWithX:x andY:y];
                
                _cells[x][y]=newCell;
            }
        }
        
        _cells[0][0].inSelection=YES;
        [self checkCellsSurroundingSelection];

    }
    
    return self;
}

-(CRColourCell*) colourAtLocationX:(int)x andY:(int)y
{
    return _cells[x][y];
}




-(BOOL)locationMatchesColour:(int)colour atX:(int)x andY:(int)y
{
    if (x<0 || y<0 || x>=_width || y>=_height)
    {
        return NO;
    }
    
    return (_cells[x][y].colour==colour);
}



-(void)undo
{
    for (int x=0; x<64; ++x)
    {
        for (int y=0; y<64; ++y)
        {
            [_cells[x][y] popVersion];
        }
    }
}



-(void)pushVersion
{
    for (int x=0; x<64; ++x)
    {
        for (int y=0; y<64; ++y)
        {
            [_cells[x][y] pushVersion];
        }
    }
}





-(void)checkCellsSurroundingSelection
{
    for (int x=0; x<_width; ++x)
    {
        for (int y=0;y<_height;++y)
        {
            if (_cells[x][y].inSelection)
            {
                [self checkCellsAroundX:x andY:y matchesColour:_cells[x][y].colour];
            }
        }
    }
    
}


-(void)checkIfCellAtX:(int)x andY:(int)y matchesColour:(int)colour
{
    if (x<0 || y<0 || x>=_width || y>=_height || _cells[x][y].inSelection || _cells[x][y].colour!=colour)
    {
            //reached cell that doesn't need to be checked, so quit
        return;
    }
    
    _cells[x][y].inSelection=true;
    [self checkCellsAroundX:x andY:y matchesColour:colour];
}


-(void)checkCellsAroundX:(int)x andY:(int)y matchesColour:(int)colour
{
    [self checkIfCellAtX:x-1 andY:y matchesColour:colour];
    [self checkIfCellAtX:x+1 andY:y matchesColour:colour];
    [self checkIfCellAtX:x andY:y-1 matchesColour:colour];
    [self checkIfCellAtX:x andY:y+1 matchesColour:colour];
}


-(void)changeSelectedToColour:(int)newColour
{
    [self pushVersion];
    
    
    for (int x=0; x<_width; ++x)
    {
        for (int y=0;y<_height;++y)
        {
            if (_cells[x][y].inSelection)
            {
                _cells[x][y].colour=newColour;
            }
        }
    }
}

-(int)height
{
    return _height;
}

-(int)width
{
    return _width;
}





@end
