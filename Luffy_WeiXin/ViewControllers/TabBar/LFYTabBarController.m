//
//  LFYTabBarController.m
//  Luffy_WeiXin
//
//  Created by IOS.Mac on 16/11/4.
//  Copyright © 2016年 com.elepphant.pingchuan. All rights reserved.
//

#import "LFYTabBarController.h"
#import "HomeVC.h"
#import "ContactVC.h"
#import "DiscoveryVC.h"
#import "MineVC.h"

#define Global_tintColor [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]

@interface LFYTabBarController ()

@end

@implementation LFYTabBarController


-(instancetype)init{
    self = [super init];

    HomeVC *homeVC =[HomeVC new];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeVC];
    homeNav.title = @"微信";
    ContactVC *contactVC =[ContactVC new];
    UINavigationController *contactNav = [[UINavigationController alloc]initWithRootViewController:contactVC];
    contactNav.title = @"通讯录";
    DiscoveryVC *discoveryVC =[DiscoveryVC new];
    UINavigationController *discoveryNav = [[UINavigationController alloc]initWithRootViewController:discoveryVC];
    discoveryNav.title = @"发现";
    MineVC *mineVC =[MineVC new];
    UINavigationController *mineNav = [[UINavigationController alloc]initWithRootViewController:mineVC];
    mineNav.title = @"我";
    
//    [self setViewControllers:@[homeNav,contactNav,discoveryNav,mineNav]];
    [self addChildViewController:homeNav];
        [self addChildViewController:contactNav];
        [self addChildViewController:discoveryNav];
        [self addChildViewController:mineNav];
    
    [self setupTabBar];
    return self;
}

- (void)setupTabBar {
    NSArray *tabBarItemImageNames = @[@"tabbar_mainframe",@"tabbar_contacts",@"tabbar_discover",@"tabbar_me"];
    NSInteger index = 0;
   for (UIViewController *vc in self.viewControllers) {
       NSString *normalImageName = tabBarItemImageNames[index];
       NSString *highLightImageName = [normalImageName stringByAppendingString:@"HL"];
       UIImage *normalImage = [UIImage imageNamed:normalImageName];
       //修改系统选染色imageWithRenderingMode
       UIImage *hignLightImage = [[UIImage imageNamed:highLightImageName ] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
       
       vc.tabBarItem.image = normalImage;
       vc.tabBarItem.selectedImage = hignLightImage;
       [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : Global_tintColor} forState:UIControlStateSelected];

       index++;
   }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
