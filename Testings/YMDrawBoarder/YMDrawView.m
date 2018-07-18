//
//  YMDrawView.m
//  Testings
//
//  Created by dazhi on 2018/7/18.
//  Copyright © 2018年 gym. All rights reserved.
//

#import "YMDrawView.h"
#import "YMDrawPath.h"

@interface YMDrawView ()

@property (nonatomic, strong) YMDrawPath *path;
@property (nonatomic, strong) CAShapeLayer *slayer;
@property (nonatomic, strong) UIImageView *backgroundIV;

@end

@implementation YMDrawView

#pragma mark -
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        _width = 3;
    }
    return self;
}

#pragma mark - Touch
// 根据touches集合获取对应的触摸点
- (CGPoint)pointWithTouches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    
    return [touch locationInView:self];
}


#pragma mark - getter
- (NSMutableArray *)lines {
    
    if (_lines == nil) {
        _lines = [NSMutableArray array];
    }
    return _lines;
}

- (NSMutableArray *)canceledLines {
    
    if (_canceledLines == nil) {
        _canceledLines = [NSMutableArray array];
    }
    return _canceledLines;
}

@end
