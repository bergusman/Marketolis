// Generated by Pdef Objective-C generator.

#import "MRMessages.h"
#import "MRMessageData.h"
#import "MRMessageData.h"
#import "MRPageQuery.h"
#import "MRDialogListData.h"
#import "MRDialogListData.h"
#import "MRDialogData.h"
#import "MRDialogData.h"
#import "MRPageQuery.h"
#import "MRMessageData.h"


#pragma mark MRMessages client
@implementation MRMessagesClient

- (NSOperation *) sendDialogId:(int64_t )dialogId
        text:(NSString *)text
        callback:(void (^)(id result, NSError *error))callback {
    PDInvocation *_invocation = [self
            captureInvocation:[self getMethodForName:@"send"]
                         args:@{
                                 @"dialogId" :@(dialogId),
                                 @"text" :text,
                         }];
    return [self.handler handleInvocation:_invocation callback:callback];
}
- (NSOperation *) messagesDialogId:(int64_t )dialogId
        page:(MRPageQuery *)page
        callback:(void (^)(id result, NSError *error))callback {
    PDInvocation *_invocation = [self
            captureInvocation:[self getMethodForName:@"messages"]
                         args:@{
                                 @"dialogId" :@(dialogId),
                                 @"page" :page,
                         }];
    return [self.handler handleInvocation:_invocation callback:callback];
}
- (NSOperation *) dialogListType:(MRDialogListType )type
        callback:(void (^)(id result, NSError *error))callback {
    PDInvocation *_invocation = [self
            captureInvocation:[self getMethodForName:@"dialogList"]
                         args:@{
                                 @"type" :@(type),
                         }];
    return [self.handler handleInvocation:_invocation callback:callback];
}
- (NSOperation *) dialogListsCallback:(void (^)(id result, NSError *error))callback {
    PDInvocation *_invocation = [self
            captureInvocation:[self getMethodForName:@"dialogLists"]
                         args:@{
                         }];
    return [self.handler handleInvocation:_invocation callback:callback];
}
- (NSOperation *) dialogId:(int64_t )id
        callback:(void (^)(id result, NSError *error))callback {
    PDInvocation *_invocation = [self
            captureInvocation:[self getMethodForName:@"dialog"]
                         args:@{
                                 @"id" :@(id),
                         }];
    return [self.handler handleInvocation:_invocation callback:callback];
}
- (NSOperation *) dialogsType:(MRDialogListType )type
        page:(MRPageQuery *)page
        callback:(void (^)(id result, NSError *error))callback {
    PDInvocation *_invocation = [self
            captureInvocation:[self getMethodForName:@"dialogs"]
                         args:@{
                                 @"type" :@(type),
                                 @"page" :page,
                         }];
    return [self.handler handleInvocation:_invocation callback:callback];
}
- (NSOperation *) markDialogAsReadDialogId:(int64_t )dialogId
        callback:(void (^)(id result, NSError *error))callback {
    PDInvocation *_invocation = [self
            captureInvocation:[self getMethodForName:@"markDialogAsRead"]
                         args:@{
                                 @"dialogId" :@(dialogId),
                         }];
    return [self.handler handleInvocation:_invocation callback:callback];
}
- (NSOperation *) deleteDialogDialogId:(int64_t )dialogId
        callback:(void (^)(id result, NSError *error))callback {
    PDInvocation *_invocation = [self
            captureInvocation:[self getMethodForName:@"deleteDialog"]
                         args:@{
                                 @"dialogId" :@(dialogId),
                         }];
    return [self.handler handleInvocation:_invocation callback:callback];
}
- (NSOperation *) sendPostMessagePostId:(int64_t )postId
        text:(NSString *)text
        callback:(void (^)(id result, NSError *error))callback {
    PDInvocation *_invocation = [self
            captureInvocation:[self getMethodForName:@"sendPostMessage"]
                         args:@{
                                 @"postId" :@(postId),
                                 @"text" :text,
                         }];
    return [self.handler handleInvocation:_invocation callback:callback];
}

- (PDMethodDescriptor *)getMethodForName:(NSString *)name {
    return [MRMessagesDescriptor() getMethodForName:name];
}
@end


