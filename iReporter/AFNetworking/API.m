//
//  API.m
//  iReporter
//
//  Created by Charles Liu on 2014-08-19.
//  Copyright (c) 2014 Marin Todorov. All rights reserved.
//

#import "API.h"

#define kAPIHost @"http://localhost/~charlesliu/"
#define kAPIPath @"iReporter/"
@implementation API

+ (API *)sharedInstance {
    static API *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString: kAPIHost]];
        //sharedInstance.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
    });
    return sharedInstance;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    if (self) {
        self.user = nil;
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    
    return self;
}

- (BOOL)isAuthorized {
    return [[self.user objectForKey:@"IdUser"] intValue] > 0;
}

- (void)commandWithParams:(NSMutableDictionary *)params {
/*
    [self POST:kAPIPath parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completionBlock(@{@"error": [error localizedDescription]});
    }];
  */  
}

@end
