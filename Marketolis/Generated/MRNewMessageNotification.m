// Generated by Pdef Objective-C generator.

#import "MRNewMessageNotification.h"
#import "MRNotification.h"


@implementation MRNewMessageNotification {
    BOOL _userId_isset;
    BOOL _threadId_isset;
    BOOL _messageId_isset;
    BOOL _locUserName_isset;
    BOOL _locText_isset;
}
static PDMessageDescriptor *_MRNewMessageNotificationDescriptor;

- (id) init {
    if (self = [super init]) {
        self.type = MRNotificationType_NEW_MESSAGE ;
    }
    return self;
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

// threadId
- (BOOL)hasThreadId {
    return _threadId_isset;
}

- (void)setThreadId:(int64_t )threadId {
    _threadId = threadId;
    _threadId_isset = YES;
}

- (void)clearThreadId {
    _threadId = 0L;
    _threadId_isset = NO;
}

// messageId
- (BOOL)hasMessageId {
    return _messageId_isset;
}

- (void)setMessageId:(int64_t )messageId {
    _messageId = messageId;
    _messageId_isset = YES;
}

- (void)clearMessageId {
    _messageId = 0L;
    _messageId_isset = NO;
}

// locUserName
- (BOOL)hasLocUserName {
    return _locUserName_isset;
}

- (void)setLocUserName:(NSString *)locUserName {
    _locUserName = locUserName;
    _locUserName_isset = YES;
}

- (void)clearLocUserName {
    _locUserName = nil;
    _locUserName_isset = NO;
}

// locText
- (BOOL)hasLocText {
    return _locText_isset;
}

- (void)setLocText:(NSString *)locText {
    _locText = locText;
    _locText_isset = YES;
}

- (void)clearLocText {
    _locText = nil;
    _locText_isset = NO;
}


- (PDMessageDescriptor *)descriptor {
    return [MRNewMessageNotification typeDescriptor];
}

+ (PDMessageDescriptor *)typeDescriptor {
    return _MRNewMessageNotificationDescriptor;
}

+ (void)initialize {
    if (self != [MRNewMessageNotification class]) {
        return;
    }

    _MRNewMessageNotificationDescriptor = [[PDMessageDescriptor alloc]
            initWithClass:[MRNewMessageNotification class]
                     base:[MRNotification typeDescriptor]
       discriminatorValue:MRNotificationType_NEW_MESSAGE 
         subtypeSuppliers:@[]
                   fields:@[
    [[PDFieldDescriptor alloc] initWithName:@"userId" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors int64]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"threadId" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors int64]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"messageId" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors int64]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"locUserName" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors string]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"locText" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors string]; } discriminator:NO],
                           ]];
}
@end


