//
//  CRViewController.h
//  ColourRun
//
//  Created by Ian on 26/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRGameView.h"

@interface CRGameViewController : UIViewController
{
    IBOutlet CRGameView* _gameView;
    IBOutlet UILabel* _countLabel;
    int _levelNum;
}

-(IBAction)buttonPressed:(id)sender;
-(IBAction)undoButtonPressed:(id)sender;

-(void)setLevel:(int)levelNum;


@end
