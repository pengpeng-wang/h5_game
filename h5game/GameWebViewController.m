//
//  GameWebViewController.m
//  h5game
//
//  Created by wangpeng on 17/6/23.
//  Copyright © 2017年 h5game. All rights reserved.
//

#import "GameWebViewController.h"
#import "DYYFloatWindow.h"
#import "CustomURLProtocol.h"

@interface GameWebViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) DYYFloatWindow *floatWindow;
@end

@implementation GameWebViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.floatWindow showWindow];
    
    // 注册NSURLProtocol
    [NSURLProtocol registerClass:[CustomURLProtocol class]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.floatWindow dissmissWindow];
    
    // 取消注册NSURLProtocol
    [NSURLProtocol unregisterClass:[CustomURLProtocol class]];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addGameWebView];
    
    [self showFloatWindow];
}


#pragma mark - 添加游戏webView
- (void)addGameWebView {
    [self.view addSubview:self.webView];
    
    self.gameUrl = [NSString stringWithFormat:@"http://localhost:8080/web_game/%@/index.html",self.gameUrl];
//    self.gameUrl = @"http://localhost:8080/web_game/fxq/index.html";
    
    NSURL *url = [NSURL URLWithString:self.gameUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}


#pragma mark - 添加悬浮窗
- (void)showFloatWindow{
    self.floatWindow = [[DYYFloatWindow alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-50, [UIScreen mainScreen].bounds.size.height-64-120, 50, 50) mainImageName:@"xuanfuanniu.png" imagesAndTitle:@{@"fanhui1":@"退出"} bgcolor:[UIColor lightGrayColor] animationColor:nil];
    __weak typeof(self) weakSelf = self;
    self.floatWindow.clickBolcks = ^(NSInteger i){
        if (i == 0) {
            UIAlertController *alertController= [UIAlertController alertControllerWithTitle:@"您将退出游戏" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:NULL];
            UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                [weakSelf.navigationController popViewControllerAnimated:NO];
                
            }];
            [alertController addAction:action1];
            [alertController addAction:action2];
            [weakSelf presentViewController:alertController animated:YES completion:nil];
        }
    };
}


#pragma mark - lazy getter
- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    }
    return _webView;
}
@end
