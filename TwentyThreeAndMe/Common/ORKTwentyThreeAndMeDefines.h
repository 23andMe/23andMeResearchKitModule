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

#ifndef ORKTwentyThreeAndMeDefines_h
#define ORKTwentyThreeAndMeDefines_h

/**
 Identify what type of users should be serviced by this module
 */
typedef NS_ENUM(NSInteger, ORKTwentyThreeAndMeAllowedUserMode) {
    /// Existing 23andMe customers only
    ORKTwentyThreeAndMeAllowedUserModeExistingOnly,
    
    /// Existing 23andMe customers, and new customers who will receive kits furnished by the study.
    ORKTwentyThreeAndMeAllowedUserModeExistingAndNew,
} ORK_ENUM_AVAILABLE;

/**
 Identify whether completion of the module successfully is required for participation in the study
 */
typedef NS_ENUM(NSInteger, ORKTwentyThreeAndMeStudyDependency) {
    /// Successful completion is required
    ORKTwentyThreeAndMeStudyDependencyRequired,
    
    /// Successful completion is optional
    ORKTwentyThreeAndMeStudyDependencyOptional,
} ORK_ENUM_AVAILABLE;


#endif /* ORKTwentyThreeAndMeDefines_h */
