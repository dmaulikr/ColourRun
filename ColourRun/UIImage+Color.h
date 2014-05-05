//
//  UIImage+Color.h
//  ColourRun
//
//  Created by Ian on 01/05/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

+ (UIImage*)setBackgroundImageByColor:(UIColor *)backgroundColor withFrame:(CGRect )rect;


+ (UIImage*) replaceColor:(UIColor*)color inImage:(UIImage*)image withTolerance:(float)tolerance newColor:(UIColor*)newColor;

    //+(UIImage *)changeWhiteColorTransparent: (UIImage *)image;

    //+(UIImage *)changeColorTo:(NSMutableArray*) array Transparent: (UIImage *)image;

+ (UIImage*) swapBlueColorForRed:(UIImage*)image;

+ (UIImage*) swapColor:(UIImage*)image withFunction:(void (^)(unsigned char*,unsigned char*,unsigned char* )) manipulationFunc;



    //resizing Stuff...
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;



@end
