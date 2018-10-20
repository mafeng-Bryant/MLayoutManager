//
//  MLayoutManager.h
//  MLayoutManager_Example
//
//  Created by patpat on 2018/10/20.
//  Copyright © 2018年 1499603656@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLayoutInfo.h"
#import "MDrawItemCanvasView.h"

@interface MLayoutManager : NSObject

@property (nonatomic, strong) NSMutableArray *layoutInfos;

- (void)addlayoutInfo:(MLayoutInfo*)layoutInfo;

- (void)addlayoutInfo:(MLayoutInfo *)layoutInfo insert:(NSUInteger)index;

- (void)addlayoutInfos:(MLayoutInfo*)layoutInfo;

- (void)removelayoutInfoAtIndex:(NSInteger)index;

- (void)removelayoutInfo:(MLayoutInfo*)layoutInfo;

- (void)removeAlllayoutInfo;

- (NSInteger)layoutInfoCount;

- (MLayoutInfo *)layoutInfo:(NSInteger)index;

@end

