//
//  NRDMainViewController.m
//  BRAVO.iOS.Challenge.06CoreData
//
//  Created by Mike Dockerty on 5/8/14.
//  Copyright (c) 2014 The Nerdery. All rights reserved.
//

#import "NRDMainViewController.h"
#import "NRDDataController.h"

@interface NRDMainViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *topActivityIndicator;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *bottomActivityIndicator;

@property (weak, nonatomic) IBOutlet UILabel *initialParseResultsLabel;
@property (weak, nonatomic) IBOutlet UILabel *updateParseResultsLabel;

@property (weak, nonatomic) IBOutlet UIButton *centerButton;

@property (strong, nonatomic) NSDate *initialParseStartTime;
@property (strong, nonatomic) NSDate *updateParseStartTime;

@end

@implementation NRDMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.bottomActivityIndicator.hidden = YES;
    self.topActivityIndicator.hidden = YES;
    
    [self.centerButton addTarget:self action:@selector(beginInitialParse:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)beginInitialParse:(id)sender {
    self.topActivityIndicator.hidden = NO;
    [self.topActivityIndicator startAnimating];
    self.centerButton.enabled = NO;
    
    self.initialParseStartTime = [NSDate date];
    
    [NRDDataController parseInitialDataWithCompletionBlock:^ (BOOL success) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self finishInitialParse];
        });
    }];
}

- (void)finishInitialParse
{
    NSTimeInterval initialParseDuration = [[NSDate date] timeIntervalSinceDate:self.initialParseStartTime];
    [self.topActivityIndicator stopAnimating];
    self.initialParseResultsLabel.hidden = NO;
    self.initialParseResultsLabel.text = [NSString stringWithFormat:@"%1.3f seconds", initialParseDuration];
    
    [self.centerButton setTitle:@"Start Update Parse" forState:UIControlStateNormal];
    self.centerButton.enabled = YES;
    [self.centerButton addTarget:self action:@selector(beginUpdateParse:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)beginUpdateParse:(id)sender {
    self.bottomActivityIndicator.hidden = NO;
    [self.bottomActivityIndicator startAnimating];
    self.centerButton.enabled = NO;
    
    self.updateParseStartTime = [NSDate date];
    
    [NRDDataController parseInitialDataWithCompletionBlock:^ (BOOL success) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self finishUpdateParse];
        });
    }];
}

- (void)finishUpdateParse
{
    NSTimeInterval updateParseDuration = [[NSDate date] timeIntervalSinceDate:self.updateParseStartTime];
    [self.bottomActivityIndicator stopAnimating];
    self.updateParseResultsLabel.hidden = NO;
    self.updateParseResultsLabel.text = [NSString stringWithFormat:@"%1.3f seconds", updateParseDuration];
    
    [UIView animateWithDuration:0.3
                     animations:^ {
                         self.centerButton.alpha = 0.0f;
                     }];
}

@end
