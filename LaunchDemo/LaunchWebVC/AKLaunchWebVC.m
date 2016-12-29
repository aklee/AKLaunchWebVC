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

-(instancetype)initWithLaunchImage:(UIImage*)launchImage launchH5URL:(NSURL*)launchURL{
    self= [super init];
    self.currentLaunchImage=launchImage;
    self.launchURL=launchURL;
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //WebView
    UIWebView* webV=[[UIWebView alloc]initWithFrame:self.view.bounds];
    
    webV.delegate=self;
    
    webV.scrollView.showsVerticalScrollIndicator=NO;
    
    webV.scrollView.showsHorizontalScrollIndicator=NO;
    
    self.webView=webV;
    
    
    if (!self.currentLaunchImage) {
        
        self.currentLaunchImage=[UIImage imageNamed:@"LaunchImage"];
    }
    
    NSAssert(self.currentLaunchImage!=nil,@"请指定启动图片，避免过度UI卡顿");
    
    UIImageView* bg= [[UIImageView alloc]initWithImage:self.currentLaunchImage];
   
    bg.frame=self.view.bounds;
  
    [self.view addSubview:bg];
    
    NSAssert(self.launchURL!=nil,@"请指定启动H5地址！");
    
    
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
