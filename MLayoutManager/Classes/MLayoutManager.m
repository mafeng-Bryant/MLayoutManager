//
//  MLayoutManager.m
//  MLayoutManager_Example
//
//  Created by patpat on 2018/10/20.
//  Copyright © 2018年 1499603656@qq.com. All rights reserved.
//

#import "MLayoutManager.h"

@implementation MLayoutManager

- (id)init
{
    self =[super init];
    if (self){
        self.layoutInfos = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)addlayoutInfo:(MLayoutInfo*)layoutInfo
{
    [self.layoutInfos addObject:layoutInfo];
}

- (void)addlayoutInfo:(MLayoutInfo *)layoutInfo insert:(NSUInteger)index
{
    [self.layoutInfos insertObject:layoutInfo atIndex:index];
}

- (void)addlayoutInfos:(NSArray *)layoutInfo
{
    [self.layoutInfos addObjectsFromArray:layoutInfo];
}

- (void)removelayoutInfo:(MLayoutInfo*)layoutInfo
{
    [self.layoutInfos removeObject:layoutInfo];
}

- (void)removelayoutInfoAtIndex:(NSInteger)index
{
    [self.layoutInfos removeObjectAtIndex:index];
}

- (void)removeAlllayoutInfo
{
    [self.layoutInfos removeAllObjects];
}

- (NSInteger)layoutInfoCount{
    return self.layoutInfos.count;
}

- (MLayoutInfo *)layoutInfo:(NSInteger)index
{
    if (index<[self layoutInfoCount]) {
        return self.layoutInfos[index];
    }
    return nil;
}


@end
