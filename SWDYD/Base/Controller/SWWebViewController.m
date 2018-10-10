//
//  SWWebViewController.m
//  SWDYD
//
//  Created by zijin on 2018/10/10.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWWebViewController.h"
#import <WebKit/WebKit.h>

@interface SWWebViewController ()<WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *webView;
@end

@implementation SWWebViewController

static NSString * const titleKeyPath = @"title";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //TODO:加载
    NSURL *webURL = [NSURL URLWithString:[self.url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: webURL];
    [self.webView loadRequest:request];
    
    //TODO:kvo监听，获得页面title和加载进度值
    [self.webView addObserver:self forKeyPath:titleKeyPath options:NSKeyValueObservingOptionNew context:NULL];
}

#pragma mark -- KVO的监听代理
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:titleKeyPath]) {
        if (object == self.webView) {
            self.title = self.webView.title;
        }
        else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    [SWProgressHUD sw_showTip:@"加载失败，请重试！"];
}

#pragma mark -- 移除观察者
- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:titleKeyPath];
}

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        _webView.navigationDelegate = self;
        [self.view addSubview:_webView];
    }
    return _webView;
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
