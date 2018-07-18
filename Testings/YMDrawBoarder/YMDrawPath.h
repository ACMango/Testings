//
//  YMDrawPath.h
//  Testings
//
//  Created by dazhi on 2018/7/18.
//  Copyright © 2018年 gym. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMDrawPath : UIBezierPath

+ (instancetype)paintPathWithLineWidth:(CGFloat)width color:(UIColor *)color starPoint:(CGPoint)startP;

@end
