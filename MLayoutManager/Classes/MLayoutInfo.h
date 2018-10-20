//
//  MLayoutInfo.h
//  MLayoutManager_Example
//
//  Created by patpat on 2018/10/20.
//  Copyright © 2018年 1499603656@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDrawItem.h"
#import "MDrawItemText.h"
#import "MDrawItemImage.h"
#import "MDrawItemEmotion.h"
#import "MDrawItemURL.h"
#import "MDrawItemAttatch.h"
#import "MDrawItemCoreText.h"
#import "MDrawItemView.h"

@interface MLayoutInfo : NSObject
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, assign) CGRect rect;
@property (nonatomic, strong) id info;

//Public methords
- (void)addItem:(MDrawItem*)item;
- (void)addItems:(NSArray *)items;
- (void)removeAllItems;
- (void)removeItem:(MDrawItem*)item;
- (MDrawItem *)itemWithTag:(NSInteger)tag;
- (void)increaseHeight:(CGFloat)height;
- (void)setHeight:(CGFloat)height;


@end

