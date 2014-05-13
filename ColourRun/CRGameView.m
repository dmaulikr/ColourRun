//
//  CRGameView.m
//  ColourRun
//
//  Created by Ian on 26/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "CRGameView.h"
#import "CRLozengeImage.h"
#import "UIImage+Color.h"

@implementation CRGameView

int MAX_HEIGHT=10;
int MAX_WIDTH=10;



struct XY {
    int x;
    int y;
};

typedef struct XY XY;

XY XYMake(int x, int y)
{
    XY xy;
    
    xy.x=x;
    xy.y=y;
    return xy;
}

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
        CRLozengeImage* rawImages[13];
        
        int imgNums[13][2]=
        {
            {1,4},
            {1,6},
            {2,4},
            {2,6},
            {4,2},
            {4,4},
            {4,6},
            {8,4},
            {5,2},
            {5,4},
            {5,6},
            {5,9},
            {6,5}
        };
        
        for (int i=0; i<13; ++i)
        {
            rawImages[i]=[[CRLozengeImage alloc]initWithRow:imgNums[i][0] andColumn:imgNums[i][1]];
                // rawImages[i]=[[CRLozengeImage alloc]initWithImageNum:i];
        }
        
            //Top Left
        _images[0][0]=rawImages[0];
        _images[0][1]=rawImages[4];
        _images[0][2]=rawImages[2];
        _images[0][3]=rawImages[5];

            //Top Right
        _images[1][0]=rawImages[1];
        _images[1][1]=rawImages[4];
        _images[1][2]=rawImages[3];
        _images[1][3]=rawImages[6];

            //Bottom Left
        _images[2][0]=rawImages[7];
        _images[2][1]=rawImages[2];
        _images[2][2]=rawImages[8];
        _images[2][3]=rawImages[9];

            //Bottom right
        _images[3][0]=rawImages[11];
        _images[3][1]=rawImages[3];
        _images[3][2]=rawImages[8];
        _images[3][3]=rawImages[10];
        
        for (int i=0; i<4; ++i)
        {
            _images[i][4]=_images[i][0];
            _images[i][5]=_images[i][1];
            _images[i][6]=_images[i][2];
            _images[i][7]=rawImages[12];
        }

        
        _cellHeight=self.frame.size.height/MAX_HEIGHT;
        _cellWidth=self.frame.size.width/MAX_WIDTH;
        
        
        _algaeImg[BLUE]=[UIImage imageNamed:@"algae-b.png"];
        
        _algaeImg[RED] =[UIImage swapColor:_algaeImg[BLUE] withFunction:
                             ^(unsigned char *r,unsigned char *g, unsigned char *b)
                             {
                                 unsigned char tempR=*r;
                                 unsigned char tempG=*g;
                                 unsigned char tempB=*b;
                                 
                                 *r=tempB;
                                 *g=tempG;
                                 *b=tempR;
                                 
                             }];
        _algaeImg[GREEN] =[UIImage swapColor:_algaeImg[BLUE] withFunction:
                               ^(unsigned char *r,unsigned char *g, unsigned char *b)
                               {
                                   unsigned char tempR=*r;
                                   unsigned char tempG=*g;
                                   unsigned char tempB=*b;
                                   
                                   *r=tempR;
                                   *g=tempB;
                                   *b=tempG;
                                   
                               }];
        _algaeImg[YELLOW] =[UIImage swapColor:_algaeImg[BLUE] withFunction:
                                ^(unsigned char *r,unsigned char *g, unsigned char *b)
                                {
                                        //                                     unsigned char tempR=*r;
                                        //unsigned char tempG=*g;
                                    unsigned char tempB=*b;
                                    
                                    *r=tempB;
                                    *g=tempB;
                                    *b=0;
                                    
                                }];
        

        [self restart];
    }
    
    return self;
}



