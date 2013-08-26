//
//  NJLocationOperation.h
//  CLBackground
//
//  Created by Nathan Jones on 8/26/13.
//  Copyright (c) 2013 Nathan Jones. All rights reserved.
//

#import "NJBaseOperation.h"
#import <CoreLocation/CoreLocation.h>

@interface NJLocationOperation : NJBaseOperation <CLLocationManagerDelegate>

+ (void)fetchLocation;

@end
