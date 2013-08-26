//
//  ViewController.m
//  CLBackground
//
//  Created by Nathan Jones on 8/25/13.
//  Copyright (c) 2013 Nathan Jones. All rights reserved.
//

#import "ViewController.h"
#import "NJQueueManager.h"
#import "NJLocationOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // listen for changes to the queue - just for testing purposes
    [[NJQueueManager queueManager].queue addObserver:self
                                          forKeyPath:@"operationCount"
                                             options:NSKeyValueObservingOptionNew
                                             context:NULL];
}

- (IBAction)backgroundLocationButtonTapped:(id)sender {
    // fire off our location operation
    [NJLocationOperation fetchLocation];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([object isEqual:[NJQueueManager queueManager].queue]) {
        NSLog(@"## Queue has %i operation(s) in it.", [NJQueueManager queueManager].queue.operationCount);
    }
}

@end
