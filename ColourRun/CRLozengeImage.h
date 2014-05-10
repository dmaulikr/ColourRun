//
//  CRLozengeImage.h
//  ColourRun
//
//  Created by Ian on 08/05/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRLozengeImage : NSObject
{
    UIImage* _images[4];
}

-(id)initWithRow:(int)row andColumn:(int)col;

-(UIImage*)imageWithColour:(int)colour;


FOUNDATION_EXPORT int const BLUE;
FOUNDATION_EXPORT int const RED;
FOUNDATION_EXPORT int const GREEN;
FOUNDATION_EXPORT int const YELLOW;





@end
