//
//  StackOverflowService.h
//  stackReader
//
//  Created by David Livingstone on 8/2/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^questionFetchCompletion)(NSArray *results, NSError *error);

@interface StackOverflowService : NSObject

+ (void)questionsForSearchTem:(NSString *)searchTerm completionHandler:(questionFetchCompletion)completionHandler;

@end
