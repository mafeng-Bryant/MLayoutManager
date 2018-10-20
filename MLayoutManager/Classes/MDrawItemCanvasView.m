//
//  MDrawItemCanvasView.m
//  MLayoutManager_Example
//
//  Created by patpat on 2018/10/20.
//  Copyright © 2018年 1499603656@qq.com. All rights reserved.
//

#import "MDrawItemCanvasView.h"

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

static CGFloat  kDrawItemOutSetOffSetValue = 2.0;

@implementation MDrawItemCanvasView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (MDrawItem *item  in _layoutInfo.items) {
        if (item.invalidDraw)continue;
        if ([item isKindOfClass:[MDrawItemText class]] && ![item isKindOfClass:[MDrawItemCoreText class]]) {
            MDrawItemText *textItem = (MDrawItemText *)item;
            if (textItem.userInteractionEnabled && textItem.handleTouch) {
                CGContextSetFillColorWithColor(context, [UIColor colorWithRed:1.0 green:0 blue:0 alpha:0.05].CGColor);
                CGRect rectOne = CGRectMake(floor(item.rect.origin.x)-kDrawItemOutSetOffSetValue, floor(item.rect.origin.y)-0, floor(item.rect.size.width)+2*kDrawItemOutSetOffSetValue, floor(item.rect.size.height)+2*0);
                CGContextAddRect(context,rectOne);
                CGContextFillPath(context);
            }
            CGContextSetFillColorWithColor(context, textItem.color.CGColor);
            [textItem.string drawInRect:textItem.rect withFont:textItem.font lineBreakMode:textItem.lineBreakMode];
        }else if([item isKindOfClass:[MDrawItemImage class]]){
            MDrawItemImage *imageItem = (MDrawItemImage *)item;
            UIImage *image = [UIImage imageNamed:@"imageItem.imageName"];
            [image drawAtPoint:imageItem.rect.origin];
        }else if([item isKindOfClass:[MDrawItemView class]]){
            MDrawItemView *viewItem = (MDrawItemView *)item;
            CGContextSetFillColorWithColor(context,viewItem.backgroundColor.CGColor);
            if (viewItem.cornerRadius >0 ||  viewItem.isFill || viewItem.strokeLineWidth>0) {
                UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:viewItem.rect cornerRadius:viewItem.cornerRadius];
                if (viewItem.isFill){
                    [bezierPath fill];
                }
                if (viewItem.strokeLineWidth>0) {
                    CGContextSetLineWidth(context, viewItem.strokeLineWidth);
                    CGContextSetStrokeColorWithColor(context, viewItem.strokeLineColor.CGColor);
                    [bezierPath stroke];
                }
            }else{
                CGContextAddRect(context,item.rect);
                CGContextFillPath(context);
            }
        }
    }
}

- (void)drawLayout:(MLayoutInfo *)layoutInfo
{
    if (![_layoutInfo isEqual:layoutInfo]) {
        _layoutInfo = layoutInfo;
        [self setNeedsDisplay];
    }
}

- (void)drawLayoutRect:(CGRect)rect layoutInfo:(MLayoutInfo *)layoutInfo
{
    _layoutInfo = layoutInfo;
    [self setNeedsDisplayInRect:rect];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint originalLocation = [touch locationInView:self];
    BOOL touchItem = NO;
    for (MDrawItem *item  in _layoutInfo.items) {
        if (item.userInteractionEnabled && CGRectContainsPoint(item.rect, originalLocation)) {
            item.handleTouch = YES;
            CGRect rectOne = CGRectMake(floor(item.rect.origin.x)-kDrawItemOutSetOffSetValue, floor(item.rect.origin.y)-0, floor(item.rect.size.width)+2*kDrawItemOutSetOffSetValue, floor(item.rect.size.height)+2*0);
            [self setNeedsDisplayInRect:rectOne];
            touchItem = YES;
            break;
        }
    }
    if (!touchItem) {
        [super touchesBegan:touches withEvent:event];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    BOOL touchItem = NO;
    for (MDrawItem *item  in _layoutInfo.items) {
        if (item.userInteractionEnabled && item.handleTouch) {
            item.handleTouch = NO;
            CGRect rectOne = CGRectMake(floor(item.rect.origin.x)-kDrawItemOutSetOffSetValue, floor(item.rect.origin.y)-0, floor(item.rect.size.width)+2*kDrawItemOutSetOffSetValue, floor(item.rect.size.height)+2*0);
            [self setNeedsDisplayInRect:rectOne];
            touchItem = YES;
            break;
        }
    }
    if (!touchItem) {
        [super touchesCancelled:touches withEvent:event];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint originalLocation = [touch locationInView:self];
    BOOL touchItem = NO;
    for (MDrawItem *item  in _layoutInfo.items) {
        if (item.userInteractionEnabled && item.handleTouch) {
            item.handleTouch = NO;
            CGRect rectOne = CGRectMake(floor(item.rect.origin.x)-kDrawItemOutSetOffSetValue, floor(item.rect.origin.y)-0, floor(item.rect.size.width)+2*kDrawItemOutSetOffSetValue, floor(item.rect.size.height)+2*0);
            [self setNeedsDisplayInRect:rectOne];
            if (CGRectContainsPoint(item.rect, originalLocation)) {
                id target = item.target;
                SEL sel = item.selector;
                if (target && sel){ //callback
                    if ([target respondsToSelector:sel]) {
                        SuppressPerformSelectorLeakWarning([target performSelector:sel withObject:item withObject:self]);
                    }
                }
            }
            touchItem = YES;
            break;
        }
    }
    if (!touchItem) {
        [super touchesEnded:touches withEvent:event];
    }
}

@end
