//
//  ZEGViewController.m
//  Navigation控制器的封装
//
//  Created by 于世民 on 16/2/26.
//  Copyright © 2016年 于世民. All rights reserved.
//

#define KScreen_Width [UIScreen mainScreen].bounds.size.width
#define KScreen_Height [UIScreen mainScreen].bounds.size.height

#import "ZEGViewController.h"
//头图片高度
const CGFloat BackGroupHeight = 300;
//上下偏移量
const CGFloat HeadFootMove = 300;
//多大高度开始变大
const CGFloat ChangeHeight = 400;

@interface ZEGViewController ()

@property (nonatomic,strong) UIImageView *imageBG;

@property (nonatomic,strong) UIScrollView * BGView;

@end

@implementation ZEGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self createUI];
}

- (void)createUI{
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
     [self.view addSubview:self.tableView];
    self.tableView.contentInset = UIEdgeInsetsMake(BackGroupHeight, 0, 0, 0);
    
    
    self.BGView = [[UIScrollView alloc]init];
    self.BGView.frame = CGRectMake(0, -BackGroupHeight, KScreen_Width, BackGroupHeight);
    self.BGView.backgroundColor = [UIColor yellowColor];
    [self.tableView addSubview:self.BGView];
    
    self.imageBG = [[UIImageView alloc]init];
    self.imageBG.frame = CGRectMake(0, -HeadFootMove, KScreen_Width, 900);
    self.imageBG.image = self.BGimage;
    [self.BGView addSubview:self.imageBG];
    
    CGFloat alpha = 0;
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[[UIColor clearColor]colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.leftBtn addTarget:self action:@selector(leftBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:_leftBtn];
    self.navigationItem.leftBarButtonItem=leftItem;
    
   
    [self.rightBtn addTarget:self action:@selector(rightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:self.rightBtn];
    self.navigationItem.rightBarButtonItem=rightItem;
}

//保证外界调用代理方法不报警告
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"cell";
    return cell;
}

- (void)scrollViewDidScroll:(UITableView *)scrollView{
    
    CGFloat yOffset  = scrollView.contentOffset.y;
    
    CGFloat Alpha = (yOffset+BackGroupHeight)/200;
    
    if (yOffset < -BackGroupHeight) {
        CGRect rect = _BGView.frame;
        rect.origin.y = yOffset;
        rect.size.height =  -yOffset;
        _BGView.frame = rect;
        
        //定住低下 删除后定住顶上
        // self.imageBG.frame = CGRectMake(0, -self.BGView.frame.origin.y - 600, KScreen_Width, 900);
        
        //上下各一半
        self.imageBG.frame = CGRectMake(0, -HeadFootMove-(yOffset+BackGroupHeight)*0.5, KScreen_Width, 900);
    }
    
    if (yOffset <= -ChangeHeight) {
        CGFloat YOffset = (-yOffset-ChangeHeight)/100*30;
        CGFloat XOffset = YOffset;
        
        CGRect rect = _imageBG.frame;
        
        self.imageBG.frame = CGRectMake(rect.origin.x-XOffset, rect.origin.y-YOffset, KScreen_Width + XOffset*2, 2*YOffset + rect.size.height);
    }
    
    if (Alpha > 1) {
        return;
    }else{
        
        CGFloat alpha = Alpha;
        [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[[UIColor whiteColor]colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];
    }
}


- (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

- (void)setBGimage:(UIImage *)BGimage{
    _BGimage = BGimage;
}

- (void)setRightBtn:(UIButton *)rightBtn{
    _rightBtn = rightBtn;
}

- (void)setLeftBtn:(UIButton *)leftBtn{
    _leftBtn = leftBtn;
}

//点击左边按钮实现方法
-(void)leftBtnAction:(UIButton*)leftBtn{
    NSLog(@"点击了左边按钮");
}

//点击右边按钮实现方法
-(void)rightBtnAction:(UIButton*)rightBtn{
    NSLog(@"点击了右边按钮");
}


@end
