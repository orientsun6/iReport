//
//  API.m
//  iReporter
//
//  Created by Charles Liu on 2014-08-19.
//  Copyright (c) 2014 Marin Todorov. All rights reserved.
//

#import "API.h"

#define kAPIHost @"http://localhost"
#define kAPIPath @"iReporter/"
@implementation API

+ (API *)sharedInstance {
    static API *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[API alloc] initWithBaseURL:[NSURL URLWithString: kAPIHost]];
        //sharedInstance.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
    });
    return sharedInstance;
}

- (API *)init
{
    self = [super init];
    
    if (self) {
        self.user = nil;
        
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        
        [self set];
        
    }
    
    return self;
}

- (BOOL)isAuthorized {
    return [[self.user objectForKey:@"IdUser"] intValue] > 0;
}


@end
