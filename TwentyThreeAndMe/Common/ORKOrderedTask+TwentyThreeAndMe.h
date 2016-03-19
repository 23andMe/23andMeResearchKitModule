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

#import <ResearchKit/ResearchKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ORKOrderedTask (TwentyThreeAndMe)

/**
 *  Returns a predefined task that connects a participant with 23andMe
 *
 *  @param identifier              The task identifier to use for this task, appropriate to the study.
 *  @param allowedUserMode         Identify the type of users to allow for the module
 *  @param studyDependency         Whether the study requires the module to be succesfully completed. Changes flow/text.
 *  @param clientId                oauth client id
 *  @param clientSecret            oauth client secret
 *  @param scopes                  oauth scopes string (will be url encoded)
 *  @param investigatorDisplayName User facing investigator name
 *  @param studyDisplayName        User facing study name
 *  @param studyContactEmail       Study contact email used in module
 *  @param baseURLOverride         Optional override for connection URL.
 *
 *  @return ORKOrderedTask
 */
+ (ORKOrderedTask *)twentyThreeAndMeTaskWithIdentifier:(NSString *)identifier
                                       allowedUserMode:(ORKTwentyThreeAndMeAllowedUserMode)allowedUserMode
                                       studyDependency:(ORKTwentyThreeAndMeStudyDependency)studyDependency
                                          authClientId:(NSString *)clientId
                                      authClientSecret:(NSString *)clientSecret
                                            authScopes:(NSString *)scopes
                               investigatorDisplayName:(NSString *)investigatorDisplayName
                                      studyDisplayName:(NSString *)studyDisplayName
                                     studyContactEmail:(NSString *)studyContactEmail
                                       baseURLOverride:(nullable NSString *)baseURLOverride;

@end

NS_ASSUME_NONNULL_END
