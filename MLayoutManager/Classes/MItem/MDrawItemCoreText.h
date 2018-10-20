
#import "MDrawItemText.h"
#import <CoreText/CoreText.h>

@interface MDrawItemCoreText : MDrawItemText
@property (nonatomic, assign) CTFrameRef textFrame;
@property (nonatomic, strong) NSMutableAttributedString *attributedString;
@property (nonatomic, assign) CGSize size;
@end
