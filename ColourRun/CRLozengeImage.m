//
//  CRLozengeImage.m
//  ColourRun
//
//  Created by Ian on 08/05/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "CRLozengeImage.h"
#import "UIImage+Color.h"

int const BLUE=0;
int const RED=1;
int const GREEN=2;
int const YELLOW=3;

@implementation CRLozengeImage






-(id)initWithRow:(int)row andColumn:(int)col;
{
    self=[super init];
    
    if (self)
    {
        _images[BLUE]=[self loadImageWithColour:@"blue" andRow:row andColumn:col];
        _images[YELLOW]=[self loadImageWithColour:@"yellow" andRow:row andColumn:col];
        _images[GREEN]=[self loadImageWithColour:@"green" andRow:row andColumn:col];
        _images[RED]=[self loadImageWithColour:@"red" andRow:row andColumn:col];
        _images[4]=[self loadImageWithColour:@"purple" andRow:row andColumn:col];
        _images[5]=[self loadImageWithColour:@"grey" andRow:row andColumn:col];
    }
    return self;
}

-(UIImage*)loadImageWithColour:(NSString*)colour andRow:(int)row andColumn:(int)col;
{
    NSString* imageName=[NSString stringWithFormat:@"overall2-%@_r%d_c%d.png",colour,row,col];
    
    UIImage* image=[UIImage imageNamed:imageName];
    
    if (!image)
    {
        NSLog(@"Failed to load image - %@",imageName);
    }
    
    return image;

}

-(UIImage*)imageWithColour:(int)colour
{
    return _images[colour];
}


@end
