/*
 Copyright (c) 2016, 23andMe, Inc. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:
 
 1.  Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 2.  Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation and/or
 other materials provided with the distribution.
 
 3.  Neither the name of the copyright holder(s) nor the names of any contributors
 may be used to endorse or promote products derived from this software without
 specific prior written permission. No license is granted to the trademarks of
 the copyright holders even if such marks are included in this software.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "ORKTwentyThreeAndMeSuccessNewViewController.h"

#import "UIButton+T23.h"
#import "UILabel+T23.h"

@implementation ORKTwentyThreeAndMeSuccessNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAppearance];
}

- (void)doneButtonPressed:(UIButton *)sender {
    [self.delegate successNewDoneButtonPressed];
}

- (void)setupAppearance {
    //--------------------
    // Style
    self.view.backgroundColor = [UIColor whiteColor];
    
    //--------------------
    // Scroll View
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollView
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollView
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    //--------------------
    // - Gene Pill Image View
    UIImage *genePillImage = [UIImage imageNamed:@"congratulations_chromosome_blue" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    UIImageView *genePillImageView = [[UIImageView alloc] initWithImage:genePillImage];
    [scrollView addSubview:genePillImageView];
    genePillImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:genePillImageView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:0.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:genePillImageView
                                                           attribute:NSLayoutAttributeLeading
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeLeading
                                                          multiplier:1.0
                                                            constant:0.0]];
    
    //--------------------
    // - Title Label
    UILabel *titleLabel = [UILabel t23HeaderLabelWithText:ORKLocalizedString(@"TWENTYTHREEANDME_COMPLETE_TITLE", nil)];
    [scrollView addSubview:titleLabel];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:genePillImageView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1.0
                                                                 constant:10.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:scrollView
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1.0
                                                                 constant:15.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:scrollView
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1.0
                                                                 constant:-15.0]];
    
    //--------------------
    // - Scroll View Width Behavior
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:1.0
                                                            constant:-30.0]];
    
    //--------------------
    // - Description Label
    NSString *descriptionLabelText = [NSString stringWithFormat:ORKLocalizedString(@"TWENTYTHREEANDME_COMPLETE_NEW_DETAIL", nil), self.studyDisplayName, self.studyDisplayName];
    UILabel *descriptionLabel = [UILabel t23BodyLabelWithText:descriptionLabelText];
    [scrollView addSubview:descriptionLabel];
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:descriptionLabel
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:titleLabel
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1.0
                                                                 constant:20.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:descriptionLabel
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:scrollView
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1.0
                                                                 constant:15.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:descriptionLabel
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:scrollView
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1.0
                                                                 constant:-15.0]];
    
    //--------------------
    // - Next Steps Title
    UILabel *nextStepsHeaderLabel = [UILabel t23SubheaderLabelWithText:ORKLocalizedString(@"TWENTYTHREEANDME_COMPLETE_NEW_NEXT_STEP", nil)];
    [scrollView addSubview:nextStepsHeaderLabel];
    nextStepsHeaderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:nextStepsHeaderLabel
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:descriptionLabel
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:15.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:nextStepsHeaderLabel
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:scrollView
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:15.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:nextStepsHeaderLabel
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:scrollView
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:-15.0]];
    
    //--------------------
    // - Next Steps Details
    NSString *nextStepsDetailsText = ORKLocalizedString(@"TWENTYTHREEANDME_COMPLETE_NEW_NEXT_STEP_DETAIL", nil);
    UILabel *nextStepsDetailsLabel = [UILabel t23BodyLabelWithText:nextStepsDetailsText];
    [scrollView addSubview:nextStepsDetailsLabel];
    nextStepsDetailsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:nextStepsDetailsLabel
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nextStepsHeaderLabel
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:10.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:nextStepsDetailsLabel
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:scrollView
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:15.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:nextStepsDetailsLabel
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:scrollView
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:-15.0]];
    
    //--------------------
    // - Bottom Constraint
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:nextStepsDetailsLabel
                                                           attribute:NSLayoutAttributeBottom
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:0.0]];
    
    //--------------------
    // Divider View
    UIView *dividerView = [[UIView alloc] init];
    dividerView.backgroundColor = [UIColor colorWithRed:227.0/255.0 green:229.0/255.0 blue:230.0/255.0 alpha:1.0];
    [self.view addSubview:dividerView];
    dividerView.translatesAutoresizingMaskIntoConstraints = NO;
    [dividerView addConstraint:[NSLayoutConstraint constraintWithItem:dividerView
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1.0
                                                             constant:1.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dividerView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:scrollView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dividerView
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dividerView
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    //--------------------
    // Done Button
    UIButton *doneButton = [UIButton t23ButtonWithText:ORKLocalizedString(@"TWENTYTHREEANDME_COMPLETE_DONE_BUTTON", nil) andHasBorder:YES];
    [self.view addSubview:doneButton];
    [doneButton addTarget:self action:@selector(doneButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    doneButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:doneButton
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:dividerView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:20.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:doneButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-20.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:doneButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
}


@end
