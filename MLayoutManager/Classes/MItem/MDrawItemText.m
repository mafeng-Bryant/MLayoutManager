
#import "MDrawItemText.h"

@implementation MDrawItemText

- (id)initWithString:(NSString *)string
                font:(UIFont *)font
               color:(UIColor *)color;
{
    self = [super init];
    if (self) {
        [self setString:string font:font color:color];
        self.lineBreakMode = NSLineBreakByCharWrapping;
        self.textAlignment = NSTextAlignmentLeft;
    }
    return self;
}

- (void)setString:(NSString *)string font:(UIFont *)font color:(UIColor *)color;
{
    self.string = string;
    self.font = font;
    self.color = color;
}

@end
