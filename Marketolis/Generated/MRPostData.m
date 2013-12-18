// Generated by Pdef Objective-C generator.

#import "MRPostData.h"
#import "MREditablePostData.h"
#import "MRLocation.h"
#import "MRImageData.h"
#import "MRImageData.h"


@implementation MRPostData {
    BOOL _id_isset;
    BOOL _userId_isset;
    BOOL _createdAt_isset;
    BOOL _state_isset;
    BOOL _titleImage_isset;
    BOOL _images_isset;
}
static PDMessageDescriptor *_MRPostDataDescriptor;

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

// createdAt
- (BOOL)hasCreatedAt {
    return _createdAt_isset;
}

- (void)setCreatedAt:(NSDate *)createdAt {
    _createdAt = createdAt;
    _createdAt_isset = YES;
}

- (void)clearCreatedAt {
    _createdAt = nil;
    _createdAt_isset = NO;
}

// state
- (BOOL)hasState {
    return _state_isset;
}

- (void)setState:(MRPostState )state {
    _state = state;
    _state_isset = YES;
}

- (void)clearState {
    _state = 0;
    _state_isset = NO;
}

// titleImage
- (BOOL)hasTitleImage {
    return _titleImage_isset;
}

- (void)setTitleImage:(MRImageData *)titleImage {
    _titleImage = titleImage;
    _titleImage_isset = YES;
}

- (void)clearTitleImage {
    _titleImage = nil;
    _titleImage_isset = NO;
}

// images
- (BOOL)hasImages {
    return _images_isset;
}

- (void)setImages:(NSArray *)images {
    _images = images;
    _images_isset = YES;
}

- (void)clearImages {
    _images = nil;
    _images_isset = NO;
}


- (PDMessageDescriptor *)descriptor {
    return [MRPostData typeDescriptor];
}

+ (PDMessageDescriptor *)typeDescriptor {
    return _MRPostDataDescriptor;
}

+ (void)initialize {
    if (self != [MRPostData class]) {
        return;
    }

    _MRPostDataDescriptor = [[PDMessageDescriptor alloc]
            initWithClass:[MRPostData class]
                     base:[MREditablePostData typeDescriptor]
       discriminatorValue:0
         subtypeSuppliers:@[]
                   fields:@[
    [[PDFieldDescriptor alloc] initWithName:@"id" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors int64]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"userId" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors int64]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"createdAt" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors datetime]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"state" typeSupplier:^PDDataTypeDescriptor *() { return MRPostStateDescriptor(); } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"titleImage" typeSupplier:^PDDataTypeDescriptor *() { return [MRImageData typeDescriptor]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"images" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors listWithElement:[MRImageData typeDescriptor]]; } discriminator:NO],
                           ]];
}
@end


