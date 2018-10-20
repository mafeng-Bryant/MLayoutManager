
#import "MDrawItem.h"

@interface MDrawItemAttatch : MDrawItem
@property (nonatomic, strong)  NSString *url;   //链接url
@property (nonatomic, strong)  id info;         //相关的信息
@property (nonatomic) NSInteger attachType;     //附件类型
@property (nonatomic) NSInteger  attachStatus;  //附件状态
@end
