//
//  JSONParser.h
//  stackReader
//
//  Created by David Livingstone on 8/2/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"
#import "User.h"

@interface JSONParser : NSObject

+ (NSArray *)questionResultsFromJSON:(NSDictionary *)jsonData;
+ (User *)userFromJSON:(NSDictionary *)userData;

@end
