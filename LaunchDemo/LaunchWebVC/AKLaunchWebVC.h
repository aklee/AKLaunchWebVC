//
//  AKLaunchWebVC.h
//  LaunchDemo
//
//  Created by ak on 2016/12/26.
//  Copyright © 2016年 AK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKLaunchWebVC : UIViewController

//default:guide.html 默认本地guide.html
@property(nonatomic,copy)NSURL* launchURL;

//app当前的启动图
@property(nonatomic,copy)UIImage* currentLaunchImage;
    
@property(nonatomic,copy)void(^launchFinish)(void);
@end
