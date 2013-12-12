// Generated by Pdef Objective-C generator.

#import <Foundation/Foundation.h>
#import "PDef.h"


@interface MRAuthResult : PDMessage
@property (nonatomic) int64_t userId;
@property (nonatomic) NSString *token;
@property (nonatomic) BOOL complete;

- (BOOL) hasUserId;
- (void) clearUserId;

- (BOOL) hasToken;
- (void) clearToken;

- (BOOL) hasComplete;
- (void) clearComplete;


+ (PDMessageDescriptor *)typeDescriptor;
@end


