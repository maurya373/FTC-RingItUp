//
//  ExtrasVC.m
//  FTC Scorer
//
//  Created by Maurya on 3/19/13.
//  Copyright (c) 2013 CompleteIP. All rights reserved.
//

#import "ExtrasVC.h"

@interface ExtrasVC ()

@end

@implementation ExtrasVC

@synthesize redBonus, redPeg, redPercent, redScore, redTotal, blueBonus, bluePeg, bluePercent, blueScore, blueTotal, redRing, blueRing, bArea, rArea, blue1, blue2, red1, red2;


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [[event allTouches] anyObject];
    
	if ([touch view] == redRing) {
        
        CGPoint location = [touch locationInView:self.view];
        redRing.center = location;
        
	}
    if ([touch view] == blueRing) {
        
        CGPoint location = [touch locationInView:self.view];
        blueRing.center = location;        
	}
    
}

// User removed finger

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [touches anyObject];
    
    // Check for placement
    
    [self checkForRingPlacement];
    
    // Place Ring back in its original position
    CGRect screenBounds = [[UIScreen mainScreen] bounds]; 
    
    // If iPhone...
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        if (screenBounds.size.height == 568) { // 4 inch screen
            
            if ([touch view] == redRing) {
                CGRect frame = [redRing frame];
                frame.origin.x = 169;
                frame.origin.y = 78;
                [redRing setFrame:frame];
            }
            if ([touch view] == blueRing) {
                CGRect frame = [blueRing frame];
                frame.origin.x = 169;
                frame.origin.y = 232;
                [blueRing setFrame:frame];
            }
            
        }
        else { // 3.5-inch screen
            
            if ([touch view] == redRing) {
                CGRect frame = [redRing frame];
                frame.origin.x = 100;
                frame.origin.y = 380;
                [redRing setFrame:frame];
            }
            if ([touch view] == blueRing) {
                CGRect frame1 = [blueRing frame];
                frame1.origin.x = 170;
                frame1.origin.y = 380;
                [blueRing setFrame:frame1];
            }
        }  
    }
    
    // If iPad
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        if ([touch view] == redRing) {
            CGRect frame = [redRing frame];
            frame.origin.x = 268;
            frame.origin.y = 854;
            [redRing setFrame:frame];
        }
        if ([touch view] == blueRing)
        {
            CGRect frame = [blueRing frame];
            frame.origin.x = 393; 
            frame.origin.y = 854;
            [blueRing setFrame:frame];
        }
        
    }
}

- (bool) checkForCollsion: (UIImageView *)imageView: (UIImageView *)imageView2 {
    
    if (CGRectIntersectsRect(imageView.frame, imageView2.frame)) {
        
        return true;
    }
    return false;
}

