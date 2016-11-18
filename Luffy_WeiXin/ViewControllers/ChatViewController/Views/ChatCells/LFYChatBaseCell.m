//
//  LFYChatBaseCell.m
//  Luffy_WeiXin
//
//  Created by IOS.Mac on 16/11/11.
//  Copyright © 2016年 com.elepphant.pingchuan. All rights reserved.
//

#import "LFYChatBaseCell.h"
@interface LFYChatBaseCell()

@end


@implementation LFYChatBaseCell

#pragma mark - View Lifecycle

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        NSArray *IDs = [reuseIdentifier componentsSeparatedByString:kReuseIDSeparate];
        
        NSAssert(IDs.count>=2, @"reuseIdentifier should be separate by -");
        
        isSender = [IDs[0] boolValue];
        [self setupBaseCellViews];
        [self layoutBaseCellSetting];
    }
    
    return self;
}
- (void)prepareForReuse {
    [super prepareForReuse];
}

#pragma mark - Private Method

//isSender
- (void)setupBaseCellViews{
    _avatarView  = ({
        UIImageView *avatarView = [UIImageView new];
        avatarView.backgroundColor = [UIColor redColor];
//        avatarView.image = [UIImage imageNamed:@"IMG_0027.JPG"];
        [self.contentView addSubview:avatarView];
        avatarView;
    });
    
    _bubbleView = ({
        UIImageView *bubbleView = [UIImageView new];
        bubbleView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:bubbleView];
        bubbleView;
    });
    

}

- (void)layoutBaseCellSetting{
    if(isSender){//发送者布局
        [_avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.equalTo(@35);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.top.equalTo(self.contentView.mas_top).offset(10);
        }];
        
    }else{
        
        
        [_avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.equalTo(@35);
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.top.equalTo(self.contentView.mas_top).offset(10);
        }];
        
    }
    
   
}

#pragma mark - Seter

-(void)setModel:(NSString *)model{
    
    NSLog(@"base message = %@",model);
}


#pragma mark - Public Method

@end
