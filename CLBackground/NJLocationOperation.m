//
//  NJLocationOperation.m
//  CLBackground
//
//  Created by Nathan Jones on 8/26/13.
//  Copyright (c) 2013 Nathan Jones. All rights reserved.
//

#import "NJLocationOperation.h"

@interface NJLocationOperation () {
    CLLocationManager *_locationManager;
}

@property(nonatomic,assign,readwrite) BOOL isFinished;

@end

@implementation NJLocationOperation

+ (void)fetchLocation {
    NJLocationOperation *op = [[NJLocationOperation alloc] init];
    [op enqueueOperation];
}

- (void)main {
    
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [_locationManager startUpdatingLocation];
    }
    
    while(!self.isFinished) {
        [[NSRunLoop currentRunLoop] runMode:NSRunLoopCommonModes
                                 beforeDate:[NSDate distantFuture]];
    }
}

- (void)dealloc {
    NSLog(@"## Location op being deallocated");
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    NSLog(@"** Did Update Location: %@", [locations lastObject]);
    [_locationManager stopUpdatingLocation];
    
    // do something here that takes some length of time to complete
    for (int i=0; i<10000; i++) {
        if ((i % 10) == 0) {
            NSLog(@"Loop %i", i);
        }
    }
    
    self.isFinished = YES;
}

@end
