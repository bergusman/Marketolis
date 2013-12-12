// Generated by Pdef Objective-C generator.

#import "MRLocation.h"


@implementation MRLocation {
    BOOL _lat_isset;
    BOOL _lon_isset;
}
static PDMessageDescriptor *_MRLocationDescriptor;

// lat
- (BOOL)hasLat {
    return _lat_isset;
}

- (void)setLat:(double )lat {
    _lat = lat;
    _lat_isset = YES;
}

- (void)clearLat {
    _lat = 0.0;
    _lat_isset = NO;
}

// lon
- (BOOL)hasLon {
    return _lon_isset;
}

- (void)setLon:(double )lon {
    _lon = lon;
    _lon_isset = YES;
}

- (void)clearLon {
    _lon = 0.0;
    _lon_isset = NO;
}


- (PDMessageDescriptor *)descriptor {
    return [MRLocation typeDescriptor];
}

+ (PDMessageDescriptor *)typeDescriptor {
    return _MRLocationDescriptor;
}

+ (void)initialize {
    if (self != [MRLocation class]) {
        return;
    }

    _MRLocationDescriptor = [[PDMessageDescriptor alloc]
            initWithClass:[MRLocation class]
                     base:nil
       discriminatorValue:0
         subtypeSuppliers:@[]
                   fields:@[
    [[PDFieldDescriptor alloc] initWithName:@"lat" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors double0]; } discriminator:NO],
    [[PDFieldDescriptor alloc] initWithName:@"lon" typeSupplier:^PDDataTypeDescriptor *() { return [PDDescriptors double0]; } discriminator:NO],
                           ]];
}
@end


