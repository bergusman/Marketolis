//
//  MRRPCClient.m
//  Marketolis
//
//  Created by Vitaly Berg on 12/15/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRRPCClient.h"

@implementation MRRPCClient

- (NSOperation *)sendRequest:(NSURLRequest *)request
                     success:(void (^)(AFHTTPRequestOperation *, id))success
                     failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    NSMutableURLRequest *mutableRequest = [request mutableCopy];
    if (self.authToken) {
        [mutableRequest addValue:self.authToken forHTTPHeaderField:@"Authentication"];
    }
    
    return [super sendRequest:mutableRequest success:success failure:failure];
}

@end
