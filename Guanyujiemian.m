//
//  Guanyujiemian.m
//  试做一个天天酷跑
//
//  Created by Administartor on 16-5-14.
//  Copyright (c) 2016年 Administartor. All rights reserved.
//

#import "Guanyujiemian.h"

@interface Guanyujiemian ()

@end

@implementation Guanyujiemian

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *image = [UIImage imageNamed:@"guanyu2"];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width)];
    
    imageview.image = image;
    
    [self.view addSubview:imageview];
    
    UILabel *zuozhe = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.height - 100, [UIScreen mainScreen].bounds.size.width - 50, 100, 50)];
    
    zuozhe.text = @"作者：Win灬eR健";
    
    zuozhe.backgroundColor = [UIColor clearColor];
    
    zuozhe.font = [UIFont systemFontOfSize:10];
    
    [imageview addSubview:zuozhe];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = imageview.frame;
    
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(fanhuizhujiemian) forControlEvents:UIControlEventTouchDown];
}

- (void)fanhuizhujiemian
{
    Kaishijiemian *kaishijiemian = [[Kaishijiemian alloc]init];
    
    [self.navigationController pushViewController:kaishijiemian animated:NO];
    
//    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
