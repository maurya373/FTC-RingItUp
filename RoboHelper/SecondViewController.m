//
//  SecondViewController.m
//  RoboHelper
//
//  Created by Maurya on 12/11/12.
//  Copyright (c) 2012 CompleteIP. All rights reserved.
//
#import "SecondViewController.h"
#import "FirstViewController.h"

@interface SecondViewController ()

@end

static int redScore;
static int blueScore;

@implementation SecondViewController

@synthesize redring;
@synthesize bluering;

@synthesize mat;

@synthesize peg1;
@synthesize peg2;
@synthesize peg3;
@synthesize peg4;
@synthesize peg5;
@synthesize peg6;
@synthesize peg7;
@synthesize peg8;
@synthesize peg9;

@synthesize pArea1;
@synthesize pArea2;
@synthesize pArea3;
@synthesize pArea4;
@synthesize pArea5;
@synthesize pArea6;
@synthesize pArea7;
@synthesize pArea8;
@synthesize pArea9;

@synthesize Rscore, BlueOnMat, Bscore, RedOnMat, plus1, redringsleft, blueringsleft;

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [[event allTouches] anyObject];
	if ([touch view] == redring) {
        
        if (app.redringCounter1 + app.redringCounter2 > 24) {
            
            /*
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No More Rings!" message:@"There are no more rings of this color!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];*/
        } 
        else {
            
            CGPoint location = [touch locationInView:self.view];
            redring.center = location;
        }
	}
    if ([touch view] == bluering) {
        
		if (app.blueringCounter1 + app.blueringCounter2 > 24) {
            
            /*
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No More Rings!" message:@"There are no more rings of this color!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];*/
        } 
        else {
            
            CGPoint location = [touch locationInView:self.view];
            bluering.center = location;
        }

	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [touches anyObject];
    
    [self updateScoreLabels];
    
    // Check for placement
    [self checkForRingPlacement];
    
    // Place Ring back in its original position
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    
        // If iPhone...
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
            if (screenBounds.size.height == 568) { // 4 inch screen
            
                if ([touch view] == redring) {
                    CGRect frame = [redring frame];
                    frame.origin.x = 90;
                    frame.origin.y = 450;
                    [redring setFrame:frame];
                }
                if ([touch view] == bluering) {
                    CGRect frame = [bluering frame];
                    frame.origin.x = 170;
                    frame.origin.y = 450;
                    [bluering setFrame:frame];
                }
                
            }
            else { // 3.5-inch screen
            
                if ([touch view] == redring) {
                    CGRect frame = [redring frame];
                    frame.origin.x = 100;
                    frame.origin.y = 380;
                    [redring setFrame:frame];
                }
                if ([touch view] == bluering) {
                    CGRect frame1 = [bluering frame];
                    frame1.origin.x = 170;
                    frame1.origin.y = 380;
                    [bluering setFrame:frame1];
                }
            }  
        }
    
        // If iPad
        else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
            if ([touch view] == redring) {
                CGRect frame = [redring frame];
                frame.origin.x = 268;
                frame.origin.y = 854;
                [redring setFrame:frame];
            }
            if ([touch view] == bluering)
            {
                CGRect frame = [bluering frame];
                frame.origin.x = 393; 
                frame.origin.y = 854;
                [bluering setFrame:frame];
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
    
    peg1value = [self placeRingOnPeg:peg1 :peg1value :pArea1 :15];
    peg2value = [self placeRingOnPeg:peg2 :peg2value :pArea2 :15];
    peg3value = [self placeRingOnPeg:peg3 :peg3value :pArea3 :15];
    peg4value = [self placeRingOnPeg:peg4 :peg4value :pArea4 :10];
    peg5value = [self placeRingOnPeg:peg5 :peg5value :pArea5 :10];
    peg6value = [self placeRingOnPeg:peg6 :peg6value :pArea6 :10];
    peg7value = [self placeRingOnPeg:peg7 :peg7value :pArea7 :5];
    peg8value = [self placeRingOnPeg:peg8 :peg8value :pArea8 :5];
    peg9value = [self placeRingOnPeg:peg9 :peg9value :pArea9 :5];
    
    [self checkForRedLineBonuses];
    [self checkForBlueLineBonuses];
    
    [self placeRingOnMat];
}


