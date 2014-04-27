//
//  CRColourCell.h
//  ColourRun
//
//  Created by Ian on 27/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <UIKit/UIKit.h>

struct Colour
{
    CGFloat r;
    CGFloat g;
    CGFloat b;
    CGFloat alpha;
};

@interface CRColourCell : NSObject
{
    struct Colour _colour;
}

@property (readonly) struct Colour colour;




@end
