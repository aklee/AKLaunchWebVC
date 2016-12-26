//
//  LaunchWebVC.m
//  LaunchDemo
//
//  Created by ak on 2016/12/26.
//  Copyright © 2016年 AK. All rights reserved.
//

#import "AKLaunchWebVC.h"
#import "AppDelegate.h"
@interface AKLaunchWebVC ()<UIWebViewDelegate>
    @property(nonatomic,strong)UIWebView* webView;
    @end

@implementation AKLaunchWebVC
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIWebView* webV=[[UIWebView alloc]initWithFrame:self.view.bounds];
    webV.delegate=self;
    self.webView=webV;
    
    if (!self.currentLaunchImage) {
        self.currentLaunchImage=[UIImage imageNamed:@"LaunchImage"];
    }
    
    UIImageView* bg= [[UIImageView alloc]initWithImage:self.currentLaunchImage];
   
    bg.frame=self.view.bounds;
  
    [self.view addSubview:bg];
    
    
    if (!self.launchURL) {
        
        NSString* file= [[NSBundle mainBundle] pathForResource:@"guide.html" ofType:nil];
     
        self.launchURL=[NSURL fileURLWithPath:file];
        
    }
    
    NSURLRequest* req = [NSURLRequest requestWithURL:self.launchURL];
    
    [webV loadRequest:req];
    
    
    
}
    
    
#pragma mark  - webView Delegate
    
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    
    NSString* url = request.URL.absoluteString ;
    
    if ([url hasSuffix:@"finishLaunch"]){
        
        NSLog(@"启动H5 加载完毕");
        if(self.launchFinish){
            self.launchFinish();
        }
        
        
        return NO;
    }
    
    return YES;
}
    
    
- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"启动H5 webViewDidStartLoad");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"启动H5 webViewDidFinishLoad");
    
    
    [UIView animateWithDuration:0.1 animations:^{
        
        [self.view addSubview:self.webView];
        [self.view bringSubviewToFront:self.webView];
        
        
    }];
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"didFailLoadWithError");
    
}
@end
