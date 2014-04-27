//
//  CRColourGrid.m
//  ColourRun
//
//  Created by Ian on 26/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "CRColourGrid.h"

@implementation CRColourGrid

-(id)initWithWidth:(int)width andHeight:(int)height
{
    self=[super init];
    
    if (self) {
        _width=width;
        _height=height;
        
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
                CRColourCell* newCell=[[CRColourCell alloc]init];
                
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



-(void)createGroups
{
    for (int x=0; x<_width-1; ++x)
    {
        for (int y=0;y<_height;++y)
        {
            CRColourCell* currentCell=[self colourAtLocationX:x andY:y];
            CRColourCell* cellBelow=[self colourAtLocationX:x+1 andY:y];
            
            if (cellBelow.colour==currentCell.colour)
            {
                    //merge cells
                
                NSMutableArray* currentGroup=currentCell.group;
                NSMutableArray* groupBelow=cellBelow.group;
                
                
                if (currentGroup!=groupBelow)
                {
                    for ( CRColourCell* newCell in groupBelow)
                    {
                        [currentGroup addObject:newCell];
                        newCell.group=currentGroup;
                    }
                    [_groups removeObject:groupBelow];
                }
            }
        }
    }
}

-(void)scanGroups
{
}

-(void)extendSelection
{
    
}

@end
