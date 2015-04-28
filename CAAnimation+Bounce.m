//
//  CAAnimation+Bounce.m
//
//  Created by Anton Gaenko on 11.09.14.
//  Copyright (c) 2014 Futurelabs. All rights reserved.
//

#import "CAAnimation+Bounce.h"

@implementation CAAnimation (Bounce)

+(CAKeyframeAnimation*)bounceInForKeyPath:(NSString*)keyPath duration:(NSTimeInterval)duration
{
  CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
  animation.duration = duration;
  animation.values = @[@(0.01), @(1.2), @(0.9), @(1)];
  animation.keyTimes = @[@(0), @(0.4), @(0.6), @(1)];
  animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
  return animation;
}

+(CAKeyframeAnimation*)bounceOutForKeyPath:(NSString*)keyPath duration:(NSTimeInterval)duration
{
  CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
  animation.duration = duration;
  animation.values = @[@(1), @(1.2), @(0.01)];
  animation.keyTimes = @[@(0), @(0.4), @(1)];
  animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
  return animation;
}


@end
