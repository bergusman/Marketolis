// Generated by Pdef Objective-C generator.

#import "MRNotFoundException.h"
#import "MRMarketolisException.h"


@implementation MRNotFoundException {
}
static PDMessageDescriptor *_MRNotFoundExceptionDescriptor;

- (id) init {
    if (self = [super init]) {
        self.code = MRMarketolisExceptionCode_NOT_FOUND ;
    }
    return self;
}


- (PDMessageDescriptor *)descriptor {
    return [MRNotFoundException typeDescriptor];
}

+ (PDMessageDescriptor *)typeDescriptor {
    return _MRNotFoundExceptionDescriptor;
}

+ (void)initialize {
    if (self != [MRNotFoundException class]) {
        return;
    }

    _MRNotFoundExceptionDescriptor = [[PDMessageDescriptor alloc]
            initWithClass:[MRNotFoundException class]
                     base:[MRMarketolisException typeDescriptor]
       discriminatorValue:MRMarketolisExceptionCode_NOT_FOUND 
         subtypeSuppliers:@[]
                   fields:@[
                           ]];
}
@end