- (void) showplus1 {
    
    plus1.hidden = YES;
    
}

- (void) placeRingOnMat {
    
    bool placedR = [self checkForCollsion:redring: mat];
    bool placedB = [self checkForCollsion:bluering: mat];
    
    
    if(placedR && (app.redringCounter1 + app.redringCounter2 < 24)) {
        app.redringCounter2++;
        
        app.numOfRedOnMat2++;
        [self decrementRings];
        [self addRedScore:1];
        
        [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(showplus1) userInfo:nil repeats:NO];
        
        plus1.hidden = NO;
        
    }
    if(placedB && (app.blueringCounter1 + app.blueringCounter2 < 24)) {
        app.blueringCounter2++;
        
        app.numOfBlueOnMat2++;
        
        [self decrementRings];
        [self addBlueScore:1];
        
        [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(showplus1) userInfo:nil repeats:NO];
        
        plus1.hidden = NO;
    }
}

- (int) placeRingOnPeg:(UIImageView *)peg:(int)pegValue:(UIImageView *)pegPlacementArea:(int)points {
    
    UIImage *rf    = [UIImage imageNamed: @"r.png"];
    UIImage *rrf   = [UIImage imageNamed: @"rr.png"];
    UIImage *rrrf  = [UIImage imageNamed: @"rrr.png"];
    UIImage *bf    = [UIImage imageNamed: @"b.png"];
    UIImage *bbf   = [UIImage imageNamed: @"bb.png"];
    UIImage *bbbf  = [UIImage imageNamed: @"bbb.png"];
    UIImage *rbf   = [UIImage imageNamed: @"rb.png"];
    UIImage *brf   = [UIImage imageNamed: @"br.png"];
    UIImage *rbrf  = [UIImage imageNamed: @"rbr.png"];
    UIImage *rrbf  = [UIImage imageNamed: @"rrb.png"];
    UIImage *brbf  = [UIImage imageNamed: @"brb.png"];
    UIImage *brrf  = [UIImage imageNamed: @"brr.png"];
    UIImage *bbrf  = [UIImage imageNamed: @"bbr.png"];
    UIImage *rbbf  = [UIImage imageNamed: @"rbb.png"];
    UIImage *rrrrf  = [UIImage imageNamed: @"rrrr.png"];
    UIImage *rrrbf  = [UIImage imageNamed: @"rrrb.png"];
    UIImage *rrbrf  = [UIImage imageNamed: @"rrbr.png"];
    UIImage *rrbbf  = [UIImage imageNamed: @"rrbb.png"];
    UIImage *rbrrf  = [UIImage imageNamed: @"rbrr.png"];
    UIImage *rbrbf  = [UIImage imageNamed: @"rbrb.png"];
    UIImage *rbbrf  = [UIImage imageNamed: @"rbbr.png"];
    UIImage *rbbbf  = [UIImage imageNamed: @"rbbb.png"];
    UIImage *bbbbf  = [UIImage imageNamed: @"bbbb.png"];
    UIImage *bbbrf  = [UIImage imageNamed: @"bbbr.png"];
    UIImage *bbrbf  = [UIImage imageNamed: @"bbrb.png"];
    UIImage *bbrrf  = [UIImage imageNamed: @"bbrr.png"];
    UIImage *brbbf  = [UIImage imageNamed: @"brbb.png"];
    UIImage *brbrf  = [UIImage imageNamed: @"brbr.png"];
    UIImage *brrbf  = [UIImage imageNamed: @"brrb.png"];
    UIImage *brrrf  = [UIImage imageNamed: @"brrr.png"];
    
    bool placedR = [self checkForCollsion:redring :pegPlacementArea];
    if (placedR && (app.redringCounter1 + app.redringCounter2 < 24)) {
        
        app.redringCounter1++;
        [self decrementRings];
        
        
        if (pegValue == 0) {
            [peg setImage:rf];
            pegValue = 1;
            [self addRedScore:points];
        }
        else if (pegValue == 1) {
            [peg setImage:rrf];
            pegValue = 2;
            [self addRedScore:points];
        }
        else if (pegValue == 2) {
            [peg setImage:rrrf];
            pegValue = 3;
            [self addRedScore:points];
        }
        else if (pegValue == 3) {
            [peg setImage:rrrrf];
            pegValue = 4;
            [self addRedScore:points];
        }
        else if (pegValue == 9) {
            [peg setImage:rbrf];
            pegValue = 10;
            [self addRedScore:points];
        }
        else if (pegValue == 10) {
            [peg setImage:rbrrf];
            pegValue = 11;
            [self addRedScore:points];
        }
        else if (pegValue == 13) {
            [peg setImage:rbbrf];
            pegValue = 14;
            [self addRedScore:points];
        }
        else if (pegValue == 6) {
            [peg setImage:rrbrf];
            pegValue = 7;
            [self addRedScore:points];
        }
        else if (pegValue == 16) {
            [peg setImage:brf];
            pegValue = 24;
            [self addRedScore:points];
        }
        else if (pegValue == 17) {
            [peg setImage:bbrf];
            pegValue = 21;
            [self addRedScore:points];    
        }
        else if (pegValue == 18) {
            [peg setImage:bbbrf];
            pegValue = 20;
            [self addRedScore:points];
        }
        else if (pegValue == 21) {
            [peg setImage:bbrrf];
            pegValue = 23;
            [self addRedScore:points];
        }
        else if (pegValue == 24) {
            [peg setImage:brrf];
            pegValue = 28;
            [self addRedScore:points];
        }
        else if (pegValue == 28) {
            [peg setImage:brrrf];
            pegValue = 30;
            [self addRedScore:points];
        }
        else if (pegValue == 25) {
            [peg setImage:brbrf];
            pegValue = 27;
            [self addRedScore:points];
        }
    }
    
    bool placedB = [self checkForCollsion:bluering :pegPlacementArea];
    if (placedB && (app.blueringCounter1 + app.blueringCounter2 < 24)) {
        
        app.blueringCounter1++;
        [self decrementRings];
        
        if (pegValue == 0) {
            [peg setImage:bf];
            pegValue = 16;
            [self addBlueScore:points];
        }
        
        else if (pegValue == 1) {
            [peg setImage:rbf];
            pegValue = 9;
            [self addBlueScore:points];
        }
        else if (pegValue == 2) {
            [peg setImage:rrbf];
            pegValue = 6;
            [self addBlueScore:points];
        }
        else if (pegValue == 3) {
            [peg setImage:rrrbf];
            pegValue = 5;
            [self addBlueScore:points];
        }
        else if (pegValue == 6) {
            [peg setImage:rrbbf];
            pegValue = 8;
            [self addBlueScore:points];
        }
        else if (pegValue == 9) {
            [peg setImage:rbbf];
            pegValue = 13;
            [self addBlueScore:points];
        }
        else if (pegValue == 13) {
            [peg setImage:rbbbf];
            pegValue = 15;
            [self addBlueScore:points];
        }
        else if (pegValue == 10) {
            [peg setImage:rbrbf];
            pegValue = 12;
            [self addBlueScore:points];
        }
        else if (pegValue == 16) {
            [peg setImage:bbf];
            pegValue = 17;
            [self addRedScore:points];
        }
        else if (pegValue == 17) {
            [peg setImage:bbbf];
            pegValue = 18;
            [self addRedScore:points];
        }
        else if (pegValue == 18) {
            [peg setImage:bbbbf];
            pegValue = 19;
            [self addRedScore:points];
        }
        else if (pegValue == 24) {
            [peg setImage:brbf];
            pegValue = 25;
            [self addRedScore:points];
        }
        else if (pegValue == 21) {
            [peg setImage:bbrbf];
            pegValue = 22;
            [self addRedScore:points];
        }
        else if (pegValue == 25) {
            [peg setImage:brbbf];
            pegValue = 26;
            [self addRedScore:points];
        }
        else if (pegValue == 28) {
            [peg setImage:brrbf];
            pegValue = 29;
            [self addRedScore:points];
        }
        
    }
    [self checkForRedLineBonuses];
    [self checkForBlueLineBonuses];
    return pegValue;
    
}


