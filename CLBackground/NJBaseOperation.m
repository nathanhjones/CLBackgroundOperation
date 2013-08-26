//
//  NJBaseOperation.m
//  CLBackground
//
//  Created by Nathan Jones on 8/26/13.
//  Copyright (c) 2013 Nathan Jones. All rights reserved.
//

#import "NJBaseOperation.h"
#import "NJQueueManager.h"

@interface NJBaseOperation ()

@property(nonatomic,assign,readwrite) BOOL isExecuting;
@property(nonatomic,assign,readwrite) BOOL isFinished;
@property(nonatomic,assign,readwrite) BOOL isCancelled;

@end

@implementation NJBaseOperation

- (void)start {
    if (self.isCancelled) {
        return;
    }
    
    self.isExecuting = YES;
    [self main];
}

- (void)main {
    NSAssert(YES, @"You must override this method.");
}

- (void)cancel {
    self.isCancelled = YES;
}

#pragma mark - Setters

- (void)setIsExecuting:(BOOL)isExecuting {
    _isExecuting = isExecuting;
    if (_isExecuting == YES) {
        self.isFinished = NO;
    }
}

- (void)setIsFinished:(BOOL)isFinished {
    _isFinished = isFinished;
    if (_isFinished == YES) {
        self.isExecuting = NO;
    }
}

- (void)setIsCancelled:(BOOL)isCancelled {
    _isCancelled = isCancelled;
    if (_isCancelled == YES) {
        self.isFinished = YES;
    }
}

- (void)enqueueOperation {
    [[NJQueueManager queueManager] addOperationToQueue:self];
}

#pragma mark - Concurrency

- (BOOL)isConcurrent {
    // used for asynchronous requests
    // can be overridden if there is a need for synchronous calls
    return YES;
}

#pragma mark - KVO

// http://stackoverflow.com/questions/3573236/
+ (BOOL) automaticallyNotifiesObserversForKey:(NSString *)key {
    return YES;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    NJBaseOperation *copy = [[[self class] allocWithZone:zone] init];
    copy.queuePriority = self.queuePriority;
    return copy;
}

@end
