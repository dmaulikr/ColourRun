//
//  CRViewController.m
//  ColourRun
//
//  Created by Ian on 26/04/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "CRViewController.h"

@interface CRViewController ()

@end

@implementation CRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
    [_countLabel setText:[NSString stringWithFormat:@"Count %d",_gameView.count ]];
}

-(IBAction)restartButtonPressed:(id)sender
{
    [_gameView restart];
}



@end
