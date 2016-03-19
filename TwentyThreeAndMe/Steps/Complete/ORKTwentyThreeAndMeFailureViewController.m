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

#import "ORKTwentyThreeAndMeFailureViewController.h"

#import "UIButton+T23.h"
#import "UILabel+T23.h"

@interface ORKTwentyThreeAndMeFailureViewController ()

@end

@implementation ORKTwentyThreeAndMeFailureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAppearance];
}

- (void)tryAgainButtonPressed:(UIButton *)sender {
    [self.delegate failureTryAgainButtonPressed];
}

- (void)declineButtonPressed:(UIButton *)sender {
    [self.delegate failureDeclineButtonPressed];
}

- (void)contactStudyButtonPressed:(UIButton *)sender {
    NSString *contactStudyByMail = [NSString stringWithFormat:@"mailto:?to=%@&subject=%@&body=%@",
                                    [self.studyContactEmail stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
                                    [self.studyDisplayName stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
                                    @""];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:contactStudyByMail]];
}

- (void)setupAppearance {
    //--------------------
    // Style
    self.view.backgroundColor = [UIColor whiteColor];
    
    //--------------------
    // Gene Pill Image View
    UIImage *genePillImage = [UIImage imageNamed:@"failure_chromosome_purple" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    UIImageView *genePillImageView = [[UIImageView alloc] initWithImage:genePillImage];
    [self.view addSubview:genePillImageView];
    genePillImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:genePillImageView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:genePillImageView
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    //--------------------
    // Text Content View
    UIView *textContentView = [[UIView alloc] init];
    [self.view addSubview:textContentView];
    textContentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:textContentView
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:textContentView
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:textContentView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:-20.0]];
    
    //--------------------
    // Title Label
    UILabel *titleLabel = [UILabel t23HeaderLabelWithText:ORKLocalizedString(@"TWENTYTHREEANDME_FAILURE_TITLE", nil)];
    [textContentView addSubview:titleLabel];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [textContentView addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:textContentView
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1.0
                                                                 constant:0.0]];
    [textContentView addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:textContentView
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1.0
                                                                 constant:15.0]];
    [textContentView addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:textContentView
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1.0
                                                                 constant:-15.0]];
    
    //--------------------
    // Description Label
    NSString *descriptionLabelText = [NSString stringWithFormat:ORKLocalizedString(@"TWENTYTHREEANDME_FAILURE_DESCRIPTION", nil), self.studyDisplayName, self.studyDisplayName];
    UILabel *descriptionLabel = [UILabel t23BodyLabelWithText:descriptionLabelText];
    [textContentView addSubview:descriptionLabel];
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [textContentView addConstraint:[NSLayoutConstraint constraintWithItem:descriptionLabel
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:titleLabel
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1.0
                                                                 constant:20.0]];
    [textContentView addConstraint:[NSLayoutConstraint constraintWithItem:descriptionLabel
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:textContentView
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1.0
                                                                 constant:15.0]];
    [textContentView addConstraint:[NSLayoutConstraint constraintWithItem:descriptionLabel
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:textContentView
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1.0
                                                                 constant:-15.0]];
    
    UIButton *contactStudyButton = [[UIButton alloc] init];
    NSString *contactStudyText = [NSString stringWithFormat:ORKLocalizedString(@"TWENTYTHREEANDME_FAILURE_CONTACT", nil), self.studyDisplayName];
    [contactStudyButton addTarget:self action:@selector(contactStudyButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [contactStudyButton setTitle:contactStudyText forState:UIControlStateNormal];
    UIColor *t23BlueColor = [UIColor colorWithRed:53.0/255.0 green:149.0/255.0 blue:214.0/255.0 alpha:1.0];
    [contactStudyButton setTitleColor:t23BlueColor forState:UIControlStateNormal];
    contactStudyButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [textContentView addSubview:contactStudyButton];
    contactStudyButton.translatesAutoresizingMaskIntoConstraints = NO;
    [contactStudyButton addConstraint:[NSLayoutConstraint constraintWithItem:contactStudyButton
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1.0
                                                                    constant:45.0]];
    [textContentView addConstraint:[NSLayoutConstraint constraintWithItem:contactStudyButton
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:descriptionLabel
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1.0
                                                                 constant:-10.0]];
    [textContentView addConstraint:[NSLayoutConstraint constraintWithItem:contactStudyButton
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:textContentView
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1.0
                                                                 constant:15.0]];
    [textContentView addConstraint:[NSLayoutConstraint constraintWithItem:contactStudyButton
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:textContentView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    //--------------------
    // Try Again Button
    UIButton *tryAgainButton = [UIButton t23ButtonWithText:ORKLocalizedString(@"TWENTYTHREEANDME_FAILURE_TRY_AGAIN_BUTTON", nil) andHasBorder:YES];
    [self.view addSubview:tryAgainButton];
    [tryAgainButton addTarget:self action:@selector(tryAgainButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    tryAgainButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tryAgainButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    //--------------------
    // Decline Button
    UIButton *declineButton = [UIButton t23ButtonWithText:ORKLocalizedString(@"TWENTYTHREEANDME_FAILURE_DECLINE_BUTTON", nil) andHasBorder:NO];
    [self.view addSubview:declineButton];
    [declineButton addTarget:self action:@selector(declineButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    declineButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:declineButton
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:tryAgainButton
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:5.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:declineButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:declineButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-10.0]];
}

@end
