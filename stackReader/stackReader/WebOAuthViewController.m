//
//  WebOAuthViewController.m
//  stackReader
//
//  Created by David Livingstone on 8/1/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "WebOAuthViewController.h"
@import WebKit;

NSString const *kBaseURL = @"https://stackexchange.com/oauth/dialog";
NSString const *kRedirectURI = @"https://stackexchange.com/oauth/login_success";
NSString const *kClientID = @"7590";

@interface WebOAuthViewController ()<WKNavigationDelegate>

@end

@implementation WebOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebView *webView = [[WKWebView alloc]init];
    webView.frame = self.view.frame;
    [self.view addSubview:webView];
    
    webView.navigationDelegate = self;
    NSString *finalURL = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@", kBaseURL, kClientID, kRedirectURI];
    
    [webView loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:finalURL]]];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    if ([navigationAction.request.URL.path isEqualToString:@"/oauth/login_success"]) {
        NSString *fragmentString = navigationAction.request.URL.fragment;
        
        NSArray *components = [fragmentString componentsSeparatedByString:@"&"];
        
        NSLog(@"%@", components);
        NSString *fullTokenParameter = components.firstObject;
        NSString *token = [fullTokenParameter componentsSeparatedByString:@"="].lastObject;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:token forKey:@"token"];
        [defaults synchronize];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
