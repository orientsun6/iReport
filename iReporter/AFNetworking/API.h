//
//  API.h
//  iReporter
//
//  Created by Charles Liu on 2014-08-19.
//  Copyright (c) 2014 Marin Todorov. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "AFNetworking.h"

typedef void (^JSONResponseBlock) (NSDictionary *json);

@interface API : AFHTTPSessionManager

@property (strong, nonatomic) NSDictionary *user;

+(API *)sharedInstance;

- (BOOL)isAuthorized;

- (void)commandWithParams: (NSMutableDictionary *)params onCompletion: (JSONResponseBlock)completionBlock;

@end
