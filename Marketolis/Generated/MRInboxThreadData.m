// Generated by Pdef Objective-C generator.

#import "MRInboxThreadData.h"
#import "MRMessageData.h"


@implementation MRInboxThreadData {
    BOOL _id_isset;
    BOOL _time_isset;
    BOOL _type_isset;
    BOOL _unread_isset;
    BOOL _postId_isset;
    BOOL _memberIds_isset;
    BOOL _lastMessage_isset;
}
static PDMessageDescriptor *_MRInboxThreadDataDescriptor;

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

// type
- (BOOL)hasType {
    return _type_isset;
}

- (void)setType:(MRInboxThreadType )type {
    _type = type;
    _type_isset = YES;
}

- (void)clearType {
    _type = 0;
    _type_isset = NO;
}

// unread
- (BOOL)hasUnread {
    return _unread_isset;
}

- (void)setUnread:(int32_t )unread {
    _unread = unread;
    _unread_isset = YES;
}

- (void)clearUnread {
    _unread = 0;
    _unread_isset = NO;
}

// postId
- (BOOL)hasPostId {
    return _postId_isset;
}

- (void)setPostId:(int64_t )postId {
    _postId = postId;
    _postId_isset = YES;
}

- (void)clearPostId {
    _postId = 0L;
    _postId_isset = NO;
}

// memberIds
- (BOOL)hasMemberIds {
    return _memberIds_isset;
}

- (void)setMemberIds:(NSSet *)memberIds {
    _memberIds = memberIds;
    _memberIds_isset = YES;
}

- (void)clearMemberIds {
    _memberIds = nil;
    _memberIds_isset = NO;
}

// lastMessage
- (BOOL)hasLastMessage {
    return _lastMessage_isset;
}

- (void)setLastMessage:(MRMessageData *)lastMessage {
    _lastMessage = lastMessage;
    _lastMessage_isset = YES;
}

- (void)clearLastMessage {
    _lastMessage = nil;
    _lastMessage_isset = NO;
}


- (PDMessageDescriptor *)descriptor {
    return [MRInboxThreadData typeDescriptor];
}

+ (PDMessageDescriptor *)typeDescriptor {
    return _MRInboxThreadDataDescriptor;
}

+ (void)initialize {
    if (self != [MRInboxThreadData class]) {
        return;
    }

    _MRInboxThreadDataDescriptor = [[PDMessageDescriptor alloc]
            initWithClass:[MRInboxThreadData class]
                     base:nil
       discriminatorValue:0
         subtypeSuppliers:@[]
                   fields:@[
    [[PDFieldDescriptor alloc] initWithName:@"id" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors int64]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"time" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors datetime]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"type" typeSupplier:^PDDataTypeDescriptor *() { return MRInboxThreadTypeDescriptor(); } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"unread" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors int32]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"postId" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors int64]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"memberIds" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors setWithElement:[PDDescriptors int64]]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"lastMessage" typeSupplier:^PDDataTypeDescriptor *() { return [MRMessageData typeDescriptor]; } discriminator:NO],
                           ]];
}
@end


