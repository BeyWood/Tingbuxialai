//
//  Kaishijiemian.m
//  试做一个天天酷跑
//
//  Created by Administartor on 16-5-14.
//  Copyright (c) 2016年 Administartor. All rights reserved.
//

#import "Kaishijiemian.h"

@interface Kaishijiemian ()

@end

@implementation Kaishijiemian

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"开始界面");
    
//    Zhunbeikaishijiemian *zhunbeikaishijiemian = [[Zhunbeikaishijiemian alloc]init];
//    
//    [zhunbeikaishijiemian.player stop];
    
    //背景

    UIImage *beijing = [UIImage imageNamed:@"kaishibeijing1.png"];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width)];
    
    imageview.image = beijing;
    
    [self.view addSubview:imageview];
    
    //人物
    [self renwu];
    
    //开始游戏
    [self kaishiyouxi];
    
    //关于
    [self guanyuanniu];
    
    //游戏背景音乐
//    NSLog(@"%d",_chuangjiancishu);

        NSString *beijingyinyueming = [[NSBundle mainBundle] pathForResource:@"jinchangyinyue" ofType:@"mp3"];
        
        NSURL *url1 = [NSURL fileURLWithPath:beijingyinyueming];
        
        _jinchangyinyue = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:nil];
        
        _jinchangyinyue.numberOfLoops = -1;
        
        [_jinchangyinyue prepareToPlay];
        
        [_jinchangyinyue play];

}

- (void)linshianniufangfa
{
    Suanfenjiemian *suanfen = [[Suanfenjiemian alloc] init];
    
    [self.navigationController pushViewController:suanfen animated:NO];
}

//人物
- (void)renwu
{
    UIImage *renwu = [UIImage imageNamed:@"kaishijinqiangxiaoshuai"];
    
    _renwuimageview = [[UIImageView alloc] initWithImage:renwu];
    
    _renwuimageview.frame = CGRectMake([UIScreen mainScreen].applicationFrame.size.height / 3, [UIScreen mainScreen].applicationFrame.size.width / 7, _renwuimageview.frame.size.width / 2, _renwuimageview.frame.size.height / 2);
    
    [self.view addSubview:_renwuimageview];
    
    NSLog(@"%f",[UIScreen mainScreen].bounds.size.height / 2);
}

//开始游戏
- (void)kaishiyouxi
{
    UIImage *kaishiyouxi1 = [UIImage imageNamed:@"kaishiyouxi"];
    
    UIImageView *kaishiyouxiimageview = [[UIImageView alloc] initWithImage:kaishiyouxi1];
    
//    kaishiyouxiimageview.center = CGPointMake(_renwuimageview.frame.origin.x, _renwuimageview.frame.origin.y + 100);
    
    kaishiyouxiimageview.frame = CGRectMake(_renwuimageview.frame.origin.x - 30, _renwuimageview.frame.origin.y + _renwuimageview.frame.size.height, 175, 60);
    
    [self.view addSubview:kaishiyouxiimageview];
    
    UIButton *kaishiyouxianniu = [UIButton buttonWithType:UIButtonTypeCustom];
    
    kaishiyouxianniu.frame = kaishiyouxiimageview.frame;
    
    [self.view addSubview:kaishiyouxianniu];
    
    [kaishiyouxianniu addTarget:self action:@selector(youxikaishile) forControlEvents:UIControlEventTouchDown];
}

- (void)youxikaishile
{
    NSLog(@"点击开始按钮");
    
    [_jinchangyinyue stop];
    
    ViewController *vc1 = [[ViewController alloc] init];
    
    [self.navigationController pushViewController:vc1 animated:NO];
    
//    Zhunbeikaishijiemian *zhunbeijiemian = [[Zhunbeikaishijiemian alloc] init];
//    
//    [self.navigationController pushViewController:zhunbeijiemian animated:NO];
}

//关于
- (void)guanyuanniu
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setBackgroundImage:[UIImage imageNamed:@"guanyu"] forState:UIControlStateNormal];
    
    btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.height - 50, 9, 41, 41);
    
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(guangyufangfa) forControlEvents:UIControlEventTouchDown];
}

- (void)guangyufangfa
{
    NSLog(@"点击关于");
    
    [_jinchangyinyue stop];
    
    Guanyujiemian *guanyujiemian = [[Guanyujiemian alloc] init];
    
    [self.navigationController pushViewController:guanyujiemian animated:NO];
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
