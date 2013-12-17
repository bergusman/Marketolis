//
//  MRRPCClient.h
//  Marketolis
//
//  Created by Vitaly Berg on 12/15/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "PDRpcClient.h"

@interface MRRPCClient : PDRpcClient

@property (strong, nonatomic) NSString *authToken;

@end
