//
//  CRLevelLoader.h
//  ColourRun
//
//  Created by Ian on 19/05/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRLevel.h"

@interface CRLevelLoader : NSObject
{
    NSData* _jsonData;
    NSDictionary *_rootData;
    NSMutableDictionary* _levels;
}

-(CRLevel*) loadLevel:(int)levelNum;
+(CRLevelLoader*)loader;


@end
