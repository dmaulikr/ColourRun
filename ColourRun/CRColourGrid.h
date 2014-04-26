//
//  CRColourGrid.h
//  ColourRun
//
//  Created by Ian on 26/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRColourGrid : NSObject
{
    NSMutableArray* _colours;
    int _width;
    int _height;
}

-(id)initWithWidth:(int)width andHeight:(int)height;
-(int) colourAtLocationX:(int)x andY:(int)y;



@end
