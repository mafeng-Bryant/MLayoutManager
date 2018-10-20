//
//  MDrawItemCanvasView.h
//  MLayoutManager_Example
//
//  Created by patpat on 2018/10/20.
//  Copyright © 2018年 1499603656@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLayoutInfo.h"


@interface MDrawItemCanvasView : UIView
{
    MLayoutInfo *_layoutInfo;
}

- (void)drawLayout:(MLayoutInfo *)layoutInfo;

- (void)drawLayoutRect:(CGRect)rect layoutInfo:(MLayoutInfo *)layoutInfo;

@end

