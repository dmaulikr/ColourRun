//
//  CRLevelSelectCell.h
//  ColourRun
//
//  Created by Ian on 24/05/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRLevelSelectCell : UICollectionViewCell
{
    IBOutlet UILabel* _levelLabel;
    int _levelNum;
}


-(void)setLevel:(int)levelNum;
-(int)level;
    //-(void)

@end
