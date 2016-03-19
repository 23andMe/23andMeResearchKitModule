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

#import "ORKTwentyThreeAndMeIntroPage3ViewController.h"

#import "UIButton+T23.h"
#import "UILabel+T23.h"

@interface ORKTwentyThreeAndMeIntroPage3ViewController ()

@end

@implementation ORKTwentyThreeAndMeIntroPage3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAppearance];
}

- (void)contactStudyButtonPressed:(UIButton *)sender {
    NSString *contactStudyByMail = [NSString stringWithFormat:@"mailto:?to=%@&subject=%@&body=%@",
        [self.studyContactEmail stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
        [self.studyDisplayName stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
        @""];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:contactStudyByMail]];
}

- (void)learnMoreButtonPressed:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.23andme.com/service/"]];
}

- (void)setupAppearance {
    //--------------------
    // Style
    self.view.backgroundColor = [UIColor whiteColor];
    UIColor *t23BlueColor = [UIColor colorWithRed:53.0/255.0 green:149.0/255.0 blue:214.0/255.0 alpha:1.0];
    
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
    // - Title Label
    UILabel *titleLabel = [UILabel t23HeaderLabelWithText:ORKLocalizedString(@"TWENTYTHREEANDME_INTRO_3_TITLE", nil)];
    [scrollView addSubview:titleLabel];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:0.0]];
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
    // - Mission Description Label
    UILabel *missionDescriptionLabel = [UILabel t23BodyLabelWithText:ORKLocalizedString(@"TWENTYTHREEANDME_INTRO_3_MISSION", nil)];
    [scrollView addSubview:missionDescriptionLabel];
    missionDescriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:missionDescriptionLabel
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:titleLabel
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:20.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:missionDescriptionLabel
                                                           attribute:NSLayoutAttributeLeading
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeLeading
                                                          multiplier:1.0
                                                            constant:15.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:missionDescriptionLabel
                                                           attribute:NSLayoutAttributeTrailing
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeTrailing
                                                          multiplier:1.0
                                                            constant:-15.0]];
    
    //--------------------
    // - Learn More Button
    UIButton *learnMoreButton = [[UIButton alloc] init];
    NSString *learnMoreText = ORKLocalizedString(@"TWENTYTHREEANDME_INTRO_3_LEARN_MORE", nil);
    [learnMoreButton addTarget:self action:@selector(learnMoreButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [learnMoreButton setTitle:learnMoreText forState:UIControlStateNormal];
    [learnMoreButton setTitleColor:t23BlueColor forState:UIControlStateNormal];
    learnMoreButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [scrollView addSubview:learnMoreButton];
    learnMoreButton.translatesAutoresizingMaskIntoConstraints = NO;
    [learnMoreButton addConstraint:[NSLayoutConstraint constraintWithItem:learnMoreButton
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:45.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:learnMoreButton
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:missionDescriptionLabel
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:0.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:learnMoreButton
                                                           attribute:NSLayoutAttributeLeading
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeLeading
                                                          multiplier:1.0
                                                            constant:15.0]];
    
    //--------------------
    // - Questions Header Label
    UILabel *questionsHeaderLabel = [UILabel t23SubheaderLabelWithText:ORKLocalizedString(@"TWENTYTHREEANDME_INTRO_3_QUESTIONS", nil)];
    [scrollView addSubview:questionsHeaderLabel];
    questionsHeaderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:questionsHeaderLabel
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:learnMoreButton
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:10.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:questionsHeaderLabel
                                                           attribute:NSLayoutAttributeLeading
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeLeading
                                                          multiplier:1.0
                                                            constant:15.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:questionsHeaderLabel
                                                           attribute:NSLayoutAttributeTrailing
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeTrailing
                                                          multiplier:1.0
                                                            constant:-15.0]];
    
    //--------------------
    // - Contact Study Button
    UIButton *contactStudyButton = [[UIButton alloc] init];
    NSString *contactStudyText = [NSString stringWithFormat:ORKLocalizedString(@"TWENTYTHREEANDME_INTRO_3_CONTACT", nil), self.studyDisplayName];
    [contactStudyButton addTarget:self action:@selector(contactStudyButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [contactStudyButton setTitle:contactStudyText forState:UIControlStateNormal];
    [contactStudyButton setTitleColor:t23BlueColor forState:UIControlStateNormal];
    contactStudyButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [scrollView addSubview:contactStudyButton];
    contactStudyButton.translatesAutoresizingMaskIntoConstraints = NO;
    [contactStudyButton addConstraint:[NSLayoutConstraint constraintWithItem:contactStudyButton
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:nil
                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                          multiplier:1.0
                                                            constant:45.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:contactStudyButton
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:questionsHeaderLabel
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:-10.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:contactStudyButton
                                                           attribute:NSLayoutAttributeLeading
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeLeading
                                                          multiplier:1.0
                                                            constant:15.0]];
    
    //--------------------
    // - Bottom Constraint
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:contactStudyButton
                                                           attribute:NSLayoutAttributeBottom
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:0.0]];

    //--------------------
    // - Gene Pill Image View
    if( CGRectGetHeight( [UIScreen mainScreen].bounds ) > 480.0 ) {
        UIImage *genePillImage = [UIImage imageNamed:@"intro_chromosome_pink" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
        UIImageView *genePillImageView = [[UIImageView alloc] initWithImage:genePillImage];
        [scrollView addSubview:genePillImageView];
        genePillImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:genePillImageView
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:contactStudyButton
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1.0
                                                                constant:22.0]];
        [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:genePillImageView
                                                               attribute:NSLayoutAttributeTrailing
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:scrollView
                                                               attribute:NSLayoutAttributeTrailing
                                                              multiplier:1.0
                                                                constant:0.0]];
    }
    
    //--------------------
    // Divider View
    UIView *dividerView = [[UIView alloc] init];
    dividerView.backgroundColor = [UIColor colorWithRed:227.0/255.0 green:229.0/255.0 blue:230.0/255.0 alpha:1.0];
    [self.view addSubview:dividerView];
    dividerView.translatesAutoresizingMaskIntoConstraints = NO;
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
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dividerView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    [dividerView addConstraint:[NSLayoutConstraint constraintWithItem:dividerView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:1.0]];
}

@end
