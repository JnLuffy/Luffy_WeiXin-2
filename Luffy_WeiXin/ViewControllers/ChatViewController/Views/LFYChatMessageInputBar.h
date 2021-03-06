//
//  LFYChatMessageInputBar.h
//  Luffy_WeiXin
//
//  Created by IOS.Mac on 16/11/21.
//  Copyright © 2016年 com.elepphant.pingchuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LFYChatMessageInputBarDelegate <NSObject>

// change chatBox height
- (void) didChangeChatBoxHeight:(CGFloat)height;

@end

/**
 *  @brief  聊天界面底部输入界面
 */
@interface LFYChatMessageInputBar : UIView
@property(nonatomic,weak)id<LFYChatMessageInputBarDelegate>delegate;
@end
