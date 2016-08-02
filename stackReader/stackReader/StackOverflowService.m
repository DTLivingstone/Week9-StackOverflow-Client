//
//  StackOverflowService.m
//  stackReader
//
//  Created by David Livingstone on 8/2/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "StackOverflowService.h"
@import AFNetworking;

NSString const *clientKey = @"ndxyZ0LZBgoIlHbbHLEKNw((";

@implementation StackOverflowService

+ (void)questionsForSearchTem:(NSString *)searchTerm completionHandler:(questionFetchCompletion)completionHandler {
    NSString *accessToken = [[NSUserDefaults standardUserDefaults]objectForKey:@"token"];
    
    NSString *searchURLString = [NSString stringWithFormat:@"https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=%@&site=stackoverflow&key=%@&access_token=%@", searchTerm, clientKey, accessToken];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager ??]
    
    //success
    
    NSLog(@"%", responseObject);
    NSArray *results = [JSONParser questionResultsFromJSON:responseObject];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        completionHandler(results, nil);
    });
    
    //failure
    
}



@end
