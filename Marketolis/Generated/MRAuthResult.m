// Generated by Pdef Objective-C generator.

#import "MRAuthResult.h"


@implementation MRAuthResult {
    BOOL _userId_isset;
    BOOL _token_isset;
    BOOL _complete_isset;
}
static PDMessageDescriptor *_MRAuthResultDescriptor;

// userId
- (BOOL)hasUserId {
    return _userId_isset;
}

- (void)setUserId:(int64_t )userId {
    _userId = userId;
    _userId_isset = YES;
}

- (void)clearUserId {
    _userId = 0L;
    _userId_isset = NO;
}

// token
- (BOOL)hasToken {
    return _token_isset;
}

- (void)setToken:(NSString *)token {
    _token = token;
    _token_isset = YES;
}

- (void)clearToken {
    _token = nil;
    _token_isset = NO;
}

// complete
- (BOOL)hasComplete {
    return _complete_isset;
}

- (void)setComplete:(BOOL )complete {
    _complete = complete;
    _complete_isset = YES;
}

- (void)clearComplete {
    _complete = NO;
    _complete_isset = NO;
}


- (PDMessageDescriptor *)descriptor {
    return [MRAuthResult typeDescriptor];
}

+ (PDMessageDescriptor *)typeDescriptor {
    return _MRAuthResultDescriptor;
}

+ (void)initialize {
    if (self != [MRAuthResult class]) {
        return;
    }

    _MRAuthResultDescriptor = [[PDMessageDescriptor alloc]
            initWithClass:[MRAuthResult class]
                     base:nil
       discriminatorValue:0
         subtypeSuppliers:@[]
                   fields:@[
    [[PDFieldDescriptor alloc] initWithName:@"userId" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors int64]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"token" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors string]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"complete" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors bool0]; } discriminator:NO],
                           ]];
}
@end


