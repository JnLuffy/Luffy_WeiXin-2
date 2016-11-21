//
//  LFYChatViewController.m
//  Luffy_WeiXin
//
//  Created by IOS.Mac on 16/11/11.
//  Copyright © 2016年 com.elepphant.pingchuan. All rights reserved.
//

#import "LFYChatViewController.h"
#import <UITableView+FDTemplateLayoutCell/UITableView+FDTemplateLayoutCell.h>
#import "LFYChatBaseCell.h"
#import "LFYChatTextCell.h"
#import "LFYChatImageCell.h"
#import "LFYMessageModel.h"
#import "LFYChatMessageInputBar.h"



@interface LFYChatViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)LFYChatMessageInputBar *inputBar;
@property(nonatomic,copy)NSMutableArray *dataSource;
@end

@implementation LFYChatViewController

#pragma mark - Lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"马云";
    [self initDatas];
    [self setupViews];
    
}

#pragma mark - Private Method

- (void)initDatas {
    LFYMessageModel *model0 = [LFYMessageModel new];
    model0.text = @"哈哈哈哈哈";
    model0.chatCellType = @(1);
    model0.isSender = @(1);
    if(!_dataSource){
        _dataSource = [[NSMutableArray alloc]init];
        
    }
    
    LFYMessageModel *model1 = [LFYMessageModel new];
    model1.text = @"我是马云";
    model1.chatCellType = @(1);
    model1.isSender = @(0);
    
    
    LFYMessageModel *model2 = [LFYMessageModel new];
    model2.imageName = @"xxx.png";
    model2.chatCellType = @(2);
    model2.isSender = @(0);
    
    
    LFYMessageModel *model3 = [LFYMessageModel new];
    model3.imageName = @"xxx.png";
    model3.chatCellType = @(2);
    model3.isSender = @(1);
    
    [_dataSource addObject:model0];
    [_dataSource addObject:model1];
    [_dataSource addObject:model2];
    [_dataSource addObject:model3];

    
}

- (void)setupViews {
    _tableView = ({
        UITableView *tableView = [[UITableView alloc]init];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.tableFooterView = [UIView new];
        [self.view addSubview:tableView];
        tableView.showsVerticalScrollIndicator = NO;
        tableView.showsHorizontalScrollIndicator = NO;
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, -49, 0));
        }];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        

        
        [tableView registerClass:[LFYChatTextCell class] forCellReuseIdentifier:kCellReuseIDWithSenderAndType(@1,@(LFYChatCellType_Text))];
        [tableView registerClass:[LFYChatTextCell class] forCellReuseIdentifier:kCellReuseIDWithSenderAndType(@0,@(LFYChatCellType_Text))];
        
        [tableView registerClass:[LFYChatImageCell class] forCellReuseIdentifier:kCellReuseIDWithSenderAndType(@1, @(LFYChatCellType_Image))];
        [tableView registerClass:[LFYChatImageCell class] forCellReuseIdentifier:kCellReuseIDWithSenderAndType(@0, @(LFYChatCellType_Image))];
        


        tableView;
    });
  
    _inputBar = ({
        LFYChatMessageInputBar *inputBar = [LFYChatMessageInputBar new];
        [inputBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.top.equalTo(_tableView);
        }];
        inputBar;
    });
    [self.view addSubview:self.inputBar];

    
    
}

#pragma mark - Private Method

#pragma mark - Action

#pragma mark - Network Request



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LFYMessageModel *model = _dataSource[indexPath.row];
    LFYChatBaseCell * cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseID(model) forIndexPath:indexPath];
        [self configureCell:cell atIndexPath:indexPath];
        return cell;

    return cell;
   
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        LFYMessageModel *model = _dataSource[indexPath.row];
        return [self.tableView fd_heightForCellWithIdentifier:kCellReuseID(model) cacheByIndexPath:indexPath configuration:^(LFYChatBaseCell *cell) {
            [self configureCell:cell atIndexPath:indexPath];

        }];
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


- (void)configureCell:(LFYChatBaseCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.fd_enforceFrameLayout = NO; // Enable to use "-sizeThatFits:"
    cell.model = _dataSource[indexPath.row];
}


@end
