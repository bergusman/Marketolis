// Generated by Pdef Objective-C generator.

#import "MRIncompleteProfileException.h"
#import "MRMarketolisException.h"


@implementation MRIncompleteProfileException {
}
static PDMessageDescriptor *_MRIncompleteProfileExceptionDescriptor;

- (id) init {
    if (self = [super init]) {
        self.code = MRMarketolisExceptionCode_INCOMPLETE_PROFILE ;
    }
    return self;
}


- (PDMessageDescriptor *)descriptor {
    return [MRIncompleteProfileException typeDescriptor];
}

+ (PDMessageDescriptor *)typeDescriptor {
    return _MRIncompleteProfileExceptionDescriptor;
}

+ (void)initialize {
    if (self != [MRIncompleteProfileException class]) {
        return;
    }

    _MRIncompleteProfileExceptionDescriptor = [[PDMessageDescriptor alloc]
            initWithClass:[MRIncompleteProfileException class]
                     base:[MRMarketolisException typeDescriptor]
       discriminatorValue:MRMarketolisExceptionCode_INCOMPLETE_PROFILE 
         subtypeSuppliers:@[]
                   fields:@[
                           ]];
}
@end