- (void) checkForRedLineBonuses {
    
    bool p1 = [self checkRedOwnership:peg1value];
    bool p2 = [self checkRedOwnership:peg2value];
    bool p3 = [self checkRedOwnership:peg3value];
    bool p4 = [self checkRedOwnership:peg4value];
    bool p5 = [self checkRedOwnership:peg5value];
    bool p6 = [self checkRedOwnership:peg6value];
    bool p7 = [self checkRedOwnership:peg7value];
    bool p8 = [self checkRedOwnership:peg8value];
    bool p9 = [self checkRedOwnership:peg9value];
    
    // top row
    if (p7 && p8 && p9) {
        if (lowBonusR == false) {
            [self addRedScore:30];
            [self updateScoreLabels];
            lowBonusR = true;
        }
    }
    
    // mid row
    if (p4 && p5 && p6) {
        if (midBonusR == false) {
            [self addRedScore:30];
            [self updateScoreLabels];
            midBonusR = true;
        }
    }
    
    // bottom row
    if (p1 && p2 && p3) {
        if (topBonusR == false) {
            [self addRedScore:30];
            [self updateScoreLabels];
            topBonusR = true;
        }
    }
    
    // 1st column
    if (p1 && p4 && p7) {
        if (col1BonusR == false) {
            [self addRedScore:30];
            [self updateScoreLabels];
            col1BonusR = true;
        }
    }
    
    // 2nd column
    if (p2 && p5 && p8) {
        if (col2BonusR == false) {
            [self addRedScore:30];
            [self updateScoreLabels];
            col2BonusR = true;
        }
    }
    
    // 3rd column
    if (p3 && p6 && p9) {
        if (col3BonusR == false) {
            [self addRedScore:30];
            [self updateScoreLabels];
            col3BonusR = true;
        }
    }
    
    // l2r diag
    if (p1 && p5 && p9) {
        if (left2rightDiagBonusR == false) {
            [self addRedScore:30];
            [self updateScoreLabels];
            left2rightDiagBonusR = true;
        }
    }
    
    // r2l diag
    if (p3 && p5 && p7) {
        if (right2leftDiagBonusR == false) {
            [self addRedScore:30];
            [self updateScoreLabels];
            right2leftDiagBonusR = true;
        }
    }
    
    // losing top bonus
    if (topBonusR == true) {
        
        if ([self LineBonusLostRed:peg1value] || [self LineBonusLostRed:peg2value] || [self LineBonusLostRed:peg3value]) {
            
            [self subtractRedScore:30];
            [self updateScoreLabels];
            topBonusR = false;
        }
    }
    
    // losing mid bonus
    if (midBonusR == true) {
        
        if ([self LineBonusLostRed:peg4value] || [self LineBonusLostRed:peg5value] || [self LineBonusLostRed:peg6value]) {
            
            [self subtractRedScore:30];
            [self updateScoreLabels];
            midBonusR = false;
        }
    }
    
    // losing bottom bonus
    if (lowBonusR == true) {
        
        if ([self LineBonusLostRed:peg7value] || [self LineBonusLostRed:peg8value] || [self LineBonusLostRed:peg9value]) {
            
            [self subtractRedScore:30];
            [self updateScoreLabels];
            lowBonusR = false;
        }
    }
    
    // losing column 1 bonus
    if (col1BonusR == true) {
        
        if ([self LineBonusLostRed:peg1value] || [self LineBonusLostRed:peg4value] || [self LineBonusLostRed:peg7value]) {
            
            [self subtractRedScore:30];
            [self updateScoreLabels];
            col1BonusR = false;
        }
    }
    
    // losing column 2 bonus
    if (col2BonusR == true) {
        
        if ([self LineBonusLostRed:peg2value] || [self LineBonusLostRed:peg5value] || [self LineBonusLostRed:peg8value]) {
            
            [self subtractRedScore:30];
            [self updateScoreLabels];
            col2BonusR = false;
        }
    }
    
    // losing column 3 bonus
    if (col3BonusR == true) {
        
        if ([self LineBonusLostRed:peg3value] || [self LineBonusLostRed:peg6value] || [self LineBonusLostRed:peg9value]) {
            
            [self subtractRedScore:30];
            [self updateScoreLabels];
            col3BonusR = false;
        }
    }
    
    // losing diagnol bonus
    if (left2rightDiagBonusR == true) {
        
        if ([self LineBonusLostRed:peg1value] || [self LineBonusLostRed:peg5value] || [self LineBonusLostRed:peg9value]) {
            
            [self subtractRedScore:30];
            [self updateScoreLabels];
            left2rightDiagBonusR = false;
        }
    }
    
    // losing diagnol bonus
    if (right2leftDiagBonusR == true) {
        
        if ([self LineBonusLostRed:peg3value] || [self LineBonusLostRed:peg5value] || [self LineBonusLostRed:peg7value]) {
            
            [self subtractRedScore:30];
            [self updateScoreLabels];
            right2leftDiagBonusR = false;
        }
    }
}

