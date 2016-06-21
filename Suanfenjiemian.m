//
//  Suanfenjiemian.m
//  试做一个天天酷跑
//
//  Created by Administartor on 16-5-18.
//  Copyright (c) 2016年 Administartor. All rights reserved.
//

#import "Suanfenjiemian.h"
#import <AVFoundation/AVFoundation.h>

@interface Suanfenjiemian ()

@end

@implementation Suanfenjiemian

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *suanfenbeijing = [UIImage imageNamed:@"Suanfenjiemianbeijing"];
    
    UIImageView *imageview = [[UIImageView alloc] initWithImage:suanfenbeijing];
    
    imageview.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    
    [self.view addSubview:imageview];
    
    UIImageView *xianshipai = [[UIImageView alloc] init];
    
    xianshipai.frame = CGRectMake(50, 20, 260, 280);
    
    xianshipai.image = [UIImage imageNamed:@"jingdianmoshizongfen2"];
    
    [self.view addSubview:xianshipai];
    
    UIImageView *suanfenrenwu = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fenshubji"]];
    
    suanfenrenwu.frame = CGRectMake(xianshipai.frame.origin.x + 280, 20, 168, 242);
    
    [self.view addSubview:suanfenrenwu];
    
    UIButton *suanfenfanhuianniu = [UIButton buttonWithType:UIButtonTypeCustom];
    
    suanfenfanhuianniu.frame = CGRectMake(xianshipai.frame.origin.x + 260, 250, 160, 50);
    
    [suanfenfanhuianniu setBackgroundImage:[UIImage imageNamed:@"kanwanjieguofanhuianniu"] forState:UIControlStateNormal];
    
    [self.view addSubview:suanfenfanhuianniu];
    
    [suanfenfanhuianniu addTarget:self action:@selector(fanhuikaishijiemian) forControlEvents:UIControlEventTouchDown];
    
    //1.获得音效文件的全路径
    
    NSString *str = [[NSBundle mainBundle] pathForResource:@"defen" ofType:@"wav"];
    
    NSURL *url = [NSURL fileURLWithPath:str];
    
    //2.加载音效文件，创建音效ID（SoundID,一个ID对应一个音效文件）
    SystemSoundID soundID=2;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    
    //把需要销毁的音效文件的ID传递给它既可销毁
    //AudioServicesDisposeSystemSoundID(soundID);
    
    //3.播放音效文件
    //下面的两个函数都可以用来播放音效文件，第一个函数伴随有震动效果
//    AudioServicesPlayAlertSound(soundID);
    //AudioServicesPlaySystemSound(<#SystemSoundID inSystemSoundID#>)
     AudioServicesPlaySystemSound(soundID);
}

- (void)fanhuikaishijiemian
{
    Kaishijiemian *kaishijiemian = [[Kaishijiemian alloc] init];
    
    [self.navigationController pushViewController:kaishijiemian animated:NO];
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
