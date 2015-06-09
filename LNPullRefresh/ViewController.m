//
//  ViewController.m
//  LNPullRefresh
//
//  Created by lin wu on 6/9/15.
//  Copyright (c) 2015 lin wu. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (copy, nonatomic) NSString *webUrl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    [self webStartRelod];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createView {
    self.webView.delegate = self;
    self.webUrl = @"http://www.baidu.com";
    __weak typeof(self) wSelf = self;
    [self.webView.scrollView addLegendHeaderWithRefreshingBlock:^{
        [wSelf webStartRelod];
    }];
    self.webView.scrollView.header.updatedTimeHidden = YES;
    self.webView.scrollView.backgroundColor = [UIColor whiteColor];
}

- (void)webStartRelod {
    [self.webView loadRequest:[NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.webUrl]]];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.webView.scrollView.header endRefreshingWithSuccess];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self.webView.scrollView.header endRefreshingWithFail];
}
@end
