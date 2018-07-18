//
//  YMDrawView.h
//  Testings
//
//  Created by dazhi on 2018/7/18.
//  Copyright © 2018年 gym. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMDrawView : UIView

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, strong) UIImage *image;

/**
 *  撤销的线条数组
 */
@property (nonatomic, strong)NSMutableArray * canceledLines;
/**
 *  线条数组
 */
@property (nonatomic, strong)NSMutableArray * lines;

/**
 *  清屏
 */
- (void)clearScreen;

/**
 *  撤销
 */
- (void)undo;

/**
 *  恢复
 */
- (void)redo;

@end
