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

-(id)initWithWidth:(int)width andHeight:(int)height
{
    self=[super init];
    
    if (self) {
        _width=width;
        _height=height;
        _count=0;
        
        _colours=[[NSMutableArray alloc]init];
        _groups=[[NSMutableArray alloc]init];
        NSMutableArray* currentGroup=NULL;
        
        
        for (int x=0; x<width; ++x)
        {
            int prevColour=-1;
            currentGroup=NULL;

            NSMutableArray* colourLine=[[NSMutableArray alloc]init];
            
            for (int y=0;y<height;++y)
            {
                CRColourCell* newCell=[[CRColourCell alloc]initWithX:x andY:y];
                
                if (newCell.colour!=prevColour)
                {
                    currentGroup=[[NSMutableArray alloc]init];
                    [_groups addObject:currentGroup];
                    [currentGroup addObject:newCell];
                    [newCell setGroup:currentGroup];
                }
                else
                {
                    [currentGroup addObject:newCell];
                    [newCell setGroup:currentGroup];
                }
                
                
                prevColour=newCell.colour;
                
                [colourLine addObject:newCell];
            }
            
            [_colours addObject:colourLine];
        }
        [self createGroups];
    }
    
    return self;
}

-(CRColourCell*) colourAtLocationX:(int)x andY:(int)y
{
    NSArray* colourLine=[_colours objectAtIndex:x];
    
    return [colourLine objectAtIndex:y];
}


-(void)checkNewCell:(CRColourCell*)newCell againstCurrentCell:(CRColourCell*)currentCell
{
    if (newCell.colour==currentCell.colour)
    {
            //merge cells
        
        NSMutableArray* currentGroup=currentCell.group;
        NSMutableArray* newGroup=newCell.group;
        
        if (currentGroup!=newGroup)
        {
            for ( CRColourCell* tempCell in newGroup)
            {
                [currentGroup addObject:tempCell];
                tempCell.group=currentGroup;
            }
            [_groups removeObject:newGroup];
        }
    }
}




-(void)createGroups
{
    for (int x=0; x<_width-1; ++x)
    {
        for (int y=0;y<_height;++y)
        {
            CRColourCell* currentCell=[self colourAtLocationX:x andY:y];
            CRColourCell* cellBelow=[self colourAtLocationX:x+1 andY:y];
            
            [self checkNewCell:cellBelow againstCurrentCell:currentCell];
        }
    }
}

-(void)checkSurroundingCell:(CRColourCell*)currentCell xOffset:(int)newX yOffset:(int)newY
{
    if (newX>=_width ||newX<0) {
        return;
    }
    
    if (newY>=_height ||newY<0) {
        return;
    }
    
    CRColourCell* compareCell=[self colourAtLocationX:newX andY:newY];

    [self checkNewCell:compareCell againstCurrentCell:currentCell];
}



-(void)checkSurroundingCells:(CRColourCell*)currentCell
{
    [self checkSurroundingCell:currentCell xOffset:currentCell.x+1 yOffset:currentCell.y];
    [self checkSurroundingCell:currentCell xOffset:currentCell.x-1 yOffset:currentCell.y];
    [self checkSurroundingCell:currentCell xOffset:currentCell.x yOffset:currentCell.y+1];
    [self checkSurroundingCell:currentCell xOffset:currentCell.x yOffset:currentCell.y-1];
}

-(void)setColour:(int)newColour
{
    CRColourCell* selectedCell=[self colourAtLocationX:0 andY:0];
    NSArray* tempGroup=[[NSArray alloc]initWithArray:selectedCell.group];
    
    for (CRColourCell *cell in selectedCell.group)
    {
        cell.colour=newColour;
    }
    
    for (CRColourCell *cell in tempGroup)
    {
        [self checkSurroundingCells:cell];
    }
    ++_count;
}

-(void)extendSelection
{
    
}

@end
