//
//  Zhunbeikaishijiemian.m
//  试做一个天天酷跑
//
//  Created by Administartor on 16-5-17.
//  Copyright (c) 2016年 Administartor. All rights reserved.
//

#import "Zhunbeikaishijiemian.h"

@interface Zhunbeikaishijiemian ()

@end

@implementation Zhunbeikaishijiemian

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //游戏背景音乐
    ViewController *vc = [[ViewController alloc] init];
    
    NSString *beijingyinyueming = [[NSBundle mainBundle] pathForResource:@"youxiyinyue" ofType:@"mp3"];
    
    NSURL *url1 = [NSURL fileURLWithPath:beijingyinyueming];
    
    vc.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:nil];
    
    vc.player.numberOfLoops = -1;
    
    [vc.player prepareToPlay];
    
    [vc.player play];
    UIImageView *imagview = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    imagview.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:imagview];

    //准备动画
    NSString *str = [[NSBundle mainBundle] pathForResource:@"zhunbeikaishijiemian3" ofType:@"mov"];
    
    NSURL *url = [NSURL fileURLWithPath:str];
    
    _bofangqi1 = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    _bofangqi1.view.frame = [UIScreen mainScreen].bounds;
    
    _bofangqi1.view.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    _bofangqi1.controlStyle = MPMovieControlStyleNone;
    
    //重复播放
    _bofangqi1.repeatMode = MPMovieRepeatModeNone;
    
    [self.view addSubview:_bofangqi1.view];
    
    [_bofangqi1 prepareToPlay];
    
    [_bofangqi1 play];
    
    //    //加快转场速度
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    btn.frame = [UIScreen mainScreen].bounds;
//    
////    btn.backgroundColor = [UIColor whiteColor];
//    
//    [self.view addSubview:btn];
//    
//    [btn addTarget:self action:@selector(tiaozhuanjiemian) forControlEvents:UIControlEventTouchDown];
 
//    if (btn.isTouchInside == YES) {
//        [self tiaozhuanjiemian];
//    }else{
//        [self performSelector:@selector(tiaozhuanjiemian) withObject:nil afterDelay:2.8];
//    }
    
    [self performSelector:@selector(tiaozhuanjiemian) withObject:nil afterDelay:1.8];
    
}

- (void)tiaozhuanjiemian
{
//    [_bofangqi.view removeFromSuperview];
    ViewController *vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
    
//    [self.view removeFromSuperview];
    
    //    [self.navigationController popToRootViewControllerAnimated:NO];
    
//    NSLog(@"点击按钮");
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
