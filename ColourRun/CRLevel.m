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


-(id) initWithWidth:(int)width andHeight:(int)height andColours:(NSArray*)data
{
    self=[super init];
    
    if (self)
    {
        _width=width;
        _height=height;
    
        int y=0;
        for (NSDictionary* line in data)
        {
            NSString* row=[line objectForKey:@"row"];
            NSUInteger len = [row length];
        
            for(int x = 0; x < len; x++)
            {
                NSString *number = [row substringWithRange:NSMakeRange(x, 1)];
                _colours[x][y]=[number intValue];
            }
        
            ++y;
        }
    }
    
    return self;
}



-(id)initWithLevel:(int)levelNum
{
    self=[super init];
    
    if (self)
    {
        
        NSString *file = [[NSBundle mainBundle] pathForResource:@"example" ofType:@"json"];
        
        NSData *jsonData = [NSData dataWithContentsOfFile:file];
        
        NSError *error = nil;
        NSDictionary *currentObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        if(error)
        {
            NSLog(@"%@",error);
        }
        
        /*
         NSArray *levels = [currentObject objectForKey:@"levels"];
         
         for (NSDictionary* line in levels)
         {
         NSLog(@"Line %@",[line objectForKey:@"1"]);
         }
         
         
         */
        
        
        NSDictionary *levels = [currentObject objectForKey:@"levels"];
        NSDictionary *level=[levels objectForKey:[NSString stringWithFormat:@"%d",levelNum]];
        _width=[[level objectForKey:@"width"] intValue];
        _height=[[level objectForKey:@"width"] intValue];
        NSArray* data=[level objectForKey:@"rows"];
        
        
        
            //        NSLog(@"Level %d,%d",width,height);
        int y=0;
        for (NSDictionary* line in data)
        {
            NSString* row=[line objectForKey:@"row"];
            
            NSUInteger len = [row length];
                //            unichar buffer[len+1];
            
                //[row getCharacters:buffer range:NSMakeRange(0, len)];
            
                //NSLog(@"getCharacters:range: with unichar buffer");
            
            for(int i = 0; i < len; i++)
            {
                NSString *number = [row substringWithRange:NSMakeRange(i, 1)];
                _colours[i][y]=[number intValue];
            }
            
            ++y;
        }
        
        
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