- (void) checkForBlueLineBonuses {
    
    bool p1 = [self checkBlueOwnership:peg1value];
    bool p2 = [self checkBlueOwnership:peg2value];
    bool p3 = [self checkBlueOwnership:peg3value];
    bool p4 = [self checkBlueOwnership:peg4value];
    bool p5 = [self checkBlueOwnership:peg5value];
    bool p6 = [self checkBlueOwnership:peg6value];
    bool p7 = [self checkBlueOwnership:peg7value];
    bool p8 = [self checkBlueOwnership:peg8value];
    bool p9 = [self checkBlueOwnership:peg9value];
    
    // top row
    if (p7 && p8 && p9) {
        if (lowBonusB == false) {
            [self addBlueScore:30];
            [self updateScoreLabels];
            lowBonusB = true;
        }
    }
    
    // mid row
    if (p4 && p5 && p6) {
        if (midBonusB == false) {
            [self addBlueScore:30];
            [self updateScoreLabels];
            midBonusB = true;
        }
    }
    
    // bottom row
    if (p1 && p2 && p3) {
        if (topBonusB == false) {
            [self addBlueScore:30];
            [self updateScoreLabels];
            topBonusB = true;
        }
    }
    
    // 1st column
    if (p1 && p4 && p7) {
        if (col1BonusB == false) {
            [self addBlueScore:30];
            [self updateScoreLabels];
            col1BonusB = true;
        }
    }
    
    // 2nd column
    if (p2 && p5 && p8) {
        if (col2BonusB == false) {
            [self addBlueScore:30];
            [self updateScoreLabels];
            col2BonusB = true;
        }
    }
    
    // 3rd column
    if (p3 && p6 && p9) {
        if (col3BonusB == false) {
            [self addBlueScore:30];
            [self updateScoreLabels];
            col3BonusB = true;
        }
    }
    
    // l2r diag
    if (p1 && p5 && p9) {
        if (left2rightDiagBonusB == false) {
            [self addBlueScore:30];
            [self updateScoreLabels];
            left2rightDiagBonusB = true;
        }
    }
    
    // r2l diag
    if (p3 && p5 && p7) {
        if (right2leftDiagBonusB == false) {
            [self addBlueScore:30];
            [self updateScoreLabels];
            right2leftDiagBonusB = true;
        }
    }
    
    // losing top bonus
    if (topBonusB == true) {
        
        if ([self LineBonusLostBlue:peg1value] || [self LineBonusLostBlue:peg2value] || [self LineBonusLostBlue:peg3value]) {
            
            [self subtractBlueScore:30];;
            [self updateScoreLabels];
            topBonusB = false;
        }
    }
    
    // losing mid bonus
    if (midBonusB == true) {
        
        if ([self LineBonusLostBlue:peg4value] || [self LineBonusLostBlue:peg5value] || [self LineBonusLostBlue:peg6value]) {
            
            [self subtractBlueScore:30];
            [self updateScoreLabels];
            midBonusB = false;
        }
    }
    
    // losing bottom bonus
    if (lowBonusB == true) {
        
        if ([self LineBonusLostBlue:peg7value] || [self LineBonusLostBlue:peg8value] || [self LineBonusLostBlue:peg9value]) {
            
            [self subtractBlueScore:30];
            [self updateScoreLabels];
            lowBonusB = false;
        }
    }
    
    // losing column 1 bonus
    if (col1BonusB == true) {
        
        if ([self LineBonusLostBlue:peg1value] || [self LineBonusLostBlue:peg4value] || [self LineBonusLostBlue:peg7value]) {
            
            [self subtractBlueScore:30];
            [self updateScoreLabels];
            col1BonusB = false;
        }
    }
    
    // losing column 2 bonus
    if (col2BonusB == true) {
        
        if ([self LineBonusLostBlue:peg2value] || [self LineBonusLostBlue:peg5value] || [self LineBonusLostBlue:peg8value]) {
            
            [self subtractBlueScore:30];
            [self updateScoreLabels];
            col2BonusB = false;
        }
    }
    
    // losing column 3 bonus
    if (col3BonusB == true) {
        
        if ([self LineBonusLostBlue:peg3value] || [self LineBonusLostBlue:peg6value] || [self LineBonusLostBlue:peg9value]) {
            
            [self subtractBlueScore:30];
            [self updateScoreLabels];
            col3BonusB = false;
        }
    }
    
    // losing diagnol bonus
    if (left2rightDiagBonusB == true) {
        
        if ([self LineBonusLostBlue:peg1value] || [self LineBonusLostBlue:peg5value] || [self LineBonusLostBlue:peg9value]) {
            
            [self subtractBlueScore:30];
            [self updateScoreLabels];
            left2rightDiagBonusB = false;
        }
    }
    
    // losing diagnol bonus
    if (right2leftDiagBonusB == true) {
        
        if ([self LineBonusLostBlue:peg3value] || [self LineBonusLostBlue:peg5value] || [self LineBonusLostBlue:peg7value]) {
            
            [self subtractBlueScore:30];
            [self updateScoreLabels];
            right2leftDiagBonusB = false;
        }
    }
}


