//
//  CRGameView.h
//  ColourRun
//
//  Created by Ian on 26/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRColourGrid.h"



@interface CRGameView : UIView
{
    CRColourGrid* _colourGrid;
    int _cellHeight;
    int _cellWidth;
}

-(void)setColour:(int)newColour;
-(void)restart;

@end
