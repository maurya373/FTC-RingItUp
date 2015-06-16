//
//  QandAVC.m
//  RoboHelper
//
//  Created by Maurya on 2/25/13.
//  Copyright (c) 2013 CompleteIP. All rights reserved.
//

#import "QandAVC.h"

@interface QandAVC ()

@end

@implementation QandAVC

@synthesize wv;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString *url=@"http://www.usfirst.org/sites/default/files/uploadedFiles/Robotics_Programs/FTC/Game_Info/2012/FTC_Forum_Answered_Questions.pdf";
    NSURL *nsurl=[NSURL URLWithString:url];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [wv loadRequest:nsrequest];
    wv.scalesPageToFit = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
