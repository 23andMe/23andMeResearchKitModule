<img src="https://23andme.https.internapcdn.net/res/img/youpub/eMSIv5E4y1ilKTq6zq1MEQ_logo.svg" alt="23andMe logo" width="400" height="150">

# 23andMe ResearchKit Module
Bring genetic data to your ResearchKit-enabled research app with 23andMe.

## Introduction
Seamlessly incorporate genetic data collection into your ResearchKit-enabled app. With 23andMe's ResearchKit module you can use 23andMe as a source for collecting genetic data from both existing 23andMe customers as well as other individuals who you'd like to send sign up for 23andMe.

23andMe's ResearchKit module allows makes it easy to either:
- Request that an existing 23andMe customers agree to share their genetic data with your app
- Have a non-23andMe customer create a 23andMe account and profile, and agree to share their genetic data with your app, when available.

### Supported Configurations
#### 23andMe Customer Types
- Existing 23andMe customers only

   This configuration allows existing 23andMe customers to share their genotype data with your research study.
- Existing and new 23andMe customers

   Note that this configuration requres that a researcher has a purchase agreement in place to sponsor the purchase of a 23andMe kit for participants the researcher has deemed eligibile.

#### Contribution of Data
- Contributing genetic data required
- Contributing genetic data optional

## Getting Started
### Requirements
- ResearchKit 1.3.0 (has not been tested against other versions)
- iOS Base SDK 8.0+

### Contact 23andMe for development environment access
23andMe has created a development environment for researchers looking to include the 23andMe module in their app. Send an email to researchkit@23andme.com for more information on accessing the development environment.

If your app will only accept data from existing 23andMe customers, then you may not need access to the development environment. You can create a development API account [here].

Note that development accounts are limited to 20 users. **You will need to request an API [upgrade] before you release your app.**

### Authenticating with the 23andMe API
Once a user has gone through the 23andMe module, the app will return an authorization code that you can exchange for auth & refresh tokens using the 23andMe API. See the [documentation] for additional details.

### Retreiving genetic data via the API
- See the [genomes] endpoint documentation for downloading genomewide data
- See the [genotypes] endpoint documentation for retreiving data for select genotypes

## Integrating the 23andMe Module
1. Add the ReserchKit framework to your app
 
   Follow the instructions posted at the [ResearchKit repo].

2. Add the 23andMe module to your app's project
 
   Clone the 23andMe module:
   ```bash
   git clone https://github.com/23andMe/23andMeResearchKitModule.git
   ```
   Copy the module inside your ResearchKit project. Copy the "TwentyThreeAndMe" into the ResearchKit project inside of XCode.
   
