//
//  MainMenuViewController.h
//  RoboHelper
//
//  Created by Maurya on 2/19/13.
//  Copyright (c) 2013 CompleteIP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@class AppDelegate;

@interface MainMenuViewController : UIViewController <MFMailComposeViewControllerDelegate>
{
    AppDelegate *app;
    
    NSArray *contactList;
    
    UIImage *gearOn;
    UIImage *gearOff;
    
    bool gearsMoving;
    CABasicAnimation *forward;
    CABasicAnimation *backward;
}

- (IBAction)turnOffGears:(id)sender;
- (IBAction)actionEmailComposer; 
- (IBAction)startScorer:(id)sender;

@property (nonatomic, retain) IBOutlet UIButton *gearSwitch;

@property (nonatomic, retain) IBOutlet UIImageView *scoregear;
@property (nonatomic, retain) IBOutlet UIImageView *helpgear;
@property (nonatomic, retain) IBOutlet UIImageView *contactgear;
@property (nonatomic, retain) IBOutlet UIImageView *Vgear;
@property (nonatomic, retain) IBOutlet UIImageView *QXgear;

@end
