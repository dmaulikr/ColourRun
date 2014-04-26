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
        
        for (int x=0; x<width; ++x)
        {
            NSMutableArray* colourLine=[[NSMutableArray alloc]init];
            
            for (int y=0;y<width;++y)
            {
                int r = arc4random() % 6;
                
                [colourLine addObject:[NSNumber numberWithInt:r]];
            }
            
            [_colours addObject:colourLine];
        }
    }
    
    return self;
}

-(int) colourAtLocationX:(int)x andY:(int)y
{
    NSArray* colourLine=[_colours objectAtIndex:x];
    
    NSNumber* n=[colourLine objectAtIndex:y];
    return [n intValue];
}

@end
