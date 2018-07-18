//
//  YMDrawScrollView.m
//  Testings
//
//  Created by dazhi on 2018/7/18.
//  Copyright © 2018年 gym. All rights reserved.
//

#import "YMDrawScrollView.h"

@implementation YMDrawScrollView

- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
    if ([event allTouches].count == 1) {
        return YES;
    }
    return NO;
}

@end