- (bool) checkRedOwnership:(int)peg {
    
    // 1 2 3 4 5 6 7 8 9 10 11 12 14 28 30
    
    if (peg == 1 || peg == 2 || peg == 3 || peg == 4 || peg == 5 || peg == 6 || peg == 7 || peg == 8 || peg == 9 || peg == 10 || peg == 11 || peg == 12 || peg == 14 || peg == 23|| peg == 24 || peg == 27 || peg == 29 || peg == 28 || peg == 30) {
        
        return true;
    }
    return false;
}

- (bool) checkBlueOwnership:(int)peg {
    
    // 13 15 16 17 18 19 20 21 22 23 24 25 26 27 29
    
    if (peg == 8 || peg == 9 || peg == 12 || peg == 13 || peg == 14 || peg == 15 || peg == 16 || peg == 17 || peg == 18 || peg == 19 || peg == 20 || peg == 21 || peg == 22 || peg == 23 || peg == 24 || peg == 25 || peg == 26 || peg == 27 || peg == 29) {
        
        return true;
    }
    return false;
}

- (bool) LineBonusLostRed: (int)peg {
    
    if (peg == 13 || peg == 25) {
        return true;
    }
    return false;
}

- (bool) LineBonusLostBlue: (int)peg {
    
    if (peg == 10 || peg == 28) {
        return true;
    }
    return false;
}


