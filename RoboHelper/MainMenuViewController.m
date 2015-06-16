//
//  MainMenuViewController.m
//  RoboHelper
//
//  Created by Maurya on 2/19/13.
//  Copyright (c) 2013 CompleteIP. All rights reserved.
//

#import "MainMenuViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

@synthesize scoregear;
@synthesize helpgear;
@synthesize contactgear;
@synthesize Vgear;
@synthesize QXgear;

@synthesize gearSwitch;


- (IBAction)startScorer:(id)sender {
    
    app.blueScore1 = 0;
    app.blueScore2 = 0;
    app.redScore1 = 0;
    app.redScore2 = 0;
    app.blueringCounter1 = 0;
    app.redringCounter1 = 0;
    app.redringCounter2 = 0;
    app.blueringCounter2 = 0; 
    
}

- (IBAction)actionEmailComposer {
    
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        [mailViewController setEditing:YES];
        [mailViewController setSubject:@"Suggestions"];
        [mailViewController setToRecipients:contactList];
        [self presentViewController:mailViewController animated:YES completion:NULL];
               
    }
    
    else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No Network Connection or No Email Set Up" delegate:nil cancelButtonTitle:@"OK" 
            otherButtonTitles: nil];
        [alert show];
        
    }
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)turnOffGears:(id)sender {
    
    
    if (gearsMoving) {
        
        [gearSwitch setImage:gearOff forState:UIControlStateNormal];
    
        
        [scoregear.layer    removeAnimationForKey:@"Spin"];
        [helpgear.layer     removeAnimationForKey:@"Spin"];
        [contactgear.layer  removeAnimationForKey:@"Spin"];
        [Vgear.layer        removeAnimationForKey:@"Spin"];
        [QXgear.layer       removeAnimationForKey:@"Spin"];
        
        gearsMoving = false;
        
  
    }
    
    else if (!gearsMoving) {
        
        [gearSwitch setImage:gearOn forState:UIControlStateNormal];
       
        [scoregear.layer    addAnimation:forward  forKey:@"Spin"];
        [helpgear.layer     addAnimation:backward forKey:@"Spin"];
        [contactgear.layer  addAnimation:forward  forKey:@"Spin"];
        [Vgear.layer        addAnimation:backward forKey:@"Spin"];
        [QXgear.layer       addAnimation:backward forKey:@"Spin"];  
        
        gearsMoving = true;
        
    } 
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    contactList = [NSArray arrayWithObjects:@"quadxrobotics@gmail.com", nil];
    
    gearsMoving = true;
     
    // Create Animations for rotations
    
    gearOn = [UIImage imageNamed:@"ipad_optionGear.png"];
    gearOff = [UIImage imageNamed:@"ipad_optionGearNo.png"];
    	
    forward = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    forward.fromValue = [NSNumber numberWithFloat:0];
    forward.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    forward.duration = 5.0; // Speed
    forward.repeatCount = HUGE_VALF; // Repeat forever
    
	
    backward = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    backward.fromValue = [NSNumber numberWithFloat:0];
    backward.toValue = [NSNumber numberWithFloat:(-2*M_PI)];
    backward.duration = 5.0; // Speed
    backward.repeatCount = HUGE_VALF; // Repeat forever
    
    // Set rotations
    
    [scoregear.layer    addAnimation:forward  forKey:@"Spin"];
    [helpgear.layer     addAnimation:backward forKey:@"Spin"];
    [contactgear.layer  addAnimation:forward  forKey:@"Spin"];
    [Vgear.layer        addAnimation:backward forKey:@"Spin"];
    [QXgear.layer       addAnimation:backward forKey:@"Spin"];
    
    
    
}

- (void)viewDidUnload 
{
    [super viewDidUnload];
    [scoregear.layer removeAllAnimations];
    [helpgear.layer removeAllAnimations];
    [contactgear.layer removeAllAnimations];
    [Vgear.layer removeAllAnimations];
    [QXgear.layer removeAllAnimations];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
