//
//  CRLevel.h
//  ColourRun
//
//  Created by Ian on 18/05/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRLevel : NSObject
{
    int _width;
    int _height;
    int _colours[64][64];
    int _goesAllowed[3];
}

-(id) initWithWidth:(int)width andHeight:(int)height andColours:(NSArray*)data;


-(id)initWithLevel:(int)levelNum;

@property (readonly) int width;
@property (readonly) int height;

-(int)colourAtX:(int)x andY:(int)y;
-(int)goesAllowedForStars:(int)stars;


@end
