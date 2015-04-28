//
//  CAAnimation+Bounce.h
//
//  Created by Anton Gaenko on 11.09.14.
//  Copyright (c) 2014 Futurelabs. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAAnimation (Bounce)

+(CAKeyframeAnimation*)bounceInForKeyPath:(NSString*)keyPath duration:(NSTimeInterval)duration;
+(CAKeyframeAnimation*)bounceOutForKeyPath:(NSString*)keyPath duration:(NSTimeInterval)duration;

@end
