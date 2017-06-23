//
//  ViewController.m
//  h5game
//
//  Created by wangpeng on 17/6/23.
//  Copyright © 2017年 h5game. All rights reserved.
//

#import "ViewController.h"
#import "GameCell.h"
#import "GameWebViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

// 游戏的路径
@property (nonatomic, strong) NSArray *gamePathArr;

@property (nonatomic, strong) NSArray *imagesArr;
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray *detailTitleArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"游戏大厅";
    
    self.gamePathArr = @[@"ajkyq",@"ktfx",@"dqcs"];
    self.imagesArr = @[@"aijiukuaiyiqi",@"katongfeixing",@"dianqiusheshou"];
    self.titleArr = @[@"爱就快一起",@"卡通飞行",@"点球射手"];
    self.detailTitleArr = @[@"让有情人终成眷属！",@"让我们一起愉快的飞行吧！",@"带领你的球队取得最后的胜利！"];
    
    [self.view addSubview:self.tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GameCell *cell = [tableView dequeueReusableCellWithIdentifier:@"gamecell" forIndexPath:indexPath];
    
    cell.iconView.image = [UIImage imageNamed:self.imagesArr[indexPath.row]];
    cell.showLabel.text = self.titleArr[indexPath.row];
    cell.detailShowLabel.text = self.detailTitleArr[indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIAlertController *alertController= [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"您将进入\"%@\"本地休闲游戏",self.titleArr[indexPath.row]] message:@"提示：游戏为本地游戏，不需要消耗任何流量，您可关闭网络来玩" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:NULL];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        GameWebViewController *webVc = [[GameWebViewController alloc] init];
        webVc.gameUrl = self.gamePathArr[indexPath.row];
        [self.navigationController pushViewController:webVc animated:YES];
        
    }];
    [alertController addAction:action1];
    [alertController addAction:action2];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}


#pragma mark - lazy getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[GameCell class] forCellReuseIdentifier:@"gamecell"];
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}
@end
