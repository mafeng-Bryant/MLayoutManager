//
//  MLayoutInfo.m
//  MLayoutManager_Example
//
//  Created by patpat on 2018/10/20.
//  Copyright © 2018年 1499603656@qq.com. All rights reserved.
//

#import "MLayoutInfo.h"

@implementation MLayoutInfo

- (id)init
{
    self =[super init];
    if (self){
        self.rect = CGRectZero;
        self.items = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)addItem:(MDrawItem*)item
{
    [self.items addObject:item];
}

- (void)addItems:(NSArray *)items
{
    [self.items addObjectsFromArray:items];
}

- (void)removeAllItems
{
    [self.items removeAllObjects];
}

- (void)removeItem:(MDrawItem*)item
{
    [self.items removeObject:item];
}

- (MDrawItem *)itemWithTag:(NSInteger)tag
{
    for (MDrawItem *item in self.items) {
        if (item.tag == tag) {
            return item;
        }
    }
    return nil;
}

- (void)increaseHeight:(CGFloat)height
{
    CGRect newRect = self.rect;
    newRect.size.height = self.rect.size.height+height;
    self.rect = newRect;
}

- (void)setHeight:(CGFloat)height
{
    CGRect newRect = self.rect;
    newRect.size.height = height;
    self.rect = newRect;
}



@end
