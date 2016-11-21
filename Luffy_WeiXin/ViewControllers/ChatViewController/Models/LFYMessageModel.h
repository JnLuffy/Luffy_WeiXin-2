//
//  LFYMessageModel.h
//  Luffy_WeiXin
//
//  Created by IOS.Mac on 16/11/11.
//  Copyright © 2016年 com.elepphant.pingchuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFYMessage.h"

#define kTimeCellReusedID    (@"time")

#define kCellReuseIDWithSenderAndType(isSender,chatCellType)    ([NSString stringWithFormat:@"%@-%@",isSender,chatCellType])


//根据模型得到可重用Cell的 重用ID
#define kCellReuseID(model)      ((model.chatCellType.integerValue == LFYChatCellType_Time)?kTimeCellReusedID:(kCellReuseIDWithSenderAndType(model.isSender,model.chatCellType)))


/**
 *  @brief  消息类型
 */
typedef NS_OPTIONS(NSInteger,LFYChatCellType)
{
    /**
     *  @brief  文本消息
     */
    LFYChatCellType_Text = 1,
    
    /**
     *  @brief  图片消息
     */
    LFYChatCellType_Image = 2,
    
    /**
     *  @brief  语音消息
     */
    LFYChatCellType_Audio = 3,
    
    /**
     *  @brief  视频消息
     */
    LFYChatCellType_Video = 4,
    
    /**
     *  @brief  时间
     */
    LFYChatCellType_Time  = 0
};


@interface LFYMessageModel : NSObject
// 是否是发送者
@property (nonatomic, strong) NSNumber *isSender;
@property (nonatomic, strong) NSNumber *chatCellType;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *imageName;
//消息体
@property (nonatomic, strong) LFYMessage * message;
@end
