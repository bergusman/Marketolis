// Generated by Pdef Objective-C generator.

#import <Foundation/Foundation.h>
#import "PDef.h"


@interface MRLocation : PDMessage
@property (nonatomic) double lat;
@property (nonatomic) double lon;

- (BOOL) hasLat;
- (void) clearLat;

- (BOOL) hasLon;
- (void) clearLon;


+ (PDMessageDescriptor *)typeDescriptor;
@end

