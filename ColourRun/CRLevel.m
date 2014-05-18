//
//  CRLevel.m
//  ColourRun
//
//  Created by Ian on 18/05/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "CRLevel.h"

@implementation CRLevel




-(id)init
{
    self=[super init];
    
    if (self)
    {
        _width=4;
        _height=4;
        
        int tempColours[6][6]=
        {
            {0,1,5,3,4,5},
            {1,1,5,3,4,5},
            {5,3,2,3,1,2},
            {3,1,2,3,4,5},
            {2,1,2,3,4,5},
            {0,1,2,3,4,5}
        };
        
        for (int x=0; x<_width; ++x)
        {
            for (int y=0; y<_height; ++y)
            {
                _colours[x][y]=tempColours[x][y];
            }
        }
        
        _goesAllowed[0]=10;
        _goesAllowed[1]=6;
        _goesAllowed[2]=4;

        /*
        _colours[1]={0,1,2,3,4,5};
        _colours[2]={0,1,2,3,4,5};
        _colours[3]={0,1,2,3,4,5};
        _colours[4]={0,1,2,3,4,5};
        _colours[5]={0,1,2,3,4,5};
         */
    }
    return self;
}

    


-(int) width
{
    return _width;
}

-(int) height
{
    return _height;
}

-(int)colourAtX:(int)x andY:(int)y
{
    return _colours[x][y];
}

-(int)goesAllowedForStars:(int)stars
{
    return _goesAllowed[stars];
}


@end
