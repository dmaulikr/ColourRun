//
//  CRGameView.m
//  ColourRun
//
//  Created by Ian on 26/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "CRGameView.h"
#import "UIImage+Color.h"

@implementation CRGameView

int MAX_HEIGHT=10;
int MAX_WIDTH=10;

int const BLUE=0;
int const RED=1;
int const GREEN=2;
int const YELLOW=3;



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
        _cellHeight=self.frame.size.height/MAX_HEIGHT;
        _cellWidth=self.frame.size.width/MAX_WIDTH;
            //UIImage* greenCircle=[UIImage imageNamed:@"circle.png"];
        
            //#0055D4
            //UIColor* red=[UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
            //UIColor* green=[UIColor colorWithRed:0 green:1 blue:0 alpha:1.0];
            //UIColor* blue=[UIColor colorWithRed:0 green:0 blue:1 alpha:1.0];
            //UIColor* blue=[UIColor colorWithRed:0 green:0x55/256 blue:0xD4/256 alpha:1.0];
            //UIColor* yellow=[UIColor colorWithRed:1 green:1 blue:0 alpha:1.0];
        
            //_cicleImg=[UIImage replaceColor:green inImage:greenCircle withTolerance:1.0f newColor:red];
        
        _images[0][0][0]=[UIImage imageNamed:@"1-1-b.png"];
        _images[1][0][0]=[UIImage imageNamed:@"2-1-b.png"];
        _images[2][0][0]=[UIImage imageNamed:@"3-1-b.png"];
        _images[3][0][0]=[UIImage imageNamed:@"4-1-b.png"];
        _images[4][0][0]=[UIImage imageNamed:@"1-1-b.png"];
        _images[5][0][0]=[UIImage imageNamed:@"2-1-b.png"];
        _images[6][0][0]=[UIImage imageNamed:@"3-1-b.png"];
        _images[7][0][0]=[UIImage imageNamed:@"0-1-b.png"];
        
        
        
        for (int i=0; i<8; ++i)
        {
            _images[i][0][RED] =[UIImage swapColor:_images[i][0][BLUE] withFunction:
                                 ^(unsigned char *r,unsigned char *g, unsigned char *b)
                                 {
                                     unsigned char tempR=*r;
                                     unsigned char tempG=*g;
                                     unsigned char tempB=*b;
                                     
                                     *r=tempB;
                                     *g=tempG;
                                     *b=tempR;
                                     
                                 }];
            _images[i][0][GREEN] =[UIImage swapColor:_images[i][0][BLUE] withFunction:
                                 ^(unsigned char *r,unsigned char *g, unsigned char *b)
                                 {
                                     unsigned char tempR=*r;
                                     unsigned char tempG=*g;
                                     unsigned char tempB=*b;
                                     
                                     *r=tempR;
                                     *g=tempB;
                                     *b=tempG;
                                     
                                 }];
            _images[i][0][YELLOW] =[UIImage swapColor:_images[i][0][BLUE] withFunction:
                                 ^(unsigned char *r,unsigned char *g, unsigned char *b)
                                 {
                                         //                                     unsigned char tempR=*r;
                                         //unsigned char tempG=*g;
                                     unsigned char tempB=*b;
                                     
                                     *r=tempB;
                                     *g=tempB;
                                     *b=0;
                                     
                                 }];
            
                                 
                                 
                                 /*
                                  
                                  ^(double time) {
                                  return time + 5.0;
                                  } steps:100];                                  */
                                 
                                 
                                 //swapBlueColorForRed:_images[i][0][BLUE]];
            
                //[UIImage replaceColor:blue inImage:_images[0][0][0] withTolerance:1.0f newColor:red];
        }
        
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
    
	CGRect innerRect = CGRectInset(rect, radius, radius);
    
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


#define radians(degrees) (degrees * M_PI/180)

UIImage *rotate(UIImage *image,int rotation) {
    CGSize size = image.size;;
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
        // If this is commented out, image is returned as it is.
    CGContextTranslateCTM( context, 0.5f * size.width, 0.5f * size.height ) ;
    CGContextRotateCTM( context, radians( rotation ) ) ;
    
    [ image drawInRect:(CGRect){ { -size.width * 0.5f, -size.height * 0.5f }, size } ] ;
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
-(UIImage*)checkSquaresForColour:(int)colour p1:(XY)p1 p2:(XY)p2 p3:(XY)p3 rotation:(int)rotatation
{
    BOOL above=[_colourGrid locationMatchesColour:colour atX:p1.x andY:p1.y];
    BOOL left=[_colourGrid locationMatchesColour:colour atX:p2.x andY:p2.y];
    BOOL aboveLeft=[_colourGrid locationMatchesColour:colour atX:p3.x andY:p3.y];
    
    int imgidx=(aboveLeft*4)+(above*2)+left;
    UIImage* img=_images[imgidx][0][colour];
    
    return rotate(img,rotatation);
}



-(UIImage*)checkSquaresForColour:(int)colour startX:(int)startX startY:(int)startY endX:(int)endX endY:(int)endY //rotateBy:(float)imageRotationFix
{
    BOOL above=[_colourGrid locationMatchesColour:colour atX:startX andY:endY];
    BOOL left=[_colourGrid locationMatchesColour:colour atX:endX andY:startY];
    BOOL aboveLeft=[_colourGrid locationMatchesColour:colour atX:endX andY:endY];
    
    int imgidx=(aboveLeft*4)+(above*2)+left;
    UIImage* img=_images[imgidx][0][colour];
    
    
        //    img.center = CGPointMake(0, 0);
        //img.transform = CGAffineTransformMakeRotation([degreesToRadians:imageRotationFix]);
    
    return img;
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
            
            
            
            float alpha=0.4;
            
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
                
                [[self checkSquaresForColour:colourCell.colour p1:XYMake(x,y-1) p2:XYMake(x-1, y) p3:XYMake(x-1,y-1) rotation:0] drawInRect:topLeft];
                [[self checkSquaresForColour:colourCell.colour p1:XYMake(x-1,y) p2:XYMake(x, y+1) p3:XYMake(x-1,y+1) rotation:-90] drawInRect:bottomLeft];
                [[self checkSquaresForColour:colourCell.colour p1:XYMake(x+1,y) p2:XYMake(x, y-1) p3:XYMake(x+1,y-1) rotation:90] drawInRect:topRight];
                [[self checkSquaresForColour:colourCell.colour p1:XYMake(x,y+1) p2:XYMake(x+1, y) p3:XYMake(x+1,y+1) rotation:180] drawInRect:bottomRight];
                    //[[self checkSquaresForColour:colourCell.colour CGPointMake(x,y-1) CGPointMake(x-1, y) CGPointMake(x-1, y-1)] drawInRect:bottomLeft];
            }
            else
            {
            
                switch (colourCell.colour) {
                    case BLUE:
                        CGContextSetRGBFillColor(context,0.0,0.0,1.0,alpha);
                        break;
                    case RED:
                        CGContextSetRGBFillColor(context,1.0,0.0,0.0,alpha);
                        break;
                    case GREEN:
                        CGContextSetRGBFillColor(context,0.0,1.0,0.0,alpha);
                        break;
                    case YELLOW:
                        CGContextSetRGBFillColor(context,1.0,1.0,0.0,alpha);
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

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
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
}


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

@end
