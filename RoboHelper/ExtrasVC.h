//
//  ExtrasVC.h
//  FTC Scorer
//
//  Created by Maurya on 3/19/13.
//  Copyright (c) 2013 CompleteIP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class AppDelegate;

@interface ExtrasVC : UIViewController {

    AppDelegate *app;
    
    float multiplierRed;
    float multiplierBlue;
    
    float bluebonus;
    float redbonus;
    
    
    
}

@property (nonatomic, retain) IBOutlet UISwitch *red1;
@property (nonatomic, retain) IBOutlet UISwitch *red2;
@property (nonatomic, retain) IBOutlet UISwitch *blue1;
@property (nonatomic, retain) IBOutlet UISwitch *blue2;


@property (nonatomic, retain) IBOutlet UIImageView *redPeg;
@property (nonatomic, retain) IBOutlet UIImageView *bluePeg;
@property (nonatomic, retain) IBOutlet UIImageView *rArea;
@property (nonatomic, retain) IBOutlet UIImageView *bArea;
@property (nonatomic, retain) IBOutlet UIImageView *redRing;
@property (nonatomic, retain) IBOutlet UIImageView *blueRing;

@property (nonatomic, retain) IBOutlet UILabel *redScore;
@property (nonatomic, retain) IBOutlet UILabel *blueScore;

@property (nonatomic, retain) IBOutlet UILabel *redBonus;
@property (nonatomic, retain) IBOutlet UILabel *blueBonus;

@property (nonatomic, retain) IBOutlet UILabel *redTotal;
@property (nonatomic, retain) IBOutlet UILabel *blueTotal;

@property (nonatomic, retain) IBOutlet UILabel *redPercent;
@property (nonatomic, retain) IBOutlet UILabel *bluePercent;



@end
