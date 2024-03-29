// Generated by Pdef Objective-C generator.

#import "MRFavorites.h"
#import "MRPostData.h"
#import "MRPageQuery.h"


#pragma mark MRFavorites client
@implementation MRFavoritesClient

- (NSOperation *) addPostId:(int64_t )postId
        callback:(void (^)(id result, NSError *error))callback {
    PDInvocation *_invocation = [self
            captureInvocation:[self getMethodForName:@"add"]
                         args:@{
                                 @"postId" :@(postId),
                         }];
    return [self.handler handleInvocation:_invocation callback:callback];
}
- (NSOperation *) removePostId:(int64_t )postId
        callback:(void (^)(id result, NSError *error))callback {
    PDInvocation *_invocation = [self
            captureInvocation:[self getMethodForName:@"remove"]
                         args:@{
                                 @"postId" :@(postId),
                         }];
    return [self.handler handleInvocation:_invocation callback:callback];
}
- (NSOperation *) queryPage:(MRPageQuery *)page
        callback:(void (^)(id result, NSError *error))callback {
    PDInvocation *_invocation = [self
            captureInvocation:[self getMethodForName:@"query"]
                         args:@{
                                 @"page" :page,
                         }];
    return [self.handler handleInvocation:_invocation callback:callback];
}

- (PDMethodDescriptor *)getMethodForName:(NSString *)name {
    return [MRFavoritesDescriptor() getMethodForName:name];
}
@end


#pragma mark MRFavorites descriptor
static dispatch_once_t MRFavoritesOnce;
static PDInterfaceDescriptor *_MRFavoritesDescriptor;

PDInterfaceDescriptor *MRFavoritesDescriptor() {
    dispatch_once(&MRFavoritesOnce, ^() {
        _MRFavoritesDescriptor = [[PDInterfaceDescriptor alloc]
                initWithProtocol:@protocol(MRFavorites)
                             exc:nil
                         methods:@[
     [[PDMethodDescriptor alloc]
             initWithName:@"add"
           resultSupplier:^PDDescriptor *() { return [PDDescriptors void0]; }
                     args:@[
           [[PDArgumentDescriptor alloc] initWithName:@"postId" type: [PDDescriptors int64] post:NO query:NO],
                        ]
                     post:YES],
     [[PDMethodDescriptor alloc]
             initWithName:@"remove"
           resultSupplier:^PDDescriptor *() { return [PDDescriptors void0]; }
                     args:@[
           [[PDArgumentDescriptor alloc] initWithName:@"postId" type: [PDDescriptors int64] post:NO query:NO],
                        ]
                     post:YES],
     [[PDMethodDescriptor alloc]
             initWithName:@"query"
           resultSupplier:^PDDescriptor *() { return [PDDescriptors listWithElement:[MRPostData typeDescriptor]]; }
                     args:@[
           [[PDArgumentDescriptor alloc] initWithName:@"page" type: [MRPageQuery typeDescriptor] post:NO query:YES],
                        ]
                     post:NO],
                         ]];
    });
    return _MRFavoritesDescriptor;
}
