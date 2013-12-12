// Generated by Pdef Objective-C generator.

#import "MRMessageData.h"


@implementation MRMessageData {
    BOOL _id_isset;
    BOOL _userId_isset;
    BOOL _dialogId_isset;
    BOOL _time_isset;
    BOOL _text_isset;
}
static PDMessageDescriptor *_MRMessageDataDescriptor;

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

// dialogId
- (BOOL)hasDialogId {
    return _dialogId_isset;
}

- (void)setDialogId:(int64_t )dialogId {
    _dialogId = dialogId;
    _dialogId_isset = YES;
}

- (void)clearDialogId {
    _dialogId = 0L;
    _dialogId_isset = NO;
}

// time
- (BOOL)hasTime {
    return _time_isset;
}

- (void)setTime:(NSDate *)time {
    _time = time;
    _time_isset = YES;
}

- (void)clearTime {
    _time = nil;
    _time_isset = NO;
}

// text
- (BOOL)hasText {
    return _text_isset;
}

- (void)setText:(NSString *)text {
    _text = text;
    _text_isset = YES;
}

- (void)clearText {
    _text = nil;
    _text_isset = NO;
}


- (PDMessageDescriptor *)descriptor {
    return [MRMessageData typeDescriptor];
}

+ (PDMessageDescriptor *)typeDescriptor {
    return _MRMessageDataDescriptor;
}

+ (void)initialize {
    if (self != [MRMessageData class]) {
        return;
    }

    _MRMessageDataDescriptor = [[PDMessageDescriptor alloc]
            initWithClass:[MRMessageData class]
                     base:nil
       discriminatorValue:0
         subtypeSuppliers:@[]
                   fields:@[
    [[PDFieldDescriptor alloc] initWithName:@"id" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors int64]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"userId" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors int64]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"dialogId" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors int64]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"time" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors datetime]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"text" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors string]; } discriminator:NO],
                           ]];
}
@end


