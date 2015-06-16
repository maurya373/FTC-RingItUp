//
//  OnePageVC.m
//  RoboHelper
//
//  Created by Maurya on 2/25/13.
//  Copyright (c) 2013 CompleteIP. All rights reserved.
//

#import "OnePageVC.h"

@interface OnePageVC ()

@end

@implementation OnePageVC

@synthesize wv;


- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *url=@"http://www.usfirst.org/sites/default/files/uploadedFiles/Robotics_Programs/FTC/Game_Info/2012/Ring_It_Up_OnePage.pdf";
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
