//
//  CRLevelSelectCell.m
//  ColourRun
//
//  Created by Ian on 24/05/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "CRLevelSelectCell.h"

@implementation CRLevelSelectCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
            //self.backgroundColor = [UIColor colorWithWhite:0.85f alpha:1.0f];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super initWithCoder:aDecoder];
    
    if (self) {
            //self.backgroundColor = [UIColor colorWithWhite:0.85f alpha:1.0f];
    }
    return self;

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


-(void)setLevel:(int)levelNum
{
    [_levelLabel setText:[NSString stringWithFormat:@"%d",levelNum]];
}

-(int)level
{
    return _levelNum;
}

@end
