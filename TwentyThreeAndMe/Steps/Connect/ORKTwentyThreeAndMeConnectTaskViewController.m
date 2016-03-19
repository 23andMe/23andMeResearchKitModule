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

#import "ORKTwentyThreeAndMeConnectTaskViewController.h"

#import "ORKOrderedTask+TwentyThreeAndMe.h"
#import "ORKResult+TwentyThreeAndMe.h"

@interface ORKTwentyThreeAndMeConnectTaskViewController ()<ORKTaskViewControllerDelegate>

@end

@implementation ORKTwentyThreeAndMeConnectTaskViewController

+ (ORKTwentyThreeAndMeConnectTaskViewController *)twentyThreeAndMeTaskViewControllerWithIdentifier:(NSString *)identifier
                                                                                   allowedUserMode:(ORKTwentyThreeAndMeAllowedUserMode)allowedUserMode
                                                                                   studyDependency:(ORKTwentyThreeAndMeStudyDependency)studyDependency
                                                                                      authClientId:(NSString *)clientId
                                                                                  authClientSecret:(NSString *)clientSecret
                                                                                        authScopes:(NSString *)scopes
                                                                           investigatorDisplayName:(NSString *)investigatorDisplayName
                                                                                  studyDisplayName:(NSString *)studyDisplayName
                                                                                 studyContactEmail:(NSString *)studyContactEmail
                                                                                   baseURLOverride:(nullable NSString *)baseURLOverride {
    ORKOrderedTask *ttamTask = [ORKOrderedTask twentyThreeAndMeTaskWithIdentifier:identifier
                                                                  allowedUserMode:allowedUserMode
                                                                  studyDependency:studyDependency
                                                                     authClientId:clientId
                                                                 authClientSecret:clientSecret
                                                                       authScopes:scopes
                                                          investigatorDisplayName:investigatorDisplayName
                                                                 studyDisplayName:studyDisplayName
                                                                studyContactEmail:studyContactEmail
                                                                  baseURLOverride:baseURLOverride];
    
    ORKTwentyThreeAndMeConnectTaskViewController *ttamTaskViewController = [[ORKTwentyThreeAndMeConnectTaskViewController alloc] initWithTask:ttamTask
                                                                                                                                  taskRunUUID:nil];
    ttamTaskViewController.delegate = ttamTaskViewController;
    ttamTaskViewController.showsProgressInNavigationBar = NO;
    
    return ttamTaskViewController;
}

#pragma mark Protocol ORKTaskViewControllerDelegate

- (void)taskViewController:(ORKTaskViewController *)taskViewController
       didFinishWithReason:(ORKTaskViewControllerFinishReason)reason
                     error:(nullable NSError *)error {
    NSMutableDictionary *resultDict = [NSMutableDictionary dictionary];
    if( reason == ORKTaskViewControllerFinishReasonDiscarded ) {
        if( self.twentyThreeAndMeConnectDelegate ) {
            [resultDict setObject:@"cancelled" forKey:@"completionType"];
            [self.twentyThreeAndMeConnectDelegate twentyThreeAndMeConnectTaskViewController:self didFinishWithResults:resultDict error:nil];
        }
    }
    else if( reason == ORKTaskViewControllerFinishReasonCompleted ) {
        if( self.twentyThreeAndMeConnectDelegate ) {
            ORKTaskResult *taskResult = [taskViewController result];
            ORKCollectionResult *connectResultCollection = (ORKCollectionResult *)[taskResult resultForIdentifier:@"twentyThreeAndMe.connect"];
            ORKTwentyThreeAndMeConnectResult *connectResult = (ORKTwentyThreeAndMeConnectResult *)[connectResultCollection.results firstObject];
            if( connectResult ) {
                [resultDict setObject:connectResult.authToken forKey:@"authToken"];
                [resultDict setObject:connectResult.refreshToken forKey:@"refreshToken"];
            }
            
            [resultDict setObject:@"success" forKey:@"completionType"];
            [self.twentyThreeAndMeConnectDelegate twentyThreeAndMeConnectTaskViewController:self didFinishWithResults:resultDict error:nil];
        }
    }
}

- (void)taskViewController:(ORKTaskViewController *)taskViewController stepViewControllerWillAppear:(ORKStepViewController *)stepViewController {    
    [stepViewController.backButtonItem setTintColor:[UIColor colorWithRed:146.0/255.0 green:199.0/255.0 blue:70.0/255.0 alpha:1.0]];
    [stepViewController.cancelButtonItem setTintColor:[UIColor colorWithRed:146.0/255.0 green:199.0/255.0 blue:70.0/255.0 alpha:1.0]];
}

@end
