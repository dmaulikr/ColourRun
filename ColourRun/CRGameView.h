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
    UIImage* _cicleImg;
    UIImage*  _images[8][4][6];
}

-(void)setColour:(int)newColour;
-(void)restart;
@property (readonly) int count;


FOUNDATION_EXPORT int const BLUE;
FOUNDATION_EXPORT int const RED;
FOUNDATION_EXPORT int const GREEN;
FOUNDATION_EXPORT int const YELLOW;


@end
