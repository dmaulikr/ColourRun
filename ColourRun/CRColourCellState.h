//
//  CRColourCellState.h
//  ColourRun
//
//  Created by Ian on 10/05/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRColourCellState : NSObject

-(CRColourCellState*)newState;

@property int colour;
@property BOOL inSelection;

@end
