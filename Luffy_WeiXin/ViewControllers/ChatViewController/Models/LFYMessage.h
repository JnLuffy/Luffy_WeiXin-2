//
//  LFYMessage.h
//  Luffy_WeiXin
//
//  Created by IOS.Mac on 16/11/11.
//  Copyright © 2016年 com.elepphant.pingchuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFYMessage : NSObject
// 消息来源用户名
@property (nonatomic, copy) NSString *senderName;
// 消息来源用户id
@property (nonatomic, copy) NSString *from;
// 消息目的地群组id
@property (nonatomic, copy) NSString *to;
// 消息ID
@property (nonatomic, copy) NSString *messageId;
// 消息时间
@property (nonatomic, assign) NSInteger date;
// 消息文本内容
@property (nonatomic, copy) NSString *content;



@end
