//
//  LFYChatTextCell.m
//  Luffy_WeiXin
//
//  Created by IOS.Mac on 16/11/14.
//  Copyright © 2016年 com.elepphant.pingchuan. All rights reserved.
//

#import "LFYChatTextCell.h"
@interface LFYChatTextCell()
@property(nonatomic,retain)UILabel *messageLabel;//消息内容 暂时使用UILabel，不支持网址、@人 等点击操作
@end

@implementation LFYChatTextCell
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
    [super prepareForReuse];
}

#pragma mark - Private Method

//isSender
- (void)setupViews{
 
    _messageLabel = ({
        UILabel *messageLabel = [UILabel new];
        messageLabel.backgroundColor =[UIColor blueColor];
        [self.contentView addSubview:messageLabel];
        messageLabel.textColor = [UIColor blackColor];
        messageLabel.font = [UIFont systemFontOfSize:18];
        messageLabel.numberOfLines = 0;
        messageLabel;
    });
}

- (void)layoutSetting{
    if(isSender){//发送者布局
        _messageLabel.textAlignment = NSTextAlignmentRight;
        
        [_messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.avatarView.mas_left).offset(-10);
            make.top.equalTo(self.avatarView.mas_top).offset(5);
            make.height.greaterThanOrEqualTo(@35);
            make.left.equalTo(self.contentView.mas_left).offset(60);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-15);

        }];
        
        [self.bubbleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_messageLabel).insets(UIEdgeInsetsMake(-5, -5, -5, -5));

            
        }];
    }else{
        
        _messageLabel.textAlignment = NSTextAlignmentLeft;
        [_messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.avatarView.mas_right).offset(10);
            make.top.equalTo(self.avatarView.mas_top).offset(5);
            make.height.greaterThanOrEqualTo(@35);
            make.right.equalTo(self.contentView.mas_right).offset(-60);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-15);

        }];
        
        [self.bubbleView  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_messageLabel).insets(UIEdgeInsetsMake(-5, -5, -5, -5));
        }];
        
    }
    
    
}

#pragma mark - Seter
-(void)setModel:(NSString *)model{
    self.messageLabel.text = model;
        NSLog(@"message = %@",model);
}


@end
