//
//  CRColourGrid.h
//  ColourRun
//
//  Created by Ian on 26/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRColourCell.h"

@interface CRColourGrid : NSObject
{
    NSMutableArray* _colours;
    NSMutableArray* _groups;
    
    int _width;
    int _height;
    int _count;
}

-(id)initWithWidth:(int)width andHeight:(int)height;
-(CRColourCell*) colourAtLocationX:(int)x andY:(int)y;
-(void)setColour:(int)newColour;
@property int count;




@end
