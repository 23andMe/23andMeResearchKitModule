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

#import "ORKTwentyThreeAndMeConnectStepViewController.h"

#import "ORKTwentyThreeAndMeConnectStep.h"

@interface ORKTwentyThreeAndMeConnectStepViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;

@property (strong, nonatomic) NSMutableData *receivedData;

@property (nonatomic, strong) NSString *authToken;

@property (nonatomic, strong) NSString *refreshToken;

@property (nonatomic) BOOL newUserFlow;

@end

@implementation ORKTwentyThreeAndMeConnectStepViewController

- (ORKTwentyThreeAndMeConnectStep *)connectStep {
    return (ORKTwentyThreeAndMeConnectStep *)self.step;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WKWebViewConfiguration *wkConfiguration = [[WKWebViewConfiguration alloc] init];
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:wkConfiguration];
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    self.webView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.webView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.webView
                                                           attribute:NSLayoutAttributeBottom
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.webView
                                                           attribute:NSLayoutAttributeLeading
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeLeading
                                                          multiplier:1.0
                                                            constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.webView
                                                           attribute:NSLayoutAttributeTrailing
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTrailing
                                                          multiplier:1.0
                                                            constant:0.0]];
    
    [self loadAuthorizationRequest];
}

- (void)loadAuthorizationRequest
{
    NSString *signupParams = ([self connectStep].allowedUserMode == ORKTwentyThreeAndMeAllowedUserModeExistingOnly) ?
        @"hide_signup=true" :
        @"enroll_signup=true";
    NSString *contentURLString = [NSString stringWithFormat:@"%@/authorize/?redirect_uri=%@&client_id=%@&%@&select_profile=true&scope=%@&client_name=%@", [self connectStep].baseURL, [self connectStep].redirectURI, [self connectStep].clientId, signupParams, [self connectStep].scopes, [self connectStep].studyDisplayNameParam];
    NSURL *contentURL = [NSURL URLWithString:contentURLString];
    NSURLRequest *nsRequest=[NSURLRequest requestWithURL:contentURL];
    [self.webView loadRequest:nsRequest];
}

#pragma mark - ORKStepResult

- (ORKStepResult *)result {
    ORKStepResult *sResult = [super result];
    
    // "Now" is the end time of the result, which is either actually now,
    // or the last time we were in the responder chain.
    NSDate *now = sResult.endDate;
    
    NSMutableArray *results = [NSMutableArray arrayWithArray:sResult.results];
    
    ORKTwentyThreeAndMeConnectResult *connectResult = [[ORKTwentyThreeAndMeConnectResult alloc] initWithIdentifier:self.step.identifier];
    connectResult.startDate = sResult.startDate;
    connectResult.endDate = now;
    connectResult.authToken = self.authToken;
    connectResult.refreshToken = self.refreshToken;
    connectResult.newUserFlow = self.newUserFlow;
    
    [results addObject:connectResult];
    sResult.results = [results copy];
    
    return sResult;
}

#pragma mark - WebViewDelegate

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSURLRequest *request = navigationAction.request;
    if ([[[request URL] host] isEqualToString:@"localhost"]) {
        // Extract oauth_verifier from URL query
        NSString *authCode = nil;
        NSString *errorCode = nil;
        NSArray* urlParams = [[[request URL] query] componentsSeparatedByString:@"&"];
        for (NSString* param in urlParams) {
            NSArray* keyValue = [param componentsSeparatedByString:@"="];
            NSString* key = [keyValue objectAtIndex:0];
            if ([key isEqualToString:@"code"]) {
                authCode = [keyValue objectAtIndex:1];
                break;
            }
            else if([key isEqualToString:@"error"]) {
                errorCode = [keyValue objectAtIndex:1];
                break;
            }
            
            if([key isEqualToString:@"new_user"] ) {
                id keyValueElement = [keyValue objectAtIndex:1];
                if( [keyValueElement isKindOfClass:[NSString class]] ) {
                    NSString *newUserParamValue = ((NSString *)keyValueElement).lowercaseString;
                    if( [newUserParamValue isEqualToString:@"true"] )
                    {
                        self.newUserFlow = YES;
                    }
                }
            }
        }
        
        if (authCode) {
            NSString *data = [NSString stringWithFormat:@"client_id=%@&client_secret=%@&grant_type=authorization_code&code=%@&redirect_uri=%@&scope=%@", [self connectStep].clientId, [self connectStep].clientSecret, authCode, [self connectStep].redirectURI, [self connectStep].scopes];
            NSString *tokenURL = [NSString stringWithFormat:@"%@/token/", [self connectStep].baseURL];
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:tokenURL]];
            [request setHTTPMethod:@"POST"];
            [request setHTTPBody:[data dataUsingEncoding:NSUTF8StringEncoding]];
            
            self.receivedData = [[NSMutableData alloc] init];
            NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
            [theConnection start];
        }
        else if (errorCode && [errorCode isEqualToString:@"access_denied"]) {
            [self goForward];
        }
        else
        {
            // Error.
            [self goForward];
        }
        
        decisionHandler(WKNavigationActionPolicyCancel);
    }
    else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    // Error
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    // Error
}

#pragma mark - NSURLConnectionDelegate - Handles Code to Token Connection

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if( self.receivedData ) {
        [self.receivedData appendData:data];
    }
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // Error
    [self goForward];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if( self.receivedData ) {
        
        // DEBUGGING for Parse Issues
        const unsigned char *ptr = [self.receivedData bytes];
        NSString *jsonParsed = @"";
        for(int i=0; i<[self.receivedData length]; ++i) {
            unsigned char c = *ptr++;
            jsonParsed = [jsonParsed stringByAppendingFormat:@"%c", c];
        }
        
        NSError *localError = nil;
        NSDictionary *parsedData = [NSJSONSerialization JSONObjectWithData:self.receivedData options:NSJSONReadingAllowFragments error:&localError];
        if( parsedData ) {
            self.authToken = parsedData[@"access_token"];
            self.refreshToken = parsedData[@"refresh_token"];
        }
        
        // Success!
        [self goForward];
    }
}

@end
