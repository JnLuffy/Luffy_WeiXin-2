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

#define kCellReuseIDWithSenderAndType(isSender,chatCellType)    ([NSString stringWithFormat:@"%@-%@",isSender,chatCellType])

//根据模型得到可重用Cell的 重用ID
#define kCellReuseID(model)      ((model.chatCellType.integerValue == WSChatCellType_Time)?kTimeCellReusedID:(kCellReuseIDWithSenderAndType(model.isSender,model.chatCellType)))


@interface LFYChatViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
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
    _dataSource = [[NSMutableArray alloc]initWithObjects:@"顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶v顶顶顶顶的神烦大叔",@"我是炉石",@"我是炉石",@"我是炉石",@"我是炉石",@"你好",@"哈哈哈哈哈",nil];
    
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
            make.edges.equalTo(self.view);
        }];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [tableView registerClass:[LFYChatTextCell class] forCellReuseIdentifier:@"0-1"];
        [tableView registerClass:[LFYChatTextCell class] forCellReuseIdentifier:@"1-1"];
        [tableView registerClass:[LFYChatImageCell class] forCellReuseIdentifier:@"0-2"];
        [tableView registerClass:[LFYChatImageCell class] forCellReuseIdentifier:@"1-2"];
        tableView;
    });
  
    
    
}

#pragma mark - Private Method

#pragma mark - Action

#pragma mark - Network Request



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LFYChatBaseCell *cell ;
    if(indexPath.row == 2){
        cell = [tableView dequeueReusableCellWithIdentifier:@"1-2" forIndexPath:indexPath];
        [self configureCell:cell atIndexPath:indexPath];
        return cell;
    }
    if(indexPath.row == 3){
        cell = [tableView dequeueReusableCellWithIdentifier:@"0-2" forIndexPath:indexPath];
        [self configureCell:cell atIndexPath:indexPath];
        return cell;
    }
    if(indexPath.row %2 == 0){
         cell = [tableView dequeueReusableCellWithIdentifier:@"1-1" forIndexPath:indexPath];
        [self configureCell:cell atIndexPath:indexPath];

    }else{
         cell = [tableView dequeueReusableCellWithIdentifier:@"0-1" forIndexPath:indexPath];
        [self configureCell:cell atIndexPath:indexPath];

    }
//
    return cell;
   
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if(indexPath.row == 2){
        return [self.tableView fd_heightForCellWithIdentifier:@"1-2" cacheByIndexPath:indexPath configuration:^(LFYChatBaseCell *cell) {
            [self configureCell:cell atIndexPath:indexPath];
            
        }];
    }
    if(indexPath.row == 3){
        return [self.tableView fd_heightForCellWithIdentifier:@"0-2" cacheByIndexPath:indexPath configuration:^(LFYChatBaseCell *cell) {
            [self configureCell:cell atIndexPath:indexPath];
            
        }];
    }
    
    if(indexPath.row %2 == 0){
     
        return [self.tableView fd_heightForCellWithIdentifier:@"1-1" cacheByIndexPath:indexPath configuration:^(LFYChatBaseCell *cell) {
            [self configureCell:cell atIndexPath:indexPath];
          
        }];
        
        
    }else{
     
        return [self.tableView fd_heightForCellWithIdentifier:@"0-1" cacheByIndexPath:indexPath configuration:^(LFYChatBaseCell *cell) {
            [self configureCell:cell atIndexPath:indexPath];

        }];
    }
    



    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


- (void)configureCell:(LFYChatBaseCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.fd_enforceFrameLayout = NO; // Enable to use "-sizeThatFits:"
    cell.model = _dataSource[indexPath.row];
}


@end
