//
//  SecondViewController.h
//  RoboHelper
//
//  Created by Maurya on 12/11/12.
//  Copyright (c) 2012 CompleteIP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "AppDelegate.h"

@class AppDelegate;

@interface SecondViewController : UIViewController {
    
    AppDelegate *app;
    
    int scoreOfRed;
    int scoreOfBlue;
    
    // variables for only this side of rack
@private
    
    int peg1value;
    int peg2value;
    int peg3value;
    int peg4value;
    int peg5value;
    int peg6value;
    int peg7value;
    int peg8value;
    int peg9value;
    
    bool topBonusR;
    bool midBonusR;
    bool lowBonusR;
    bool col1BonusR;
    bool col2BonusR;
    bool col3BonusR;
    bool left2rightDiagBonusR;
    bool right2leftDiagBonusR;
    
    bool topBonusB;
    bool midBonusB;
    bool lowBonusB;
    bool col1BonusB;
    bool col2BonusB;
    bool col3BonusB;
    bool left2rightDiagBonusB;
    bool right2leftDiagBonusB;
}

// Checking

- (bool) checkForCollsion: (UIImageView *)imageView: (UIImageView *)imageView2;
- (void) checkForRingPlacement;

// Changing Images when ring is placed

/*
- (void) placeRingPeg1;
- (void) placeRingPeg2;
- (void) placeRingPeg3;
- (void) placeRingPeg4;
- (void) placeRingPeg5;
- (void) placeRingPeg6;
- (void) placeRingPeg7;
- (void) placeRingPeg8;
- (void) placeRingPeg9;
*/

- (int) placeRingOnPeg:(UIImageView *)peg:(int)pegValue:(UIImageView *)pegPlacementArea:(int)points;
- (void) placeRingOnMat;

// Scoring methods

- (void) updateScoreLabels;
- (void) addRedScore:(int)value;
- (void) addBlueScore:(int)value;

// Line Bonuses
- (void) checkForRedLineBonuses;
- (void) checkForBlueLineBonuses;

// Ownership
- (bool) checkRedOwnership: (int)peg;
- (bool) checkBlueOwnership: (int)peg;

// Clearing
- (IBAction)clearRack:(id)sender;


@property (nonatomic, retain) IBOutlet UIImageView *redring;
@property (nonatomic, retain) IBOutlet UIImageView *bluering;

@property (nonatomic, retain) IBOutlet UIImageView *peg1;
@property (nonatomic, retain) IBOutlet UIImageView *peg2;
@property (nonatomic, retain) IBOutlet UIImageView *peg3;
@property (nonatomic, retain) IBOutlet UIImageView *peg4;
@property (nonatomic, retain) IBOutlet UIImageView *peg5;
@property (nonatomic, retain) IBOutlet UIImageView *peg6;
@property (nonatomic, retain) IBOutlet UIImageView *peg7;
@property (nonatomic, retain) IBOutlet UIImageView *peg8;
@property (nonatomic, retain) IBOutlet UIImageView *peg9;

@property (nonatomic, retain) IBOutlet UIImageView *pArea1;
@property (nonatomic, retain) IBOutlet UIImageView *pArea2;
@property (nonatomic, retain) IBOutlet UIImageView *pArea3;
@property (nonatomic, retain) IBOutlet UIImageView *pArea4;
@property (nonatomic, retain) IBOutlet UIImageView *pArea5;
@property (nonatomic, retain) IBOutlet UIImageView *pArea6;
@property (nonatomic, retain) IBOutlet UIImageView *pArea7;
@property (nonatomic, retain) IBOutlet UIImageView *pArea8;
@property (nonatomic, retain) IBOutlet UIImageView *pArea9;

@property (nonatomic, retain) IBOutlet UILabel *Rscore;
@property (nonatomic, retain) IBOutlet UILabel *Bscore;
@property (nonatomic, retain) IBOutlet UILabel *RedOnMat;
@property (nonatomic, retain) IBOutlet UILabel *BlueOnMat;

@property (nonatomic, retain) IBOutlet UILabel *redringsleft;
@property (nonatomic, retain) IBOutlet UILabel *blueringsleft;

@property (nonatomic, retain) IBOutlet UIImageView *mat;
@property (nonatomic, retain) IBOutlet UIImageView *plus1;


@end
