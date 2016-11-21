//
//  LFYChatBaseCell.h
//  Luffy_WeiXin
//
//  Created by IOS.Mac on 16/11/11.
//  Copyright © 2016年 com.elepphant.pingchuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFYMessageModel.h"


#define kReuseIDSeparate               (@"-") //可重用ID字符串区分符号
#define kChatCellIconImageViewWH 35.f //头像长度和宽度


//聊天cell(不包括时间没有头像的类型cell，文字、图片、语音、视频类型的cell可以继承此BaseCell)
@interface LFYChatBaseCell : UITableViewCell
{
    
    /**
     *  @brief  本消息是否是本人发送的？
     */
    BOOL isSender;
}

@property(nonatomic,strong)UIImageView *bubbleView;
@property(nonatomic,strong)UIImageView *avatarView;

@property(nonatomic,copy) LFYMessageModel *model;

@end
