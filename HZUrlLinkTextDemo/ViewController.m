//
//  ViewController.m
//  HZUrlLinkTextDemo
//
//  Created by 季怀斌 on 2018/6/28.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
//
#import "HZLinkCell.h"
//
#import "HZWebViewController.h"
@interface ViewController () <UITableViewDataSource, UITableViewDelegate, HZLinkCellDelegate>
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setTableViewDemo];
}


- (void)setTableViewDemo {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.estimatedRowHeight = 80;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).inset(0);
    }];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HZLinkCell *cell = [HZLinkCell cellWithTableView:tableView];
    cell.linkString = @"hhhhhahaaself.哈哈哈哈哈哈www.baidu.com哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈www.ccdcc.cn哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈ddddddddddddd----------www.cccc.cn-----www.cocoachina.com/ios/20170620/19577.html";
    cell.delegate = self;
    return cell;
}
#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

#pragma mark ----------------- HZLinkCellDelegate ------------------
- (void)openTextUrl:(NSURL *)url {
    HZWebViewController *webVCtr = [HZWebViewController new];
    webVCtr.url = url;
    [self.navigationController pushViewController:webVCtr animated:true];
}


@end
