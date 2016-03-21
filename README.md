# 23andMe ResearchKit Module
Bring genetic data to your ResearchKit-enabled research app with 23andMe.

## Introduction
Seamlessly incorporate genetic data collection into your ResearchKit-enabled app. With 23andMe's ResearchKit module you can use 23andMe as a source for collecting genetic data from both existing 23andMe customers as well as other individuals who you'd like to send sign up for 23andMe.

23andMe's ResearchKit module allows makes it easy to either:
- Request that an existing 23andMe customers agree to share their genetic data with your app
- Have a non-23andMe customer create a 23andMe account and profile, and agree to share their genetic data with your app, when available.

### Authenticating with the 23andMe API
Once a user has gone through the 23andMe module, the app will return an authorization code that you can exchange for auth & refresh tokens using the 23andMe API. See the [documentation] for additional details.

### Retreiving genetic data via the API
- See the [genomes] endpoint documentation for downloading genomewide data
- See the [genotypes] endpoint documentation for retreiving data for select genotypes

## Getting Started
1. Contact 23andMe for development environment access

   fdfdfdsfdf
2. Download ResearchKit
 
   The 23andMe module has been tested against Researchkit 1.3.0
## Integrating the 23andMe Module
## Questions?
Contact us at researchkit@23andme.com

[documentation]: https://api.23andme.com/docs/authentication/
[genomes]: https://api.23andme.com/docs/reference/#genomes
[genotypes]: https://api.23andme.com/docs/reference/#genotypes