- (void) addRedScore:(int)value {
    
    redScore += value;
    
    app.redScore2 = redScore;
    
    [self updateScoreLabels];
    
}

- (void) addBlueScore:(int)value {
    
    blueScore += value;
    
    app.blueScore2 = blueScore;
    
    [self updateScoreLabels];
}

- (void) subtractRedScore:(int)value {
    
    redScore -= value;
    
    app.redScore2 = redScore;
    
    [self updateScoreLabels];
    
}

- (void) subtractBlueScore:(int)value {
    
    blueScore -= value;
    
    app.blueScore2 = blueScore;
    
    [self updateScoreLabels];
    
}

- (void) updateScoreLabels {
    
    NSString* redscoreLabel;
    redscoreLabel = [NSString stringWithFormat:@"%d", app.redScore1 + app.redScore2];
    [Rscore setText:redscoreLabel];
    
    NSString* bluescoreLabel;
    bluescoreLabel = [NSString stringWithFormat:@"%d", app.blueScore1 + app.blueScore2];
    [Bscore setText:bluescoreLabel];
    
    NSString* redLabel;
    redLabel = [NSString stringWithFormat:@"%d", app.numOfRedOnMat2 + app.numOfRedOnMat1];
    [RedOnMat setText:redLabel];
    
    NSString* blueLabel;
    blueLabel = [NSString stringWithFormat:@"%d", app.numOfBlueOnMat1 + app.numOfBlueOnMat2];
    [BlueOnMat setText:blueLabel];
    
}

