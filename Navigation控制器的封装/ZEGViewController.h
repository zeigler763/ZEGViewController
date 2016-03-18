//
//  ZEGViewController.h
//  Navigation控制器的封装
//
//  Created by 于世民 on 16/2/26.
//  Copyright © 2016年 于世民. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZEGViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (nonatomic,strong)  UITableView *tableView;

@property (nonatomic,strong) UIButton *leftBtn;

@property (nonatomic,strong) UIButton *rightBtn;
//背景图片
@property (nonatomic, strong) UIImage *BGimage;

//点击左边按钮实现方法
-(void)leftBtnAction:(UIButton*)leftBtn;

//点击右边按钮实现方法
-(void)rightBtnAction:(UIButton*)rightBtn;

@end
