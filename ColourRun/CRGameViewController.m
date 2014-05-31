//
//  CRViewController.m
//  ColourRun
//
//  Created by Ian on 26/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "CRGameViewController.h"

@interface CRGameViewController ()

@end

@implementation CRGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_gameView restart:_levelNum];
    [_countLabel setText:[NSString stringWithFormat:@"Count %d",_gameView.count ]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonPressed:(id)sender
{
    NSNumber* colour=[sender valueForKeyPath:@"colour"];
    
    [_gameView setColour:colour.intValue];
    
        //    if(_gameView.isComplete)
    {
            //[self performSegueWithIdentifier:@"LEVEL_COMPLETE" sender:sender];
    }
    
    [_countLabel setText:[NSString stringWithFormat:@"Count %d",_gameView.count ]];
}

-(IBAction)restartButtonPressed:(id)sender
{
    [_gameView restart:_levelNum];
    [_countLabel setText:[NSString stringWithFormat:@"Count %d",_gameView.count ]];
}

-(IBAction)undoButtonPressed:(id)sender
{
    [_gameView undo];
}

-(void)setLevel:(int)levelNum
{
    _levelNum=levelNum;
        //    [_gameView setLevel:levelNum];
}




@end
