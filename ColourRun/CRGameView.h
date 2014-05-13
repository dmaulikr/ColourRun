//
//  CRGameView.h
//  ColourRun
//
//  Created by Ian on 26/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRColourGrid.h"
#import "CRLozengeImage.h"



@interface CRGameView : UIView
{
    CRColourGrid* _colourGrid;
    int _cellHeight;
    int _cellWidth;
    CRLozengeImage* _images[4][8];
    UIImage* _algaeImg[4];
}

-(void)setColour:(int)newColour;
-(void)restart;
-(void)undo;
@property (readonly) int count;



@end
