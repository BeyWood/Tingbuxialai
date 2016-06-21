//
//  ViewController.h
//  试做一个天天酷跑
//
//  Created by Administartor on 16-5-9.
//  Copyright (c) 2016年 Administartor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "Kaishijiemian.h"
#import "Zhunbeikaishijiemian.h"
#import "WeiboSDK.h"
#import "HttpRequestDemoTableViewController.h"
#import "AppDelegate.h"

@interface ViewController : UIViewController

//计时器
@property (nonatomic,strong) NSTimer *shijian;

//时间累加
@property NSInteger shijianleijia;

//刷新次数
@property (nonatomic,strong) CADisplayLink *gameTimer;

//人物
@property (nonatomic,strong) UIImageView *renwu;

//炸弹
@property (nonatomic,strong) UIImageView *zhadan;

////炸弹发射
//@property (nonatomic,strong) CADisplayLink *zhadankaishifashe;

//柱子
@property (nonatomic,strong) UIImageView *zhuzi;

//柱子2
@property (nonatomic,strong) UIImageView *zhuzi2;

//柱子3
@property (nonatomic,strong) UIImageView *zhuzi3;

//柱子4
@property (nonatomic,strong) UIImageView *zhuzi4;

//柱子5
@property (nonatomic,strong) UIImageView *zhuzi5;

//人物移动速度
@property CGPoint renwusudu;

//设置一个方块
@property (nonatomic,strong) UIImageView *fangkuai;

//跳跃按钮
@property (strong, nonatomic) UIButton *tiaoyue;

//人物跳跃
@property (nonatomic,strong) CADisplayLink *renwutiaoyue;

//人物落下
@property (nonatomic,strong) CADisplayLink *renwuluoxia;

//人物蹲下
@property (nonatomic,strong) UIButton *dunxia;

@property (nonatomic,strong) UIImageView *dunxiatupian;

//游戏背景音乐
@property (nonatomic,strong) AVAudioPlayer *player;

////背景
//@property (nonatomic,strong) UIScrollView *scrollview;

@property (nonatomic,strong) MPMoviePlayerController *bofangqi;

////地板
//@property (nonatomic,strong) UIView *diban;
//
////地面
//@property (nonatomic,strong) MPMoviePlayerController *daqiao1;
//
////地面2
//@property (nonatomic,strong) AVPlayer   *player_0;
//
////地板2
//@property (nonatomic,strong) UIImageView *imageview;

//大桥1
@property (nonatomic,strong) UIImageView *daqiao1imageview;

//大桥2
@property (nonatomic,strong) UIImageView *daqiao2imageview;

//暂停
@property (nonatomic,strong) UIButton *zanting;

//继续游戏
@property (nonatomic,strong) UIButton *jixuyouxi;

@property (nonatomic,strong) UIView *zantingview;

@property (nonatomic,strong) UIImageView *zantingimageview;

//重新开始
@property (nonatomic,strong) UIButton *chongxinkaishi;

//主界面
@property (nonatomic,strong) UIButton *zhujiemian;

////准备开始
//@property (nonatomic,strong) AVPlayer *zhunbeikaishidonghua;

//播放次数
@property NSInteger bofanfcishi;

//表现分
@property (nonatomic,strong) UIImageView *biaoxianfenimageview;
@property (nonatomic,strong) UILabel *biaoxianfenlable;

//距离
@property (nonatomic,strong) UILabel *julilable;
@property NSInteger mishushuzhi;

//金币
@property (nonatomic,strong) UIImageView *jinbi1;
@property (nonatomic,strong) UIImageView *jinbi2;
@property (nonatomic,strong) UIImageView *jinbi3;
@property (nonatomic,strong) UIImageView *jinbi4;
@property (nonatomic,strong) UIImageView *jinbi5;
@property (nonatomic,strong) UIImageView *jinbi6;
@property (nonatomic,strong) UIImageView *jinbi7;
@property (nonatomic,strong) UIImageView *jinbi8;
@property (nonatomic,strong) UIImageView *jinbi9;
@property (nonatomic,strong) UIImageView *jinbi10;
@property (nonatomic,strong) UIImageView *jinbi11;
@property (nonatomic,strong) UIImageView *jinbi12;
@property (nonatomic,strong) UIImageView *jinbi13;

//金币总数
@property NSInteger jinbizongshu;

//准备开始
@property (nonatomic,strong) MPMoviePlayerController *bofangqi1;

//准备开始界面底层
@property (nonatomic,strong) UIView *diceng;

@end
