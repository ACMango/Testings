//
//  YMDrawPath.m
//  Testings
//
//  Created by dazhi on 2018/7/18.
//  Copyright © 2018年 gym. All rights reserved.
//

#import "YMDrawPath.h"

@implementation YMDrawPath

+ (instancetype)paintPathWithLineWidth:(CGFloat)width color:(UIColor *)color starPoint:(CGPoint)startP {
    
    YMDrawPath * path = [[self alloc] init];
    path.lineWidth = width;
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineCapRound; //终点处理
    [path moveToPoint:startP];
    return path;
}

@end
