//
//  CRColourCell.h
//  ColourRun
//
//  Created by Ian on 27/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CRColourCell : NSObject
{
    int _colour;
    BOOL _inSelection;
}


@property int colour;
@property BOOL inSelection;
@property (weak) NSMutableArray* group;

@end
