//
//  NJQueueManager.h
//  CLBackground
//
//  Created by Nathan Jones on 8/26/13.
//  Copyright (c) 2013 Nathan Jones. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NJQueueManager : NSObject

@property(nonatomic,strong) NSOperationQueue *queue;

+ (NJQueueManager*)queueManager;

- (void)addOperationToQueue:(NSOperation*)operation;

@end