3. Update ResearchKit code
   
   See the "OtherEdits.txt" file for a

    **Researchkit.h**
   Don't forget that when you add the following files to your project, they must have target membership set to "public"
   ```objc
   #import <ResearchKit/ORKTwentyThreeAndMeDefines.h>
   #import <ResearchKit/ORKTwentyThreeAndMeConnectTaskViewController.h>
   ```
   
   **Researchkit.private**
   Don't forget that when you add the following files to your project, they must have target membership set to "public"
   ```objc
   #import <ResearchKit/ORKOrderedTask+TwentyThreeAndMe.h>
   #import <ResearchKit/ORKResult+TwentyThreeAndMe.h>
   ```
   
   **Researchkit.strings - English**
   ```objc
   /* 23andMe connect task. */
   "TWENTYTHREEANDME_DECLINE_PROMPT_DETAILS" = "Are you sure you want to decline adding your    genetic data to %@? Declining may impact your eligibility for this study";
   "TWENTYTHREEANDME_DECLINE_PROMPT_ACTION_DECLINE" = "Decline";
   "TWENTYTHREEANDME_DECLINE_PROMPT_ACTION_CANCEL" = "Cancel";

   "TWENTYTHREEANDME_INTRO_MAIN_SHARE" = "Add Genetic Data";
   "TWENTYTHREEANDME_INTRO_MAIN_DECLINE" = "Decline";

   "TWENTYTHREEANDME_INTRO_1_DESCRIPTION" = "%@ has selected 23andMe to collect genetic data for the %@ study";

   "TWENTYTHREEANDME_INTRO_2_TITLE" = "About this study";
   "TWENTYTHREEANDME_INTRO_2_ABOUT_REQUIRED" = "Contributing your genetic data is required for participation in the %@ study. You will need to authorize 23andMe to share that data with %@";
   "TWENTYTHREEANDME_INTRO_2_ABOUT_OPTIONAL" = "In order to contribute your genetic data to the %@ study, you will need to authorize 23andMe to share that data with %@";
   "TWENTYTHREEANDME_INTRO_2_ELIGIBILITY_HEADER" = "Eligibility";
   "TWENTYTHREEANDME_INTRO_2_ELIGIBILITY_EXISTING" = "• Existing 23andMe users";
   "TWENTYTHREEANDME_INTRO_2_ELIGIBILITY_NEW" = "• Individuals who agree to receive the 23andMe Personal Genome Service at no cost";

   "TWENTYTHREEANDME_INTRO_3_TITLE" = "About 23andMe";
   "TWENTYTHREEANDME_INTRO_3_MISSION" = "23andMe is a genetic service available directly to U.S. customers that includes reports that meet FDA standards for being scientifically and clinically valid. 23andMe helps people understand what’s in their DNA. The 23andMe Personal Genome Service includes more than 60 personalized genetic health, trait and ancestry reports.";
   "TWENTYTHREEANDME_INTRO_3_LEARN_MORE" = "Learn more about 23andMe";
   "TWENTYTHREEANDME_INTRO_3_QUESTIONS" = "Questions?";
   "TWENTYTHREEANDME_INTRO_3_CONTACT" = "Contact %@";

   "TWENTYTHREEANDME_COMPLETE_TITLE" = "Congratulations";
   "TWENTYTHREEANDME_COMPLETE_DONE_BUTTON" = "Done";
   "TWENTYTHREEANDME_COMPLETE_EXISTING_DETAIL" = "Congratulations, you’ve successfully enrolled in %@. %@ is now authorized to access your genetic data.";
   "TWENTYTHREEANDME_COMPLETE_NEW_DETAIL" = "Congratulations, you’ve successfully enrolled in %@. %@ is now authorized to access your genetic data.";
   "TWENTYTHREEANDME_COMPLETE_NEW_NEXT_STEP" = "Next steps";
   "TWENTYTHREEANDME_COMPLETE_NEW_NEXT_STEP_DETAIL" = "23andMe will mail you a saliva collection kit. Simply follow the instructions included with the kit, mail the sample back, and we will notify you when your reports are ready.";

   "TWENTYTHREEANDME_FAILURE_TITLE" = "Try again";
   "TWENTYTHREEANDME_FAILURE_DESCRIPTION" = "Sorry, we weren’t able to enroll you in the genetic component of %@. Please try again, or contact %@ if you have any questions.";
   "TWENTYTHREEANDME_FAILURE_CONTACT" = "Contact %@";
   "TWENTYTHREEANDME_FAILURE_TRY_AGAIN_BUTTON" = "Try again";
   "TWENTYTHREEANDME_FAILURE_DECLINE_BUTTON" = "Decline";
   ```
4. Add image assets
   
   The 23andMe module includes a series of assets used to incorporate 23andMe's look and feel. In order to include those in your app, create a "TwentyThreeAndMe" folder inside of the "Artwork.xcassets" item in your project's copy of ResearchKit. Then, copy the cotents of the /Assets folder into the folder you've just creted.

5. Create a Task

## Questions?
**Questions about 23andMe, the 23andMe API, or interested in setting up a project with us?** Contact us at researchkit@23andme.com.

**See something in our code or documentation?** Create an issue on GitHub and we'll take a look.

# License
The source in the _23andMeResearchKitModule_ repository is made available under the following license unless another license is explicitly identified:
```
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
```

[documentation]: https://api.23andme.com/docs/authentication/
[genomes]: https://api.23andme.com/docs/reference/#genomes
[genotypes]: https://api.23andme.com/docs/reference/#genotypes
[here]: https://api.23andme.com/
[upgrade]: https://api.23andme.com/overview/
[ResearchKit repo]: https://github.com/researchkit/researchkit#adding-the-researchkit-framework-to-your-app