#pragma mark MRMessages descriptor
static dispatch_once_t MRMessagesOnce;
static PDInterfaceDescriptor *_MRMessagesDescriptor;

PDInterfaceDescriptor *MRMessagesDescriptor() {
    dispatch_once(&MRMessagesOnce, ^() {
        _MRMessagesDescriptor = [[PDInterfaceDescriptor alloc]
                initWithProtocol:@protocol(MRMessages)
                             exc:nil
                         methods:@[
     [[PDMethodDescriptor alloc]
             initWithName:@"send"
           resultSupplier:^PDDescriptor *() { return [MRMessageData typeDescriptor]; }
                     args:@[
           [[PDArgumentDescriptor alloc] initWithName:@"dialogId" type: [PDDescriptors int64] post:NO query:NO],
           [[PDArgumentDescriptor alloc] initWithName:@"text" type: [PDDescriptors string] post:YES query:NO],
                        ]
                     post:YES],
     [[PDMethodDescriptor alloc]
             initWithName:@"messages"
           resultSupplier:^PDDescriptor *() { return [PDDescriptors listWithElement:[MRMessageData typeDescriptor]]; }
                     args:@[
           [[PDArgumentDescriptor alloc] initWithName:@"dialogId" type: [PDDescriptors int64] post:NO query:NO],
           [[PDArgumentDescriptor alloc] initWithName:@"page" type: [MRPageQuery typeDescriptor] post:NO query:YES],
                        ]
                     post:NO],
     [[PDMethodDescriptor alloc]
             initWithName:@"dialogList"
           resultSupplier:^PDDescriptor *() { return [MRDialogListData typeDescriptor]; }
                     args:@[
           [[PDArgumentDescriptor alloc] initWithName:@"type" type: MRDialogListTypeDescriptor() post:NO query:NO],
                        ]
                     post:NO],
     [[PDMethodDescriptor alloc]
             initWithName:@"dialogLists"
           resultSupplier:^PDDescriptor *() { return [PDDescriptors listWithElement:[MRDialogListData typeDescriptor]]; }
                     args:@[]
                     post:NO],
     [[PDMethodDescriptor alloc]
             initWithName:@"dialog"
           resultSupplier:^PDDescriptor *() { return [MRDialogData typeDescriptor]; }
                     args:@[
           [[PDArgumentDescriptor alloc] initWithName:@"id" type: [PDDescriptors int64] post:NO query:NO],
                        ]
                     post:NO],
     [[PDMethodDescriptor alloc]
             initWithName:@"dialogs"
           resultSupplier:^PDDescriptor *() { return [PDDescriptors listWithElement:[MRDialogData typeDescriptor]]; }
                     args:@[
           [[PDArgumentDescriptor alloc] initWithName:@"type" type: MRDialogListTypeDescriptor() post:NO query:YES],
           [[PDArgumentDescriptor alloc] initWithName:@"page" type: [MRPageQuery typeDescriptor] post:NO query:YES],
                        ]
                     post:NO],
     [[PDMethodDescriptor alloc]
             initWithName:@"markDialogAsRead"
           resultSupplier:^PDDescriptor *() { return [PDDescriptors void0]; }
                     args:@[
           [[PDArgumentDescriptor alloc] initWithName:@"dialogId" type: [PDDescriptors int64] post:NO query:NO],
                        ]
                     post:YES],
     [[PDMethodDescriptor alloc]
             initWithName:@"deleteDialog"
           resultSupplier:^PDDescriptor *() { return [PDDescriptors void0]; }
                     args:@[
           [[PDArgumentDescriptor alloc] initWithName:@"dialogId" type: [PDDescriptors int64] post:NO query:NO],
                        ]
                     post:YES],
     [[PDMethodDescriptor alloc]
             initWithName:@"sendPostMessage"
           resultSupplier:^PDDescriptor *() { return [MRMessageData typeDescriptor]; }
                     args:@[
           [[PDArgumentDescriptor alloc] initWithName:@"postId" type: [PDDescriptors int64] post:NO query:NO],
           [[PDArgumentDescriptor alloc] initWithName:@"text" type: [PDDescriptors string] post:YES query:NO],
                        ]
                     post:YES],
                         ]];
    });
    return _MRMessagesDescriptor;
}