- (CGPathRef) newPathForRoundedRect:(CGRect)rect radius:(CGFloat)radius
                                 l:(BOOL)l
                                 r:(BOOL)r
                                 a:(BOOL)a
                                 b:(BOOL)b
{
	CGMutablePathRef retPath = CGPathCreateMutable();
    
        //	CGRect innerRect = CGRectInset(rect, radius, radius);
    
    	CGRect innerRect = CGRectInset(rect, 2, 2);
    
	CGFloat inside_right = innerRect.origin.x + innerRect.size.width;
	CGFloat outside_right = rect.origin.x + rect.size.width;
	CGFloat inside_bottom = innerRect.origin.y + innerRect.size.height;
	CGFloat outside_bottom = rect.origin.y + rect.size.height;
    
	CGFloat inside_top = innerRect.origin.y;
	CGFloat outside_top = rect.origin.y;
	CGFloat outside_left = rect.origin.x;
    
	CGPathMoveToPoint(retPath, NULL, innerRect.origin.x, outside_top);
    
	CGPathAddLineToPoint(retPath, NULL, inside_right, outside_top);
    if (a && r)
    {
        CGPathAddArcToPoint(retPath, NULL, outside_right, outside_top, outside_right, inside_top, radius);
    }
    else
    {
        CGPathAddArcToPoint(retPath, NULL, outside_right, outside_top, outside_right, inside_top, 0);
    }
    
	CGPathAddLineToPoint(retPath, NULL, outside_right, inside_bottom);
    
    
    if (b && r)
    {
        CGPathAddArcToPoint(retPath, NULL,  outside_right, outside_bottom, inside_right, outside_bottom, radius);
    }
    else
    {
        CGPathAddArcToPoint(retPath, NULL,  outside_right, outside_bottom, inside_right, outside_bottom, 0);
    }
    
	CGPathAddLineToPoint(retPath, NULL, innerRect.origin.x, outside_bottom);
    
    if (b && l)
    {
        CGPathAddArcToPoint(retPath, NULL,  outside_left, outside_bottom, outside_left, inside_bottom, radius);
    }
    else
    {
        CGPathAddArcToPoint(retPath, NULL,  outside_left, outside_bottom, outside_left, inside_bottom, 0);
    }
	CGPathAddLineToPoint(retPath, NULL, outside_left, inside_top);
    
    if (a && l)
    {
        CGPathAddArcToPoint(retPath, NULL,  outside_left, outside_top, innerRect.origin.x, outside_top, radius);
    }
    else
    {
        CGPathAddArcToPoint(retPath, NULL,  outside_left, outside_top, innerRect.origin.x, outside_top, 0);
    }
    
	CGPathCloseSubpath(retPath);
    
	return retPath;
}


-(UIImage*)checkSquaresForColour:(int)colour p1:(XY)p1 p2:(XY)p2 p3:(XY)p3 forCorner:(int)corner
{
    BOOL s1=[_colourGrid locationMatchesColour:colour atX:p1.x andY:p1.y];
    BOOL s2=[_colourGrid locationMatchesColour:colour atX:p2.x andY:p2.y];
    BOOL s3=[_colourGrid locationMatchesColour:colour atX:p3.x andY:p3.y];
    
    int imgidx=s1+(s2*2)+(s3*4);
    CRLozengeImage* lozengeImg=_images[corner][imgidx];
    
    return [lozengeImg imageWithColour:colour];
}




- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (int x=0; x<MAX_WIDTH; ++x)
    {
        for (int y=0; y<MAX_HEIGHT; ++y)
        {
            CGRect rectangle = CGRectMake(x*_cellWidth, y*_cellHeight, _cellWidth, _cellHeight);
            
            CRColourCell* colourCell=[_colourGrid colourAtLocationX:x andY:y];
            
            
            
            float alpha=1.0;
            
            if (colourCell.inSelection)
            {
                CGRect topLeft=CGRectMake(rectangle.origin.x, rectangle.origin.y, rectangle.size.width/2, rectangle.size.height/2);
                CGRect bottomLeft=CGRectMake(rectangle.origin.x, rectangle.origin.y+rectangle.size.height/2, rectangle.size.width/2, rectangle.size.height/2);
                CGRect topRight=CGRectMake(rectangle.origin.x+rectangle.size.width/2, rectangle.origin.y, rectangle.size.width/2, rectangle.size.height/2);
                CGRect bottomRight=CGRectMake(rectangle.origin.x+rectangle.size.width/2, rectangle.origin.y+rectangle.size.height/2, rectangle.size.width/2, rectangle.size.height/2);
                
                    //                alpha=1.0;
                
                /*
                BOOL above=[_colourGrid locationMatchesColour:colourCell.colour atX:colourCell.x andY:colourCell.y-1];
                BOOL left=[_colourGrid locationMatchesColour:colourCell.colour atX:colourCell.x-1 andY:colourCell.y];
                BOOL aboveLeft=[_colourGrid locationMatchesColour:colourCell.colour atX:colourCell.x-1 andY:colourCell.y-1];
                
                int img=(aboveLeft*4)+(above*2)+left;
                
                
                [_images[img][0][0] drawInRect:topLeft];
                 
                 */
                
                [[self checkSquaresForColour:colourCell.colour p1:XYMake(x-1,y) p2:XYMake(x, y-1) p3:XYMake(x-1,y-1) forCorner:0] drawInRect:topLeft];
                [[self checkSquaresForColour:colourCell.colour p1:XYMake(x+1,y) p2:XYMake(x, y-1) p3:XYMake(x+1,y-1) forCorner:1] drawInRect:topRight];
                [[self checkSquaresForColour:colourCell.colour p1:XYMake(x,y+1) p2:XYMake(x-1, y) p3:XYMake(x-1,y+1) forCorner:2] drawInRect:bottomLeft];
                [[self checkSquaresForColour:colourCell.colour p1:XYMake(x,y+1) p2:XYMake(x+1, y) p3:XYMake(x+1,y+1) forCorner:3] drawInRect:bottomRight];
                    //[[self checkSquaresForColour:colourCell.colour CGPointMake(x,y-1) CGPointMake(x-1, y) CGPointMake(x-1, y-1)] drawInRect:bottomLeft];
            }
            else
            {
                    //[_algaeImg[colourCell.colour] drawInRect:rectangle];
                
                switch (colourCell.colour) {
                    case 0:
                            //CGContextSetRGBFillColor(context,0.0,0.0,1.0,alpha);//0x99FF
                            CGContextSetRGBFillColor(context, 0.0, 153.0f/255.0f, 1.0, alpha);
                        break;
                    case 1:
                        CGContextSetRGBFillColor(context,1.0,0.0,0.0,alpha);
                        break;
                    case 2:
                        CGContextSetRGBFillColor(context,0.0,1.0,0.0,alpha);
                        break;
                    case 3:
                        CGContextSetRGBFillColor(context,1.0,1.0,0.0,alpha);
                        break;
                    case 4:
                            //                        CGContextSetRGBFillColor(context,0x99f/255,0x33f/255,0.0,alpha);
                        CGContextSetRGBFillColor(context,0xD6/255.0,0,0xD6/255.0,alpha);//Purple
                        break;
                    case 5:
                        CGContextSetRGBFillColor(context,0xFF/255.0,0x66/255.0,0x00/255.0,1.0);//Brown
                            //CGContextSetRGBFillColor(context,0.0,0.0,0.0,alpha);
                        break;
                        
                    default:
                        CGContextSetRGBFillColor(context,0.0,0.0,0.0,alpha);
                        break;
                }
             
                
                
                
                
                CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 0.5);
                    //CGContextFillRect(context, rectangle);
                
                BOOL a=(y==0 || colourCell.colour!=[_colourGrid colourAtLocationX:x andY:y-1].colour);
                BOOL b=(y==MAX_HEIGHT-1 || colourCell.colour!=[_colourGrid colourAtLocationX:x andY:y+1].colour);
                BOOL l=(x==0  || colourCell.colour!=[_colourGrid colourAtLocationX:x-1 andY:y].colour);
                BOOL r=(x==MAX_WIDTH-1 || colourCell.colour!=[_colourGrid colourAtLocationX:x+1 andY:y].colour);
                
                if (!colourCell.inSelection) {
                    a=b=l=r=NO;
                }
                
                
                CGPathRef roundedRectPath = [self newPathForRoundedRect:rectangle radius:12 l:l r:r a:a b:b];
                
                    //[[UIColor blueColor] set];
                
                CGContextAddPath(context, roundedRectPath);
                CGContextFillPath(context);
            }
        }
    }
        // Drawing code
    
}

/*- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch=[touches anyObject];
    
    CGPoint location=[touch locationInView:self];
    
    int x=location.x/_cellWidth;
    int y=location.y/_cellHeight;
    
    if (x>=0 && x<MAX_WIDTH && y>=0 && y<MAX_HEIGHT)
    {
        CRColourCell* selectedCell=[_colourGrid colourAtLocationX:x andY:y];
        
        for (CRColourCell *cell in selectedCell.group)
        {
            cell.colour=5;
        }
        
        [self setNeedsDisplay];
    }
}*/


-(void)setColour:(int)newColour
{
    [_colourGrid setColour:newColour];

    [self setNeedsDisplay];
}

-(int)count
{
    return _colourGrid.count;
}

-(void)restart
{
    _colourGrid=[[CRColourGrid alloc]initWithWidth:MAX_WIDTH andHeight:MAX_HEIGHT];
    [self setNeedsDisplay];
}


-(void)undo
{
    [_colourGrid undo];
    [self setNeedsDisplay];
}


@end
