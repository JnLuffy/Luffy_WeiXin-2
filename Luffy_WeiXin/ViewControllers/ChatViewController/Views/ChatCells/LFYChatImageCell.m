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
    UIView *spaceView;//图片与底部中间的View
}
@property(nonatomic,strong)MASConstraint *imageViewHeightConstraint;
@property(nonatomic,strong)MASConstraint *imageViewWidthConstraint;
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


- (void)setupViews{

    
    imageView = [UIImageView new];
    [self.contentView addSubview:imageView];
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.mas_key = @"thisImageView";
    
    spaceView = [UIView new];
    [self.contentView addSubview:spaceView];
    
}

- (void)layoutSetting{
    if(isSender){//发送者布局
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.avatarView.mas_left).offset(-10);
            make.top.equalTo(self.avatarView.mas_top);
            _imageViewHeightConstraint = make.height.equalTo(@0);
            _imageViewWidthConstraint = make.width.equalTo(@0);

        }];
        self.bubbleView.image = [[UIImage imageNamed:@"SenderTextNodeBkg"] stretchableImageWithLeftCapWidth:30 topCapHeight:30];
    }else{
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.avatarView.mas_right).offset(10);
            make.top.equalTo(self.avatarView.mas_top);
            _imageViewHeightConstraint = make.height.equalTo(@0);
            _imageViewWidthConstraint = make.width.equalTo(@0);
        }];
        self.bubbleView.image = [[UIImage imageNamed:@"ReceiverTextNodeBkg"] stretchableImageWithLeftCapWidth:30 topCapHeight:30];
    }
    
    [spaceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(imageView.mas_bottom);
//        make.height.equalTo(@1);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-20);

    }];

}

#pragma mark - Seter
-(void)setModel:(LFYMessageModel *)model{
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
    

    //设置图片的宽高
    _imageViewHeightConstraint.mas_equalTo(h);
    _imageViewWidthConstraint.mas_equalTo(w);
    [imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(w));
        make.height.equalTo(@(h));
    }];


    CALayer *layer  = self.bubbleView.layer;
    layer.frame  = (CGRect){{0,0},{w,h}};
    
    imageView.layer.mask = layer;
   

}


@end
