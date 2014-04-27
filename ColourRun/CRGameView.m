//
//  CRGameView.m
//  ColourRun
//
//  Created by Ian on 26/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "CRGameView.h"

@implementation CRGameView

int MAX_HEIGHT=12;
int MAX_WIDTH=10;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super initWithCoder:aDecoder];
    
    if (self)
    {
        _colourGrid=[[CRColourGrid alloc]initWithWidth:MAX_WIDTH andHeight:MAX_HEIGHT];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (int x=0; x<MAX_WIDTH; ++x)
    {
        for (int y=0; y<MAX_HEIGHT; ++y)
        {
            CGRect rectangle = CGRectMake(x*20, y*20, 20, 20);
            
            CRColourCell* colourCell=[_colourGrid colourAtLocationX:x andY:y];
            
            
            switch (colourCell.colour) {
                case 0:
                    CGContextSetRGBFillColor(context,1.0,0.0,0.0,1.0);
                    break;
                case 1:
                    CGContextSetRGBFillColor(context,0.0,1.0,0.0,1.0);
                    break;
                case 2:
                    CGContextSetRGBFillColor(context,1.0,1.0,0.0,1.0);
                    break;
                case 3:
                    CGContextSetRGBFillColor(context,0.0,0.0,1.0,1.0);
                    break;
                    
                default:
                    CGContextSetRGBFillColor(context,0.0,0.0,0.0,1.0);
                    break;
            }
            
            
            
            
            CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 0.5);
            CGContextFillRect(context, rectangle);
        }
    }
        // Drawing code
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch=[touches anyObject];
    
    CGPoint location=[touch locationInView:self];
    
    int x=location.x/20;
    int y=location.y/20;
    
    if (x>=0 && x<MAX_WIDTH && y>=0 && y<MAX_HEIGHT)
    {
        CRColourCell* selectedCell=[_colourGrid colourAtLocationX:x andY:y];
        
        for (CRColourCell *cell in selectedCell.group)
        {
            cell.colour=5;
        }
        
        [self setNeedsDisplay];
        
        NSLog(@"Colour %d",selectedCell.colour);
    }
}


-(void)setColour:(int)newColour
{
    CRColourCell* selectedCell=[_colourGrid colourAtLocationX:0 andY:0];
    
    for (CRColourCell *cell in selectedCell.group)
    {
        cell.colour=newColour;
    }
    
    [_colourGrid scanGroups];
    
    [self setNeedsDisplay];
    
}

@end
