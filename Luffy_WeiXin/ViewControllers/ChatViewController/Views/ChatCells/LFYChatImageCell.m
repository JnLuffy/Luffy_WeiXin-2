//
//  LFYChatImageCell.m
//  Luffy_WeiXin
//
//  Created by IOS.Mac on 16/11/14.
//  Copyright © 2016年 com.elepphant.pingchuan. All rights reserved.
//

#import "LFYChatImageCell.h"

#define kMaxChatImageViewWidth 200.f
#define kMaxChatImageViewHeight 300.f

@interface LFYChatImageCell()
{
    /**
     *  @brief  图片所在ImageView
     */
    UIImageView *imageView;
}
@end
@implementation LFYChatImageCell

#pragma mark - View Lifecycle

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        
        [self setupViews];
        [self layoutSetting];
    }
    
    return self;
}
- (void)prepareForReuse {
    imageView.image = nil;
    [super prepareForReuse];
}

#pragma mark - Private Method

//isSender
- (void)setupViews{
    imageView = [UIImageView new];
    [self.contentView addSubview:imageView];
    imageView.contentMode = UIViewContentModeScaleToFill;
    
}

- (void)layoutSetting{
    if(isSender){//发送者布局
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.avatarView.mas_left).offset(-10);
            make.top.equalTo(self.avatarView.mas_top);
//            make.left.greaterThanOrEqualTo(self.contentView.mas_left).offset(50);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        }];
    }else{
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.avatarView.mas_right).offset(10);
            make.top.equalTo(self.avatarView.mas_top);
//            make.right.greaterThanOrEqualTo(self.contentView.mas_right).offset(-50);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);

        }];

    }
  
    
}

#pragma mark - Seter
-(void)setModel:(NSString *)model{
    imageView.image = [UIImage imageNamed:@"IMG_0027.JPG"];
    // 根据图片的宽高尺寸设置图片约束
    CGFloat standardWidthHeightRatio = kMaxChatImageViewWidth / kMaxChatImageViewHeight;
    CGFloat widthHeightRatio = 0;
    UIImage *image = [UIImage imageNamed:@"IMG_0027.JPG"];
    CGFloat h = image.size.height;
    CGFloat w = image.size.width;
    
    if (w > kMaxChatImageViewWidth || w > kMaxChatImageViewHeight) {
        
        widthHeightRatio = w / h;
        
        if (widthHeightRatio > standardWidthHeightRatio) {
            w = kMaxChatImageViewWidth;
            h = w * (image.size.height / image.size.width);
        } else {
            h = kMaxChatImageViewHeight;
            w = h * widthHeightRatio;
        }
    }
    
    [imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(h);
        make.width.mas_equalTo(w);
    }];
    


//    self.messageLabel.text = model;
    //    NSLog(@"message = %@",model);
}


@end
