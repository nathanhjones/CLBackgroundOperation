//
//  NJBaseOperation.h
//  CLBackground
//
//  Created by Nathan Jones on 8/26/13.
//  Copyright (c) 2013 Nathan Jones. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NJBaseOperation : NSOperation <NSCopying>

@property(nonatomic,assign,readonly) BOOL isExecuting;
@property(nonatomic,assign,readonly) BOOL isFinished;
@property(nonatomic,assign,readonly) BOOL isCancelled;

- (void)enqueueOperation;

@end
