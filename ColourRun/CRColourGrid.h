//
//  CRColourGrid.h
//  ColourRun
//
//  Created by Ian on 26/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRColourCell.h"
#import "CRLevel.h" 

@interface CRColourGrid : NSObject
{
    int _width;
    int _height;
    int _count;
    CRColourCell* _cells[64][64];
    CRColourCell* _undoCells[64][64];
}


-(id)initWithLevel:(CRLevel*)newLevel;

    //-(id)initWithWidth:(int)width andHeight:(int)height;
-(CRColourCell*) colourAtLocationX:(int)x andY:(int)y;
-(BOOL)locationMatchesColour:(int)colour atX:(int)x andY:(int)y;

@property int count;

-(void)undo;

-(void)changeSelectedToColour:(int)newColour;
-(void)checkCellsSurroundingSelection;

-(int)height;
-(int)width;








@end
