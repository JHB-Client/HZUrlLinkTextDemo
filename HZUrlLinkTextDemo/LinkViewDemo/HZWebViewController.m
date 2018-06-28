//
//  HZWebViewController.m
//  HZPageViewDemo
//
//  Created by 季怀斌 on 2018/6/28.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import "HZWebViewController.h"
#import "Masonry.h"
@interface HZWebViewController ()

@end

@implementation HZWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"网页";
    
    UIWebView *webView = [UIWebView new];
    [self.view addSubview:webView];
    //
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(0);
    }];
    
    [webView loadRequest:[NSURLRequest requestWithURL:self.url]];
}

- (void)setUrl:(NSURL *)url {
    _url = url;
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
