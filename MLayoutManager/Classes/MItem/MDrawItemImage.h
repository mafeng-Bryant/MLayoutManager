

#import "MDrawItem.h"

typedef enum
{
    VDrawItemModeFill,
    VDrawItemModeAbscrat
}VDrawItemMode;

typedef enum
{
    VDrawItemTypeNoraml,
    VDrawItemTypeHighlighted
}VDrawItemType;

@interface MDrawItemImage : MDrawItem

@property (nonatomic, strong)  UIImage *image;
@property (nonatomic, strong)  NSString *imageName;
@property (nonatomic, assign)  BOOL isLocalImage;
@property (nonatomic, assign)  VDrawItemMode mode;
@property (nonatomic, assign)  VDrawItemType type;

@end
