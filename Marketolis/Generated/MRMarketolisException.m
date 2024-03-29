// Generated by Pdef Objective-C generator.

#import "MRMarketolisException.h"
#import "MRAuthException.h"
#import "MRForbiddenException.h"
#import "MRNotFoundException.h"
#import "MRInvalidException.h"
#import "MRIncompleteProfileException.h"
#import "MRBusinessException.h"


@implementation MRMarketolisException {
    BOOL _code_isset;
    BOOL _msg_isset;
}
static PDMessageDescriptor *_MRMarketolisExceptionDescriptor;

// code
- (BOOL)hasCode {
    return _code_isset;
}

- (void)setCode:(MRMarketolisExceptionCode )code {
    _code = code;
    _code_isset = YES;
}

- (void)clearCode {
    _code = 0;
    _code_isset = NO;
}

// msg
- (BOOL)hasMsg {
    return _msg_isset;
}

- (void)setMsg:(NSString *)msg {
    _msg = msg;
    _msg_isset = YES;
}

- (void)clearMsg {
    _msg = nil;
    _msg_isset = NO;
}


- (PDMessageDescriptor *)descriptor {
    return [MRMarketolisException typeDescriptor];
}

+ (PDMessageDescriptor *)typeDescriptor {
    return _MRMarketolisExceptionDescriptor;
}

+ (void)initialize {
    if (self != [MRMarketolisException class]) {
        return;
    }

    _MRMarketolisExceptionDescriptor = [[PDMessageDescriptor alloc]
            initWithClass:[MRMarketolisException class]
                     base:nil
       discriminatorValue:0
         subtypeSuppliers:@[
                           ^PDMessageDescriptor *() { return [MRAuthException typeDescriptor]; },
                           ^PDMessageDescriptor *() { return [MRForbiddenException typeDescriptor]; },
                           ^PDMessageDescriptor *() { return [MRNotFoundException typeDescriptor]; },
                           ^PDMessageDescriptor *() { return [MRInvalidException typeDescriptor]; },
                           ^PDMessageDescriptor *() { return [MRIncompleteProfileException typeDescriptor]; },
                           ^PDMessageDescriptor *() { return [MRBusinessException typeDescriptor]; },
                          ]
                   fields:@[
    [[PDFieldDescriptor alloc] initWithName:@"code" typeSupplier:^PDDataTypeDescriptor *() { return MRMarketolisExceptionCodeDescriptor(); } discriminator:YES],
    [[PDFieldDescriptor alloc] initWithName:@"msg" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors string]; } discriminator:NO],
                           ]];
}
@end


