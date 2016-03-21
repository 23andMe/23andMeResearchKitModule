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

#import "ORKTwentyThreeAndMeCompleteViewController.h"

#import "ORKTwentyThreeAndMeCompleteStep.h"
#import "ORKTwentyThreeAndMeSuccessExistingViewController.h"
#import "ORKTwentyThreeAndMeSuccessNewViewController.h"
#import "ORKTwentyThreeAndMeFailureViewController.h"


@interface ORKTwentyThreeAndMeCompleteViewController() <ORKTwentyThreeAndMeSuccessExistingViewControllerDelegate, ORKTwentyThreeAndMeSuccessNewViewControllerDelegate, ORKTwentyThreeAndMeFailureViewControllerDelegate>

@property (nonatomic) ORKTwentyThreeAndMeSuccessExistingViewController *successExistingViewController;

@property (nonatomic) ORKTwentyThreeAndMeSuccessNewViewController *successNewViewController;

@property (nonatomic) ORKTwentyThreeAndMeFailureViewController *failureViewController;

@end

@implementation ORKTwentyThreeAndMeCompleteViewController

- (ORKTwentyThreeAndMeCompleteStep *)completeStep {
    return (ORKTwentyThreeAndMeCompleteStep *)self.step;
}

- (void)successExistingDoneButtonPressed {
    [self goForward];
}

- (void)successNewDoneButtonPressed {
    [self goForward];
}

- (void)failureTryAgainButtonPressed {
    [self goBackward];
}

- (void)failureDeclineButtonPressed {
    [self.taskViewController.delegate taskViewController:self.taskViewController
                                     didFinishWithReason:ORKTaskViewControllerFinishReasonDiscarded
                                                   error:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ORKTwentyThreeAndMeCompleteStep *completeStep = [self completeStep];
    NSString *studyDisplayName = completeStep.studyDisplayName;
    NSString *studyContactEmail = completeStep.studyContactEmail;
    
    self.successExistingViewController = [[ORKTwentyThreeAndMeSuccessExistingViewController alloc] init];
    self.successExistingViewController.delegate = self;
    self.successExistingViewController.studyDisplayName = studyDisplayName;
    
    self.successNewViewController = [[ORKTwentyThreeAndMeSuccessNewViewController alloc] init];
    self.successNewViewController.delegate = self;
    self.successNewViewController.studyDisplayName = studyDisplayName;
    
    self.failureViewController = [[ORKTwentyThreeAndMeFailureViewController alloc] init];
    self.failureViewController.delegate = self;
    self.failureViewController.studyDisplayName = studyDisplayName;
    self.failureViewController.studyContactEmail = studyContactEmail;
    
    self.cancelButtonItem = nil;
    self.backButtonItem = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
        
    // Use Results to Determine What To Show
    ORKTaskResult *taskResult = [self.taskViewController result];
    ORKCollectionResult *connectResultCollection = (ORKCollectionResult *)[taskResult resultForIdentifier:@"twentyThreeAndMe.connect"];
    ORKTwentyThreeAndMeConnectResult *connectResult = (ORKTwentyThreeAndMeConnectResult *)[connectResultCollection.results firstObject];
    if( connectResult.authToken &&
        connectResult.refreshToken ) {
        [self hideFailureViewController];
        if( connectResult.newUserFlow )
        {
            [self showSuccessNewViewController];
        }
        else
        {
            [self showSuccessExistingViewController];
        }
    }
    else {
        [self hideSuccessExistingViewController];
        [self showFailureViewController];
    }
}

- (void)showSuccessExistingViewController {
    [self addChildViewController:self.successExistingViewController];
    [self.view addSubview:self.successExistingViewController.view];
    [self.successExistingViewController didMoveToParentViewController:self];
}

- (void)hideSuccessExistingViewController {
    [self.successExistingViewController willMoveToParentViewController:nil];
    [self.successExistingViewController.view removeFromSuperview];
    [self.successExistingViewController removeFromParentViewController];
}

- (void)showSuccessNewViewController {
    [self addChildViewController:self.successNewViewController];
    [self.view addSubview:self.successNewViewController.view];
    [self.successNewViewController didMoveToParentViewController:self];
}

- (void)hideSuccessNewViewController {
    [self.successNewViewController willMoveToParentViewController:nil];
    [self.successNewViewController.view removeFromSuperview];
    [self.successNewViewController removeFromParentViewController];
}

- (void)showFailureViewController {
    [self addChildViewController:self.failureViewController];
    [self.view addSubview:self.failureViewController.view];
    [self.failureViewController didMoveToParentViewController:self];
}

- (void)hideFailureViewController {
    [self.failureViewController willMoveToParentViewController:nil];
    [self.failureViewController.view removeFromSuperview];
    [self.failureViewController removeFromParentViewController];
}

@end
