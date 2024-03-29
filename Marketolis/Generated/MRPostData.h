// Generated by Pdef Objective-C generator.

#import <Foundation/Foundation.h>
#import "PDef.h"
#import "MREditablePostData.h"
@class MRLocation;
#import "MRPostState.h"
@class MRImageData;
@class MRImageData;


@interface MRPostData : MREditablePostData
@property (nonatomic) int64_t id;
@property (nonatomic) int64_t userId;
@property (nonatomic) NSDate *createdAt;
@property (nonatomic) MRPostState state;
@property (nonatomic) MRImageData *titleImage;
@property (nonatomic) NSArray *images;

- (BOOL) hasId;
- (void) clearId;

- (BOOL) hasUserId;
- (void) clearUserId;

- (BOOL) hasCreatedAt;
- (void) clearCreatedAt;

- (BOOL) hasState;
- (void) clearState;

- (BOOL) hasTitleImage;
- (void) clearTitleImage;

- (BOOL) hasImages;
- (void) clearImages;


+ (PDMessageDescriptor *)typeDescriptor;
@end


