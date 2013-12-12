// Generated by Pdef Objective-C generator.

#import "MRImageData.h"
#import "MRImageUrls.h"


@implementation MRImageData {
    BOOL _id_isset;
}
static PDMessageDescriptor *_MRImageDataDescriptor;

// id
- (BOOL)hasId {
    return _id_isset;
}

- (void)setId:(int64_t )id {
    _id = id;
    _id_isset = YES;
}

- (void)clearId {
    _id = 0L;
    _id_isset = NO;
}


- (PDMessageDescriptor *)descriptor {
    return [MRImageData typeDescriptor];
}

+ (PDMessageDescriptor *)typeDescriptor {
    return _MRImageDataDescriptor;
}

+ (void)initialize {
    if (self != [MRImageData class]) {
        return;
    }

    _MRImageDataDescriptor = [[PDMessageDescriptor alloc]
            initWithClass:[MRImageData class]
                     base:[MRImageUrls typeDescriptor]
       discriminatorValue:0
         subtypeSuppliers:@[]
                   fields:@[
    [[PDFieldDescriptor alloc] initWithName:@"id" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors int64]; } discriminator:NO],
                           ]];
}
@end


