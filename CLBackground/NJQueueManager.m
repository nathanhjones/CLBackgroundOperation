//
//  NJQueueManager.m
//  CLBackground
//
//  Created by Nathan Jones on 8/26/13.
//  Copyright (c) 2013 Nathan Jones. All rights reserved.
//

#import "NJQueueManager.h"

@implementation NJQueueManager

static NJQueueManager *_instance = nil;

- (id)init {
    self = [super init];
    
    if (self) {
        self.queue = [[NSOperationQueue alloc] init];
        [self.queue setMaxConcurrentOperationCount:10];
    }
    
    return self;
}

+ (NJQueueManager*)queueManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

- (void)addOperationToQueue:(NSOperation*)operation {
    [self.queue addOperation:operation];
}

@end
