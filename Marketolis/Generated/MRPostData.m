// Generated by Pdef Objective-C generator.

#import "MRPostData.h"
#import "MREditablePostData.h"
#import "MRLocation.h"


@implementation MRPostData {
    BOOL _id_isset;
    BOOL _userId_isset;
    BOOL _createdAt_isset;
    BOOL _state_isset;
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

- (void)setCreatedAt:(int64_t )createdAt {
    _createdAt = createdAt;
    _createdAt_isset = YES;
}

- (void)clearCreatedAt {
    _createdAt = 0L;
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
    [[PDFieldDescriptor alloc] initWithName:@"createdAt" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors int64]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"state" typeSupplier:^PDDataTypeDescriptor *() { return MRPostStateDescriptor(); } discriminator:NO],
                           ]];
}
@end

