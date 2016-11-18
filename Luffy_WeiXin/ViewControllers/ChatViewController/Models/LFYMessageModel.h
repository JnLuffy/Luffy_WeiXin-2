//
//  LFYMessageModel.h
//  Luffy_WeiXin
//
//  Created by IOS.Mac on 16/11/11.
//  Copyright © 2016年 com.elepphant.pingchuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFYMessage.h"
@interface LFYMessageModel : NSObject
// 是否是发送者
@property (nonatomic, assign) BOOL isSender;
//消息体
@property (nonatomic, strong) LFYMessage * message;
@end
