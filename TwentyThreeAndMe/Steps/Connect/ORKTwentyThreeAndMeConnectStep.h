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

#import <ResearchKit/ResearchKit_Private.h>

NS_ASSUME_NONNULL_BEGIN


/**
 * An `ORKTwentyThreeAndMeConnectStep` object allows the participant to connect
 * with 23andMe and share their data with the investigators.
 */
ORK_CLASS_AVAILABLE
@interface ORKTwentyThreeAndMeConnectStep : ORKStep

/**
 *  RedirectURI used by auth. Should match what is in developer portal.
 */
@property (nonatomic, copy, nullable) NSString *redirectURI;

/**
 *  ClientId used by auth. Should match what is in developer portal.
 */
@property (nonatomic, copy, nullable) NSString *clientId;

/**
 *  ClientSecret used by auth. Should match what is in developer portal.
 */
@property (nonatomic, copy, nullable) NSString *clientSecret;

/**
 *  Scopes used by auth.
 */
@property (nonatomic, copy, nullable) NSString *scopes;

/**
 *  Base URL to use for connections
 */
@property (nonatomic, copy, nullable) NSString *baseURL;

/**
 * The display name of the study
 */
@property (nonatomic, copy, nullable) NSString *studyDisplayNameParam;

/**
 *  Allowed User Mode for the module
 */
@property (nonatomic) ORKTwentyThreeAndMeAllowedUserMode allowedUserMode;

@end

NS_ASSUME_NONNULL_END