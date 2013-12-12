// Generated by Pdef Objective-C generator.

#import <Foundation/Foundation.h>
#import "PDef.h"
@class MRMessageData;
@class MRMessageData;
@class MRPageQuery;
@class MRDialogListData;
#import "MRDialogListType.h"
@class MRDialogListData;
@class MRDialogData;
@class MRDialogData;
#import "MRDialogListType.h"
@class MRPageQuery;
@class MRMessageData;


@protocol MRMessages
/** Sends a message to a dialog. */
- (NSOperation *) sendDialogId:(int64_t )dialogId
        text:(NSString *)text
            callback:(void (^)(id result, NSError *error))callback;

/** Returns a list of messages. */
- (NSOperation *) messagesDialogId:(int64_t )dialogId
        page:(MRPageQuery *)page
            callback:(void (^)(id result, NSError *error))callback;

/** Returns a user dialog list by its type. */
- (NSOperation *) dialogListType:(MRDialogListType )type
            callback:(void (^)(id result, NSError *error))callback;

/** Returns all user dialog lists. */
- (NSOperation *) dialogListsCallback:(void (^)(id result, NSError *error))response;

/** Returns a dialog by id. */
- (NSOperation *) dialogId:(int64_t )id
            callback:(void (^)(id result, NSError *error))callback;

/** Returns a user dialogs in a list. */
- (NSOperation *) dialogsType:(MRDialogListType )type
        page:(MRPageQuery *)page
            callback:(void (^)(id result, NSError *error))callback;

/** Mark a dialog as read. */
- (NSOperation *) markDialogAsReadDialogId:(int64_t )dialogId
            callback:(void (^)(id result, NSError *error))callback;

/** Delete a dialog by its id. */
- (NSOperation *) deleteDialogDialogId:(int64_t )dialogId
            callback:(void (^)(id result, NSError *error))callback;

/** Sends a message to a post (to a post author). */
- (NSOperation *) sendPostMessagePostId:(int64_t )postId
        text:(NSString *)text
            callback:(void (^)(id result, NSError *error))callback;

@end

@interface MRMessagesClient : PDInterface <MRMessages>
@end
PDInterfaceDescriptor *MRMessagesDescriptor();