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
        [self addSubview:self.backgroundIV];
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CGPoint startP = [self pointWithTouches:touches];
    if ([event allTouches].count == 1) { // 只有一个手指
        YMDrawPath *path = [YMDrawPath paintPathWithLineWidth:_width color:nil starPoint:startP];
        _path = path;
        
        CAShapeLayer *slayer = [CAShapeLayer layer];
        slayer.path = path.CGPath;
        slayer.backgroundColor = [UIColor clearColor].CGColor;
        slayer.fillColor = [UIColor clearColor].CGColor;
        slayer.lineCap = kCALineCapRound;
        slayer.lineJoin = kCALineJoinRound;
        slayer.strokeColor = [UIColor blackColor].CGColor;
        slayer.lineWidth = path.lineWidth;
        [self.layer addSublayer:slayer];
        _slayer = slayer;
        [[self mutableArrayValueForKey:@"canceledLines"] removeAllObjects];
        [[self mutableArrayValueForKey:@"lines"] addObject:_slayer];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 获取移动点
    CGPoint moveP = [self pointWithTouches:touches];
    
    if ([event allTouches].count > 1){
        
        [self.superview touchesMoved:touches withEvent:event];
        
    }else if ([event allTouches].count == 1) {
        
        [_path addLineToPoint:moveP];
        
        _slayer.path = _path.CGPath;
        
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if ([event allTouches].count > 1){
        [self.superview touchesMoved:touches withEvent:event];
    }
}

/**
 *  画线
 */
- (void)drawLine{
    
    [self.layer addSublayer:self.lines.lastObject];
    
}
/**
 *  清屏
 */
- (void)clearScreen
{
    
    if (!self.lines.count) return ;
    
    [self.lines makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    [[self mutableArrayValueForKey:@"lines"] removeAllObjects];
    [[self mutableArrayValueForKey:@"canceledLines"] removeAllObjects];
    
}

/**
 *  撤销
 */
- (void)undo
{
    //当前屏幕已经清空，就不能撤销了
    if (!self.lines.count) return;
    [[self mutableArrayValueForKey:@"canceledLines"] addObject:self.lines.lastObject];
    [self.lines.lastObject removeFromSuperlayer];
    [[self mutableArrayValueForKey:@"lines"] removeLastObject];
    
}


/**
 *  恢复
 */
- (void)redo
{
    //当没有做过撤销操作，就不能恢复了
    if (!self.canceledLines.count) return;
    [[self mutableArrayValueForKey:@"lines"] addObject:self.canceledLines.lastObject];
    [[self mutableArrayValueForKey:@"canceledLines"] removeLastObject];
    [self drawLine];
    
}


#pragma mark - getter
- (UIImageView *)backgroundIV {
    
    if (_backgroundIV == nil) {
        _backgroundIV = [[UIImageView alloc] initWithFrame:self.bounds];
        _backgroundIV.userInteractionEnabled = YES;
    }
    return _backgroundIV;
}

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
