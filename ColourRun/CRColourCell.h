//
//  CRColourCell.h
//  ColourRun
//
//  Created by Ian on 27/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRColourCellState.h"

struct CellState
{
    int _colour;
    BOOL _inSelection;
};

typedef struct CellState CellState;

@interface CRColourCell : NSObject
{
    CRColourCellState* _state;
    NSMutableArray* _prevStates;
    int _x;
    int _y;
}




-(id)initWithX:(int)x andY:(int)y;

@property int x;
@property int y;


@property int colour;
@property BOOL inSelection;

-(void)pushVersion;
-(void)popVersion;


@end