- (void) checkForRingPlacement {
    
    UIImage *empty = [UIImage imageNamed:@"empty.png"];
    UIImage *r1  = [UIImage imageNamed: @"r1.png"];
    UIImage *r2  = [UIImage imageNamed: @"r2.png"];
    UIImage *r3  = [UIImage imageNamed: @"r3.png"];
    UIImage *r4  = [UIImage imageNamed: @"r4.png"];
    UIImage *r5  = [UIImage imageNamed: @"r5.png"];
    UIImage *r6  = [UIImage imageNamed: @"r6.png"];
    
    UIImage *b1  = [UIImage imageNamed: @"b1.png"];
    UIImage *b2  = [UIImage imageNamed: @"b2.png"];
    UIImage *b3  = [UIImage imageNamed: @"b3.png"];
    UIImage *b4  = [UIImage imageNamed: @"b4.png"];
    UIImage *b5  = [UIImage imageNamed: @"b5.png"];
    UIImage *b6  = [UIImage imageNamed: @"b6.png"];
    
    
    bool redbool = [self checkForCollsion:redRing :rArea];
    bool bluebool = [self checkForCollsion:blueRing :bArea];
    
    if (redbool) {
        
        app.redringCounter1 ++;
        
        if(redPeg.image == empty) {
            redPeg.image = r1;
            
            NSString* l = @"20%";
            [redPercent setText:l];
            multiplierRed = 0.2;
            
            redbonus = (app.redScore1 + app.redScore2) * multiplierRed;
            app.totalRed = (app.redScore1 + app.redScore2) + redbonus;
            
            [self updateLabels];
            
        }
        else if(redPeg.image == r1) {
            redPeg.image = r2;
            NSString* l = @"40%";
            [redPercent setText:l];
            multiplierRed = 0.4;
            
            redbonus = (app.redScore1 + app.redScore2) * multiplierRed;
            app.totalRed = (app.redScore1 + app.redScore2) + redbonus;
            
            [self updateLabels];        
        }
        else if(redPeg.image == r2) {
            redPeg.image = r3;
            NSString* l = @"60%";
            [redPercent setText:l];
            multiplierRed = 0.6;
            
            redbonus = (app.redScore1 + app.redScore2) * multiplierRed;
            app.totalRed = (app.redScore1 + app.redScore2) + redbonus;
            
            [self updateLabels];
        }
        else if(redPeg.image == r3) {
            redPeg.image = r4;
            NSString* l = @"80%";
            [redPercent setText:l];
            multiplierRed = 0.8;
            
            redbonus = (app.redScore1 + app.redScore2) * multiplierRed;
            app.totalRed = (app.redScore1 + app.redScore2) + redbonus;
            
            [self updateLabels];
        }
        else if(redPeg.image == r4) {
            redPeg.image = r5;
            NSString* l = @"100%";
            [redPercent setText:l];
            multiplierRed = 1.0;
            
            redbonus = (app.redScore1 + app.redScore2) * multiplierRed;
            app.totalRed = (app.redScore1 + app.redScore2) + redbonus;
            
            [self updateLabels];
        }
        else if(redPeg.image == r5) {
            redPeg.image = r6;
            NSString* l = @"120%";
            [redPercent setText:l];
            multiplierRed = 1.2;
            
            redbonus = (app.redScore1 + app.redScore2) * multiplierRed;
            app.totalRed = (app.redScore1 + app.redScore2) + redbonus;
            
            [self updateLabels];
        }
    }
    
    if (bluebool) {
        
        app.blueringCounter1 ++;
        
        if(bluePeg.image == empty) {
            bluePeg.image = b1;
            NSString* l = @"20%";
            [bluePercent setText:l];
            multiplierBlue = 0.2;
            
            bluebonus = (app.blueScore1 + app.blueScore2) * multiplierBlue;
            app.totalBlue = (app.blueScore1 + app.blueScore2) + bluebonus;
            
            [self updateLabels];
            
        }
        else if(bluePeg.image == b1) {
            bluePeg.image = b2;
            NSString* l = @"40%";
            [bluePercent setText:l];
            multiplierBlue = 0.4;
            
            bluebonus = (app.blueScore1 + app.blueScore2) * multiplierBlue;
            app.totalBlue = (app.blueScore1 + app.blueScore2) + bluebonus;
            
            [self updateLabels];
            
        }
        else if(bluePeg.image == b2) {
            bluePeg.image = b3;
            NSString* l = @"60%";
            [bluePercent setText:l];
            multiplierBlue = 0.6;
            
            bluebonus = (app.blueScore1 + app.blueScore2) * multiplierBlue;
            app.totalBlue = (app.blueScore1 + app.blueScore2) + bluebonus;
            
            [self updateLabels];
            
        }
        else if(bluePeg.image == b3) {
            bluePeg.image = b4;
            NSString* l = @"80%";
            [bluePercent setText:l];
            multiplierBlue = 0.8;
            
            bluebonus = (app.blueScore1 + app.blueScore2) * multiplierBlue;
            app.totalBlue = (app.blueScore1 + app.blueScore2) + bluebonus;
            
            [self updateLabels];
            
        }
        else if(bluePeg.image == b4) {
            bluePeg.image = b5;
            NSString* l = @"100%";
            [bluePercent setText:l];
            multiplierBlue = 1.0;
            
            bluebonus = (app.blueScore1 + app.blueScore2) * multiplierBlue;
            app.totalBlue = (app.blueScore1 + app.blueScore2) + bluebonus;
            
            [self updateLabels];
            
        }
        else if(bluePeg.image == b5) {
            bluePeg.image = b6;
            NSString* l = @"120%";
            [bluePercent setText:l];
            multiplierBlue = 1.2;
            
            bluebonus = (app.blueScore1 + app.blueScore2) * multiplierBlue;
            app.totalBlue = (app.blueScore1 + app.blueScore2) + bluebonus;
            
            [self updateLabels];
            
        }
    }
    
}


- (void) updateLabels {
    
    NSString* s;
    s = [NSString stringWithFormat:@"%d", (int)redbonus];
    [redBonus setText:s];
    
    NSString* t;
    t = [NSString stringWithFormat:@"%d", app.totalRed];
    [redTotal setText:t];
    
    NSString* s1;
    s1 = [NSString stringWithFormat:@"%d", (int)bluebonus];
    [blueBonus setText:s1];
    
    NSString* t1;
    t1 = [NSString stringWithFormat:@"%d", app.totalBlue];
    [blueTotal setText:t1];

    
}

- (void)viewDidAppear:(BOOL)animated {
    
    redbonus = (app.redScore1 + app.redScore2) * multiplierRed;
    bluebonus = (app.blueScore1 + app.blueScore2) * multiplierBlue;
    
    app.totalRed = app.redScore1 + app.redScore2 + redbonus;
    app.totalBlue = app.blueScore1 + app.blueScore2 + bluebonus;
    
    NSString* a;
    a = [NSString stringWithFormat:@"%d", (int)redbonus];
    
    NSString* d;
    d = [NSString stringWithFormat:@"%d", (int)bluebonus];
    
    NSString* r;
    r = [NSString stringWithFormat:@"%d", app.totalRed];
    
    NSString* b;
    b = [NSString stringWithFormat:@"%d", app.totalBlue];
    
    NSString* r1;
    r1 = [NSString stringWithFormat:@"%d", app.redScore1 + app.redScore2];
    
    NSString* b1;
    b1 = [NSString stringWithFormat:@"%d", app.blueScore1 + app.blueScore2];
    
    [redScore setText:r1];
    [blueScore setText:b1];
    
    [redTotal setText:r];
    [blueTotal setText:b];
    
    [redBonus setText:a];
    [blueBonus setText:d];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    multiplierBlue = 0;
    multiplierRed = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
