//
//  LFYChatMessageInputBar.m
//  Luffy_WeiXin
//
//  Created by IOS.Mac on 16/11/21.
//  Copyright © 2016年 com.elepphant.pingchuan. All rights reserved.
//

#import "LFYChatMessageInputBar.h"

//背景颜色
#define kBkColor               ([UIColor colorWithRed:0.922 green:0.925 blue:0.929 alpha:1])



@interface LFYChatMessageInputBar()<UITextViewDelegate>
{
    /**
     *  @brief  自己和父控件 底部约束，使用这个约束让自己伴随键盘移动
     */
    NSLayoutConstraint *mBottomConstraintWithSupView;

    
    /**
     *  @brief  TextView的高度
     */
    CGFloat mHeightTextView;

}
/**
 *  @brief  输入TextView
 */
@property(nonatomic,strong)UITextView *inputTextView;
@end
@implementation LFYChatMessageInputBar

#pragma mark - Override System Method

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.backgroundColor = kBkColor;
        mHeightTextView = HEIGHT_TEXTVIEW; //默认设置输入框最小高度
        
        [self addSubview:self.inputTextView];
        [_inputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(40);
            make.top.equalTo(self.mas_top).offset(5);
            make.bottom.equalTo(self.mas_bottom).offset(-5);
            make.right.equalTo(self.mas_right).offset(-80);
        }];
        
      
        /**
         * @brief 监听键盘显示、隐藏 让自己跟随键盘的移动
         */
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillHideNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillShowNotification object:nil];
        
    }
    return self;
}



//获取自己和父控件底部约束，控制该约束可以让自己伴随键盘移动
-(void)updateConstraints
{
    [super updateConstraints];
    
    
    if (!mBottomConstraintWithSupView)
    {
        NSArray *constraints = self.superview.constraints;
        
        for (int index= (int)constraints.count-1; index>0; index--)
        {//从末尾开始查找
            NSLayoutConstraint *constraint = constraints[index];
            
            if (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeBottom && constraint.secondAttribute == NSLayoutAttributeBottom)
            {//获取自己和父控件底部约束
                mBottomConstraintWithSupView = constraint;
                
                break;
            }
        }
    }
      
}

/**
 *  @brief  返回自己的固有内容尺寸，刷新固有内容尺寸系统将会重新调用此方法
 *
 *  @return 宽度不设置固有内容尺寸，只设置高度
 */
-(CGSize)intrinsicContentSize
{
    CGFloat height = mHeightTextView+kDefaultBottomTextView_SupView +kDefaultTopTextView_SupView;
    
//    height += [mMoreView intrinsicContentSize].height; //如果更多视图当前正在显示，需要加上更多视图的高度
    
//    height += [mFaceView intrinsicContentSize].height; //如果表情视图当前正在显示，需要加上他的的高度
    return CGSizeMake(UIViewNoIntrinsicMetric, height);
}


#pragma mark - Getter Method
- (UITextView *)inputTextView{
    if(_inputTextView){
        return _inputTextView;
    }
    _inputTextView = [UITextView new];
    _inputTextView.delegate = self;
    _inputTextView.layer.cornerRadius = 4;
    _inputTextView.layer.masksToBounds = YES;
    _inputTextView.layer.borderWidth = 1;
    _inputTextView.layer.borderColor = [[[UIColor lightGrayColor] colorWithAlphaComponent:0.4] CGColor];
    _inputTextView.scrollIndicatorInsets = UIEdgeInsetsMake(10.0f, 0.0f, 10.0f, 4.0f);
    _inputTextView.contentInset = UIEdgeInsetsZero;
    _inputTextView.scrollEnabled = NO;
    _inputTextView.scrollsToTop = NO;
    _inputTextView.userInteractionEnabled = YES;
    _inputTextView.font = [UIFont systemFontOfSize:14];
    _inputTextView.textColor = [UIColor blackColor];
    _inputTextView.backgroundColor = [UIColor whiteColor];
    _inputTextView.keyboardAppearance = UIKeyboardAppearanceDefault;
    _inputTextView.keyboardType = UIKeyboardTypeDefault;
    _inputTextView.returnKeyType = UIReturnKeySend;
    _inputTextView.textAlignment = NSTextAlignmentLeft;
    return _inputTextView;
}

#pragma mark - 伴随键盘移动

-(void)keyboardChange:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    
    
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    CGRect keyboardEndFrame;
    
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardEndFrame];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    
    
    if (notification.name == UIKeyboardWillShowNotification)
    {
        mBottomConstraintWithSupView.constant = -(keyboardEndFrame.size.height);
    }else
    {
        mBottomConstraintWithSupView.constant = 0;
    }
    

    
    [self.superview layoutIfNeeded];
    [UIView commitAnimations];
}


//根据输入文字多少，自动调整输入框的高度
-(void)textViewDidChange:(UITextView *)textView
{
    //计算输入框最小高度
    CGSize size =  [textView sizeThatFits:CGSizeMake(textView.contentSize.width, 0)];
    
    CGFloat contentHeight;
    
    //输入框的高度不能超过最大高度
    if (size.height > MAX_TEXTVIEW_HEIGHT)
    {
        contentHeight = MAX_TEXTVIEW_HEIGHT;
        textView.scrollEnabled = YES;
    }else
    {
        contentHeight = size.height;
        textView.scrollEnabled = NO;
    }
    
 
    if (mHeightTextView != contentHeight)
    {//如果当前高度需要调整，就调整，避免多做无用功
        mHeightTextView = contentHeight ;//重新设置自己的高度
        [self invalidateIntrinsicContentSize];
        
    }
}


@end
