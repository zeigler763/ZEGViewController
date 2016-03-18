//
//  ViewController.m
//  Navigation控制器的封装
//
//  Created by 于世民 on 16/2/26.
//  Copyright © 2016年 于世民. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //左边的按钮
    self.leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 25)];
    [self.leftBtn setTitle:@"你好" forState:UIControlStateNormal];
    [self.leftBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //右边的按钮
    self.rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 25)];
    [self.rightBtn setTitle:@"好啊" forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //控制器自带的tableView
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //设置背景图片
    self.BGimage = [UIImage imageNamed:@"BG"];
    
}

//点击左边的按钮
- (void)leftBtnAction:(UIButton *)leftBtn{
    NSLog(@"你好");
}
//点击右边的按钮
- (void)rightBtnAction:(UIButton *)rightBtn{
    NSLog(@"好啊");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"cell";
    return cell;
}


@end