- (void) decrementRings {
    
    NSString* label;
    label = [NSString stringWithFormat:@"%d", 24 - (app.redringCounter1 + app.redringCounter2)];
    [redringsleft setText:label];
    
    NSString* label2;
    label2 = [NSString stringWithFormat:@"%d", 24 - (app.blueringCounter1 + app.blueringCounter2) ];
    [blueringsleft setText:label2];
    
}

- (IBAction)clearRack:(id)sender {
    
    // reset score values
    redScore = 0;
    blueScore = 0;
    
    app.redScore2 = 0;
    app.blueScore2 = 0;
    
    // ring counter
    
    app.redringCounter2 = 0;
    app.blueringCounter2 = 0;
    
    app.numOfBlueOnMat2 = 0;
    app.numOfRedOnMat2 = 0;
    
    // reset labels on view
    NSString* redscoreLabel;
    redscoreLabel = [NSString stringWithFormat:@"%d", app.redScore1 + app.redScore2];
    [Rscore setText:redscoreLabel];
    
    NSString* bluescoreLabel;
    bluescoreLabel = [NSString stringWithFormat:@"%d", app.blueScore1 + app.blueScore2];
    [Bscore setText:bluescoreLabel];
    
    NSString* blueLabel;
    blueLabel = [NSString stringWithFormat:@"%d", app.numOfBlueOnMat1 + app.numOfBlueOnMat2];
    [BlueOnMat setText:blueLabel];
    
    NSString* redLabel;
    redLabel = [NSString stringWithFormat:@"%d", app.numOfRedOnMat1 + app.numOfRedOnMat2];
    [RedOnMat setText:redLabel];
    
    NSString* b;
    b = [NSString stringWithFormat:@"%d", 24];
    [blueringsleft setText:b];
    
    NSString* r;
    r = [NSString stringWithFormat:@"%d", 24];
    [redringsleft setText:r];
    
    // set line bonus booleans false
    topBonusR = false;
    midBonusR = false;
    lowBonusR = false;
    col1BonusR = false;
    col2BonusR = false;
    col3BonusR = false;
    left2rightDiagBonusR = false;
    right2leftDiagBonusR = false;
    
    topBonusB = false;
    midBonusB = false;
    lowBonusB = false;
    col1BonusB = false;
    col2BonusB = false;
    col3BonusB = false;
    left2rightDiagBonusB = false;
    right2leftDiagBonusB = false;
    
    // set peg values to 0
    peg1value = 0;
    peg2value = 0;
    peg3value = 0;
    peg4value = 0;
    peg5value = 0;
    peg6value = 0;
    peg7value = 0;
    peg8value = 0;
    peg9value = 0;
    
    // reset all images to empty rack
    UIImage *image = [UIImage imageNamed: @"empty.png"];
    
    [peg1 setImage:image];
    [peg2 setImage:image];
    [peg3 setImage:image];
    [peg4 setImage:image];
    [peg5 setImage:image];
    [peg6 setImage:image];
    [peg7 setImage:image];
    [peg8 setImage:image];
    [peg9 setImage:image];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self updateScoreLabels];
    [self decrementRings];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [self updateScoreLabels];
    [self decrementRings];
}

// when view loads after clicking button on menu
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    app = (AppDelegate *)[[UIApplication sharedApplication]delegate];

    
    topBonusR = false;
    midBonusR = false;
    lowBonusR = false;
    col1BonusR = false;
    col2BonusR = false;
    col3BonusR = false;
    left2rightDiagBonusR = false;
    right2leftDiagBonusR = false;
    
    topBonusB = false;
    midBonusB = false;
    lowBonusB = false;
    col1BonusB = false;
    col2BonusB = false;
    col3BonusB = false;
    left2rightDiagBonusB = false;
    right2leftDiagBonusB = false;
    
    redScore = 0;
    blueScore = 0;
    
    peg1value = 0;
    peg2value = 0;
    peg3value = 0;
    peg4value = 0;
    peg5value = 0;
    peg6value = 0;
    peg7value = 0;
    peg8value = 0;
    peg9value = 0;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
