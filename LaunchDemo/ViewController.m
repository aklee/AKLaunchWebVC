//
//  ViewController.m
//  LaunchDemo
//
//  Created by ak on 16/3/6.
//  Copyright © 2016年 AK. All rights reserved.
//

#import "ViewController.h"
#import "AKLaunchWebVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
 }

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan");
    
    
    
}





-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.contentView.backgroundColor=[UIColor clearColor];
        cell.backgroundColor=[UIColor clearColor];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text=@"Single启动页";
            break;
            
        case 1:
            cell.textLabel.text=@"Pager1启动页";
            break;
        case 2:
            cell.textLabel.text=@"Pager2启动页";
            break;
            
        default:
            break;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AKLaunchWebVC* vc=AKLaunchWebVC .new;
    switch (indexPath.row) {
        case 0:
            
            vc.launchURL=[[NSBundle mainBundle] URLForResource:@"guide_Single.html" withExtension:@""];
            break;
            
        case 1:
        {
            vc.launchURL=[[NSBundle mainBundle] URLForResource:@"guide_Page.html" withExtension:@""];
            break;
        }
        case 2:
        {
            vc.launchURL=[[NSBundle mainBundle] URLForResource:@"guide_Page2.html" withExtension:@""];
            break;
        }
        default:
            break;
    }
    
    vc.launchFinish=^{
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    
    [self presentViewController:vc animated:YES completion:nil];
}







@end
