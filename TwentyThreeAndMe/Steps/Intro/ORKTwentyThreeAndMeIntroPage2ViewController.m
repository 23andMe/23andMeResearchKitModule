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

#import "ORKTwentyThreeAndMeIntroPage2ViewController.h"

#import "UIButton+T23.h"
#import "UILabel+T23.h"

@interface ORKTwentyThreeAndMeIntroPage2ViewController ()

@end

@implementation ORKTwentyThreeAndMeIntroPage2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAppearance];
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
    // - Title Label
    UILabel *titleLabel = [UILabel t23HeaderLabelWithText:ORKLocalizedString(@"TWENTYTHREEANDME_INTRO_2_TITLE", nil)];
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
    // - About Description Label
    NSString *aboutDescriptionText;
    if (self.studyDependency == ORKTwentyThreeAndMeStudyDependencyRequired) {
        aboutDescriptionText = [NSString stringWithFormat:ORKLocalizedString(@"TWENTYTHREEANDME_INTRO_2_ABOUT_REQUIRED", nil), self.studyDisplayName, self.studyDisplayName];
    }
    else {
        aboutDescriptionText = [NSString stringWithFormat:ORKLocalizedString(@"TWENTYTHREEANDME_INTRO_2_ABOUT_OPTIONAL", nil), self.studyDisplayName, self.studyDisplayName];
    }
    UILabel *aboutDescriptionLabel = [UILabel t23BodyLabelWithText:aboutDescriptionText];
    [scrollView addSubview:aboutDescriptionLabel];
    aboutDescriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:aboutDescriptionLabel
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:titleLabel
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:20.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:aboutDescriptionLabel
                                                           attribute:NSLayoutAttributeLeading
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeLeading
                                                          multiplier:1.0
                                                            constant:15.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:aboutDescriptionLabel
                                                           attribute:NSLayoutAttributeTrailing
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:-15.0]];
    
    //--------------------
    // - Eligibility Header Label
    UILabel *eligibilityHeaderLabel = [UILabel t23SubheaderLabelWithText:ORKLocalizedString(@"TWENTYTHREEANDME_INTRO_2_ELIGIBILITY_HEADER", nil)];
    [scrollView addSubview:eligibilityHeaderLabel];
    eligibilityHeaderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:eligibilityHeaderLabel
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:aboutDescriptionLabel
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:15.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:eligibilityHeaderLabel
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:scrollView
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:15.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:eligibilityHeaderLabel
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:scrollView
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:-15.0]];
    
    
    UIView *lastUserIdentificationLabel = nil;
    
    //--------------------
    // - Existing User Label
    NSString *existingUserText = ORKLocalizedString(@"TWENTYTHREEANDME_INTRO_2_ELIGIBILITY_EXISTING", nil);
    UILabel *existingUserLabel = [UILabel t23BodyLabelWithText:existingUserText];
    [scrollView addSubview:existingUserLabel];
    existingUserLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:existingUserLabel
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:eligibilityHeaderLabel
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:8.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:existingUserLabel
                                                           attribute:NSLayoutAttributeLeading
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeLeading
                                                          multiplier:1.0
                                                            constant:15.0]];
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:existingUserLabel
                                                           attribute:NSLayoutAttributeTrailing
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeTrailing
                                                          multiplier:1.0
                                                            constant:-15.0]];
    lastUserIdentificationLabel = existingUserLabel;
    
    //--------------------
    // - New User Label
    if (self.allowedUserMode == ORKTwentyThreeAndMeAllowedUserModeExistingAndNew)
    {
        NSString *newUserText = ORKLocalizedString(@"TWENTYTHREEANDME_INTRO_2_ELIGIBILITY_NEW", nil);
        UILabel *newUserLabel = [UILabel t23BodyLabelWithText:newUserText];
        [scrollView addSubview:newUserLabel];
        newUserLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:newUserLabel
                                                              attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:existingUserLabel
                                                              attribute:NSLayoutAttributeBottom
                                                             multiplier:1.0
                                                               constant:2.0]];
        [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:newUserLabel
                                                              attribute:NSLayoutAttributeLeading
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:scrollView
                                                              attribute:NSLayoutAttributeLeading
                                                             multiplier:1.0
                                                               constant:15.0]];
        [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:newUserLabel
                                                              attribute:NSLayoutAttributeTrailing
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:scrollView
                                                              attribute:NSLayoutAttributeTrailing
                                                             multiplier:1.0
                                                               constant:-15.0]];
        lastUserIdentificationLabel = newUserLabel;
    }
    
    //--------------------
    // - Bottom Constraint
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:lastUserIdentificationLabel
                                                           attribute:NSLayoutAttributeBottom
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:0.0]];
    
    //--------------------
    // Gene Pill Image View
    UIImageView *genePillImageView = nil;
    if( CGRectGetHeight( [UIScreen mainScreen].bounds ) > 480.0 )
    {
        UIImage *genePillImage = [UIImage imageNamed:@"intro_chromosome_green" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
        genePillImageView = [[UIImageView alloc] initWithImage:genePillImage];
        [self.view addSubview:genePillImageView];
        genePillImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:genePillImageView
                                                               attribute:NSLayoutAttributeLeading
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.view
                                                               attribute:NSLayoutAttributeLeading
                                                              multiplier:1.0
                                                                constant:0.0]];
    }
    
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
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dividerView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    if( genePillImageView )
    {
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dividerView
                                                              attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:genePillImageView
                                                              attribute:NSLayoutAttributeBottom
                                                             multiplier:1.0
                                                               constant:24.0]];
    }
}

@end
