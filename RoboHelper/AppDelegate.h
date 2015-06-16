//
//  AppDelegate.h
//  RoboHelper
//
//  Created by Maurya on 12/11/12.
//  Copyright (c) 2012 CompleteIP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property int redScore1;
@property int blueScore1;
@property int redScore2;
@property int blueScore2;

@property int redringCounter1;
@property int blueringCounter1;
@property int redringCounter2;
@property int blueringCounter2;

@property int numOfRedOnMat1;
@property int numOfBlueOnMat1;
@property int numOfRedOnMat2;
@property int numOfBlueOnMat2;

@property int numOfWeightRed;
@property int numOfWeightBlue;

@property int totalRed;
@property int totalBlue;


@end
