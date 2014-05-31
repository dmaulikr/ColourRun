//
//  CRLevelLoader.m
//  ColourRun
//
//  Created by Ian on 19/05/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "CRLevelLoader.h"

@implementation CRLevelLoader

CRLevelLoader* _me;

-(id)init
{
    self=[super init];
    
    if (self)
    {
        _levels=[[NSMutableDictionary alloc]init];
        
        NSString *file = [[NSBundle mainBundle] pathForResource:@"example" ofType:@"json"];
            //        NSString *str = [NSString stringWithContentsOfFile:file
            //                                      encoding:NSUTF8StringEncoding error:NULL];
            //NSLog(@"str: %@", str);
        
        _jsonData = [NSData dataWithContentsOfFile:file];


        NSError *error = nil;
        _rootData = [NSJSONSerialization JSONObjectWithData:_jsonData options:0 error:&error];
        if(error)
        {
            NSLog(@"%@",error);
        }
    }
    
    return self;
}


+(CRLevelLoader*)loader
{
    if (!_me)
    {
        _me=[[CRLevelLoader alloc]init];
    }
    
    return _me;
}


        /*
        NSArray *levels = [currentObject objectForKey:@"levels"];
        
        for (NSDictionary* line in levels)
        {
            NSLog(@"Line %@",[line objectForKey:@"1"]);
        }
        
        
        */


-(CRLevel*) loadLevel:(int)levelNum
{
    CRLevel* level=[_levels objectForKey:[NSNumber numberWithInt:levelNum]];
    
    if (!level)
    {
        NSDictionary *levelsData = [_rootData objectForKey:@"levels"];
        NSDictionary *levelData=[levelsData objectForKey:[NSString stringWithFormat:@"%d",levelNum]];
        int width=[[levelData objectForKey:@"width"] intValue];
        int height=[[levelData objectForKey:@"width"] intValue];
        NSArray* data=[levelData objectForKey:@"rows"];
        
        level=[[CRLevel alloc] initWithWidth:width andHeight:height andColours:data];
        
        [_levels setObject:level forKey:[NSNumber numberWithInt:levelNum]];
    }
    
    
    return level;
            
    
            //        NSString *title = [[nar objectAtIndex:0] objectForKey:@"title"];
            //NSLog(@"%@",title);
        
        
        /*
         NSString *fileName = @"myJsonDict.dat"; // probably somewhere in 'Documents'
         NSDictionary *dict = @{ @"key" : @"value" };
         
         NSOutputStream *os = [[NSOutputStream alloc] initToFileAtPath:fileName append:NO];
         
         [os open];
         [NSJSONSerialization writeJSONObject:dict toStream:os options:0 error:nil];
         [os close];
         
         // reading back in...
         NSInputStream *is = [[NSInputStream alloc] initWithFileAtPath:fileName];
         
         [is open];
         NSDictionary *readDict = [NSJSONSerialization JSONObjectWithStream:is options:0 error:nil];
         [is close];
         
         NSLog(@"%@", readDict);
         */
}

@end
