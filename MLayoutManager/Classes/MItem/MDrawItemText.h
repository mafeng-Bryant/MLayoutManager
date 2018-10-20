

#import "MDrawItem.h"

@interface MDrawItemText : MDrawItem
@property (nonatomic, strong)  NSString *string;
@property (nonatomic, strong)  UIFont *font;
@property (nonatomic, strong)  UIColor *color;
@property (nonatomic, assign)  NSLineBreakMode lineBreakMode;
@property (nonatomic, assign)  NSTextAlignment textAlignment;

- (id)initWithString:(NSString *)string
                font:(UIFont *)font
               color:(UIColor *)color;

- (void)setString:(NSString *)_string font:(UIFont *)_font color:(UIColor *)_color;

@end
