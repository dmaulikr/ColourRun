//
//  CRLevelSelectViewController.m
//  ColourRun
//
//  Created by Ian on 24/05/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "CRLevelSelectViewController.h"
#import "CRGameViewController.h"
#import "CRLevelSelectCell.h"

@interface CRLevelSelectViewController ()

@end

@implementation CRLevelSelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES
                                            withAnimation:UIStatusBarAnimationFade];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
        //    NSMutableArray *sectionArray = [self.dataArray objectAtIndex:section];
        //return [sectionArray count];
    return 13;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"LevelCell";
    
    CRLevelSelectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [cell setLevel:indexPath.row+1];
    
    /*
    
    NSMutableArray *data = [self.dataArray objectAtIndex:indexPath.section];
    
    NSString *cellData = [data objectAtIndex:indexPath.row];
    
    
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:100];
    
    [titleLabel setText:cellData];
     
     */
    
    return cell;
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
        // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"START_GAME"])
    {
        NSIndexPath *indexPath = [_collectionView indexPathForCell:sender];
        
            // Get reference to the destination view controller
        CRGameViewController *vc = [segue destinationViewController];
        
        [vc setLevel:indexPath.row+1];
        
            // Pass any objects to the view controller here, like...
            //        [vc setLevel:1];
    }
}


@end
