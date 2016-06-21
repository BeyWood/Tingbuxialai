//
//  ViewController.m
//  试做一个天天酷跑
//
//  Created by Administartor on 16-5-9.
//  Copyright (c) 2016年 Administartor. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () <WBHttpRequestDelegate>
{
    WBSDKRelationshipButton *relationshipButton;
    WBSDKCommentButton *commentButton;
}

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIButton *shareButton;
@property (nonatomic, retain) UISwitch *textSwitch;
@property (nonatomic, retain) UISwitch *imageSwitch;
@property (nonatomic, retain) UISwitch *mediaSwitch;

//自己设置的分享内容
@property (nonatomic,strong) NSString *fenxiangdefen;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    //地板
//    [self dibanfangfa];
    
//    //地面
//    [self daqiao];
    
//    //地面2
//    [self dimian2];
    
//    //地板2
//    [self gundong];
    
    //准备开始
    [self zhunbeikaishi];
    
    [self performSelector:@selector(youxikaishi) withObject:nil afterDelay:1.8];
    
//    [self youxikaishi];
    
    
//    //计时器
//    _shijian = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(zhangaiwujincheng) userInfo:nil repeats:YES];
//    
//    //人物的位置
//    
//    NSMutableArray *array = [NSMutableArray arrayWithCapacity:4];
//    _renwu = [[UIImageView alloc] initWithFrame:CGRectMake(150, 170, 84, 70)];
//    
//    //    _renwu.image = array[0];
//    
//    for (NSInteger i=1; i<=12; i++) {
//        NSString *str = [NSString stringWithFormat:@"loading_%02ld",(long)i];
//        UIImage *image = [UIImage imageNamed:str];
//        
//        [array addObject:image];
//    }
//    
//    [self.view addSubview:_renwu];
//    
//    // 4. 播放序列帧动画
//    // 1) 设置序列帧动画数组
//    [_renwu setAnimationImages:array];
//    // 2) 设置序列帧动画时长，播放一遍使用的时间
//    [_renwu setAnimationDuration:1.0f];
//    // 3) 开始动画
//    [_renwu startAnimating];
//    
//    //人物移动速度
//    _renwusudu = CGPointMake(0, -1);
//    
//    //初始化CADisplayLink
//    _gameTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(jiaceshifouzhuangzaiyiqi:)];
//    
//    //把CADisplayLink加入线程
//    [_gameTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
//    
////    //设置一个方块
////    _fangkuai = [[UIImageView alloc] initWithFrame:CGRectMake(150, 200, 50, 50)];
////    
////    _fangkuai.backgroundColor = [UIColor redColor];
////    
////    [self.view addSubview:_fangkuai];
//    
//    //加载跳跃方块
//    _tiaoyue = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    _tiaoyue.frame = CGRectMake([UIScreen mainScreen].bounds.size.height - 70, [UIScreen mainScreen].bounds.size.width - 70, 60, 60);
//    
//    UIImage *tiaoyueimage = [UIImage imageNamed:@"tiaoyue"];
//    
//    [_tiaoyue setBackgroundImage:tiaoyueimage forState:UIControlStateNormal];
//    
//    _tiaoyue.alpha = 0.5;
//    
//    [self.view addSubview:_tiaoyue];
//
//    [self.tiaoyue addTarget:self action:@selector(tiaoyuefangfa) forControlEvents:UIControlEventTouchDown];
//    
//    _renwutiaoyue = [CADisplayLink displayLinkWithTarget:self selector:@selector(tiaoyuefangfa)];
//    
//    [_renwutiaoyue addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
//    
//    [_renwutiaoyue setPaused:YES];
//    
//    //人物落下
//    _renwuluoxia = [CADisplayLink displayLinkWithTarget:self selector:@selector(renwuluoxiafangfa)];
//    
//    [_renwuluoxia addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
//    
//    [_renwuluoxia setPaused:YES];
//    
//    //人物蹲下按钮
//    _dunxia = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    _dunxia.frame = CGRectMake(10, [UIScreen mainScreen].bounds.size.width - 70, 60, 60);
//    
//    UIImage *dunxiaimage = [UIImage imageNamed:@"dunxia"];
//    
//    [_dunxia setBackgroundImage:dunxiaimage forState:UIControlStateNormal];
//    
//    _dunxia.alpha = 0.5;
//    
//    [self.view addSubview:_dunxia];
//    
//    //人物蹲下图片
//    [_dunxia addTarget:self action:@selector(renwudunxiafangfa) forControlEvents:UIControlEventTouchDown];
//    
//    [_dunxia addTarget:self action:@selector(renwuzhanqi) forControlEvents:UIControlEventTouchUpInside];
//    
//    _dunxiatupian = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paxiadejinqiangxiaoshuai"]];
//    
//    _dunxiatupian.frame = CGRectMake(-1000, 1000, 1, 1);
//    
//    [self.view insertSubview:_dunxiatupian aboveSubview:_renwu];
//    
//    _dunxiatupian.hidden = YES;
//    
//    //游戏背景音乐
//    NSString *beijingyinyueming = [[NSBundle mainBundle] pathForResource:@"youxiyinyue" ofType:@"mp3"];
//    
//    NSURL *url1 = [NSURL fileURLWithPath:beijingyinyueming];
//    
//    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:nil];
//    
//    _player.numberOfLoops = -1;
//    
//    [_player prepareToPlay];
//    
//    [_player play];
//    
//    //背景滚动
//    [self beijing];
//    
//    //炸弹准备
//    [self zhadandongzuo];
//    
//    //柱子准备
//    [self zhuzidongzuo];
//    
//    //大桥
//    [self daqiao2];
//    
//    //暂停按钮
//    [self zantinganniu];
//    
//    //暂停方法
//    [_zanting addTarget:self action:@selector(zantingfangfa) forControlEvents:UIControlEventTouchDown];
//    
////    [_jixuyouxi addTarget:self action:@selector(jixuyouxifangfa) forControlEvents:UIControlEventTouchDown];
//    
//    //距离
//    [self juli];
//    
//    //表现分
//    [self biaoxianfen];
//    
////    //准备开始
////    [self zhunbeikaishi];
//    
//    //金币
//    [self jinbi];
    
    
}

- (void)youxikaishi
{
    //计时器
    _shijian = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(zhangaiwujincheng) userInfo:nil repeats:YES];
    
    //人物的位置
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:4];
    _renwu = [[UIImageView alloc] initWithFrame:CGRectMake(150, 170, 84, 70)];
    
    //    _renwu.image = array[0];
    
    for (NSInteger i=1; i<=12; i++) {
        NSString *str = [NSString stringWithFormat:@"loading_%02ld",(long)i];
        UIImage *image = [UIImage imageNamed:str];
        
        [array addObject:image];
    }
    
    [self.view addSubview:_renwu];
    
    // 4. 播放序列帧动画
    // 1) 设置序列帧动画数组
    [_renwu setAnimationImages:array];
    // 2) 设置序列帧动画时长，播放一遍使用的时间
    [_renwu setAnimationDuration:1.0f];
    // 3) 开始动画
    [_renwu startAnimating];
    
    //人物移动速度
    _renwusudu = CGPointMake(0, -1);
    
    //初始化CADisplayLink
    _gameTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(jiaceshifouzhuangzaiyiqi:)];
    
    //把CADisplayLink加入线程
    [_gameTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    //    //设置一个方块
    //    _fangkuai = [[UIImageView alloc] initWithFrame:CGRectMake(150, 200, 50, 50)];
    //
    //    _fangkuai.backgroundColor = [UIColor redColor];
    //
    //    [self.view addSubview:_fangkuai];
    
    //加载跳跃方块
    _tiaoyue = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _tiaoyue.frame = CGRectMake([UIScreen mainScreen].bounds.size.height - 90, [UIScreen mainScreen].bounds.size.width - 90, 80, 80);
    
    UIImage *tiaoyueimage = [UIImage imageNamed:@"tiaoyue"];
    
    [_tiaoyue setBackgroundImage:tiaoyueimage forState:UIControlStateNormal];
    
    _tiaoyue.alpha = 0.5;
    
    [self.view addSubview:_tiaoyue];
    
    [self.tiaoyue addTarget:self action:@selector(tiaoyuefangfa) forControlEvents:UIControlEventTouchDown];
    
    _renwutiaoyue = [CADisplayLink displayLinkWithTarget:self selector:@selector(tiaoyuefangfa)];
    
    [_renwutiaoyue addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    [_renwutiaoyue setPaused:YES];
    
    //人物落下
    _renwuluoxia = [CADisplayLink displayLinkWithTarget:self selector:@selector(renwuluoxiafangfa)];
    
    [_renwuluoxia addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    [_renwuluoxia setPaused:YES];
    
    //人物蹲下按钮
    _dunxia = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _dunxia.frame = CGRectMake(10, [UIScreen mainScreen].bounds.size.width - 90, 80, 80);
    
    UIImage *dunxiaimage = [UIImage imageNamed:@"dunxia"];
    
    [_dunxia setBackgroundImage:dunxiaimage forState:UIControlStateNormal];
    
    _dunxia.alpha = 0.5;
    
    [self.view addSubview:_dunxia];
    
    //人物蹲下图片
    [_dunxia addTarget:self action:@selector(renwudunxiafangfa) forControlEvents:UIControlEventTouchDown];
    
    [_dunxia addTarget:self action:@selector(renwuzhanqi) forControlEvents:UIControlEventTouchUpInside];
    
    _dunxiatupian = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paxiadejinqiangxiaoshuai"]];
    
    _dunxiatupian.frame = CGRectMake(-1000, 1000, 1, 1);
    
    [self.view insertSubview:_dunxiatupian aboveSubview:_renwu];
    
    _dunxiatupian.hidden = YES;
    
//    //游戏背景音乐
//    NSString *beijingyinyueming = [[NSBundle mainBundle] pathForResource:@"youxiyinyue" ofType:@"mp3"];
//    
//    NSURL *url1 = [NSURL fileURLWithPath:beijingyinyueming];
//    
//    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:nil];
//    
//    _player.numberOfLoops = -1;
//    
//    [_player prepareToPlay];
//    
//    [_player play];
    
    //背景滚动
    [self beijing];
    
    //炸弹准备
    [self zhadandongzuo];
    
    //柱子准备
    [self zhuzidongzuo];
    
    //柱子准备2
    [self zhuzidongzuo2];
    
    //柱子准备3
    [self zhuzidongzuo3];
    
    //柱子准备4
    [self zhuzidongzuo4];
    
    //柱子准备5
    [self zhuzidongzuo5];
    
    //大桥
    [self daqiao2];
    
    //暂停按钮
    [self zantinganniu];
    
    //暂停方法
    [_zanting addTarget:self action:@selector(zantingfangfa) forControlEvents:UIControlEventTouchDown];
    
    //    [_jixuyouxi addTarget:self action:@selector(jixuyouxifangfa) forControlEvents:UIControlEventTouchDown];
    
    //距离
    [self juli];
    
    //表现分
    [self biaoxianfen];
    
    //    //准备开始
    //    [self zhunbeikaishi];
    
    //金币
    [self jinbi];
}


//障碍物检测，炸弹、柱子等（时间）
- (void)zhangaiwujincheng
{
    [self mishu];
    [self biaoxianfenshuaxin];
}

- (void)jiaceshifouzhuangzaiyiqi:(CADisplayLink *)sender
{
//    NSLog(@"刷新次数");
    
    if (CGRectIntersectsRect([_renwu frame], [_zhadan frame])) {
        NSLog(@"撞到炸弹了");
        
        if (_bofanfcishi == 0) {
            [self youxijieshu];
            [_bofangqi pause];
            [_player stop];
            [_renwutiaoyue invalidate];
            [_renwuluoxia invalidate];
            [_shijian invalidate];
            [_tiaoyue setUserInteractionEnabled:NO];
            [_dunxia setUserInteractionEnabled:NO];
            
            _bofanfcishi = 1;
        }
        
//        [_gameTimer invalidate];
        
        
        _gameTimer.frameInterval = 2;
        
        CGPoint zuobiao = _renwu.center;
        zuobiao.x -= 4;
        _renwu.center = zuobiao;
        CGPoint zhandanzuobiao = _zhadan.center;
        zhandanzuobiao.x = zuobiao.x;
        _zhadan.center = zhandanzuobiao;
        
        if (zuobiao.x < -10 && _bofanfcishi == 1) {
            [NSThread sleepForTimeInterval:2];
//            [self performSelector:@selector(jifenjiemian) withObject:nil];
            [self suanfenyemian];
            _bofanfcishi = 2;
            [_gameTimer invalidate];
        }

    }
    
    if (CGRectIntersectsRect([_renwu frame], [_zhuzi frame])) {
        NSLog(@"被柱子卡住了");
        
//        [_gameTimer invalidate];
//        [_bofangqi pause];
        
        if (_zhuzi.center.x > _renwu.center.x) {
            CGPoint zuobiao = _renwu.center;
        zuobiao.x -= 3;
        _renwu.center = zuobiao;
        
        if (zuobiao.x < -10) {
            
            if (_bofanfcishi == 0) {
                [self youxijieshu];
                [_bofangqi pause];
                [_player stop];
                [_renwutiaoyue invalidate];
                [_renwuluoxia invalidate];
                [_shijian invalidate];
                [_tiaoyue setUserInteractionEnabled:NO];
                [_dunxia setUserInteractionEnabled:NO];
                
                
                [NSThread sleepForTimeInterval:3];
                [self suanfenyemian];
                _bofanfcishi = 2;
                [_gameTimer invalidate];
            }
            
            
        }
    }
        
        
}
    
    if (CGRectIntersectsRect([_renwu frame], [_zhuzi2 frame])) {
        NSLog(@"被柱子卡住了2");
        
        //        [_gameTimer invalidate];
        //        [_bofangqi pause];
        
        if (_zhuzi2.center.x > _renwu.center.x) {
            CGPoint zuobiao = _renwu.center;
            zuobiao.x -= 3;
            _renwu.center = zuobiao;
            
            if (zuobiao.x < -10) {
                
                if (_bofanfcishi == 0) {
                    [self youxijieshu];
                    [_bofangqi pause];
                    [_player stop];
                    [_renwutiaoyue invalidate];
                    [_renwuluoxia invalidate];
                    [_shijian invalidate];
                    [_tiaoyue setUserInteractionEnabled:NO];
                    [_dunxia setUserInteractionEnabled:NO];
                    
                    
                    [NSThread sleepForTimeInterval:3];
                    [self suanfenyemian];
                    _bofanfcishi = 2;
                    [_gameTimer invalidate];
                }
                
                
            }
        }
        
        
    }
    
    if (CGRectIntersectsRect([_renwu frame], [_zhuzi3 frame])) {
        NSLog(@"被柱子卡住了");
        
        //        [_gameTimer invalidate];
        //        [_bofangqi pause];
        
        if (_zhuzi3.center.x > _renwu.center.x) {
            CGPoint zuobiao = _renwu.center;
            zuobiao.x -= 3;
            _renwu.center = zuobiao;
            
            if (zuobiao.x < -10) {
                
                if (_bofanfcishi == 0) {
                    [self youxijieshu];
                    [_bofangqi pause];
                    [_player stop];
                    [_renwutiaoyue invalidate];
                    [_renwuluoxia invalidate];
                    [_shijian invalidate];
                    [_tiaoyue setUserInteractionEnabled:NO];
                    [_dunxia setUserInteractionEnabled:NO];
                    
                    
                    [NSThread sleepForTimeInterval:3];
                    [self suanfenyemian];
                    _bofanfcishi = 2;
                    [_gameTimer invalidate];
                }
                
                
            }
        }
        
        
    }
    
    if (CGRectIntersectsRect([_renwu frame], [_zhuzi4 frame])) {
        NSLog(@"被柱子卡住了");
        
        //        [_gameTimer invalidate];
        //        [_bofangqi pause];
        
        if (_zhuzi4.center.x > _renwu.center.x) {
            CGPoint zuobiao = _renwu.center;
            zuobiao.x -= 3;
            _renwu.center = zuobiao;
            
            if (zuobiao.x < -10) {
                
                if (_bofanfcishi == 0) {
                    [self youxijieshu];
                    [_bofangqi pause];
                    [_player stop];
                    [_renwutiaoyue invalidate];
                    [_renwuluoxia invalidate];
                    [_shijian invalidate];
                    [_tiaoyue setUserInteractionEnabled:NO];
                    [_dunxia setUserInteractionEnabled:NO];
                    
                    
                    [NSThread sleepForTimeInterval:3];
                    [self suanfenyemian];
                    _bofanfcishi = 2;
                    [_gameTimer invalidate];
                }
                
                
            }
        }
        
        
    }
    
    if (CGRectIntersectsRect([_renwu frame], [_zhuzi5 frame])) {
        NSLog(@"被柱子卡住了");
        
        //        [_gameTimer invalidate];
        //        [_bofangqi pause];
        
        if (_zhuzi5.center.x > _renwu.center.x) {
            CGPoint zuobiao = _renwu.center;
            zuobiao.x -= 3;
            _renwu.center = zuobiao;
            
            if (zuobiao.x < -10) {
                
                if (_bofanfcishi == 0) {
                    [self youxijieshu];
                    [_bofangqi pause];
                    [_player stop];
                    [_renwutiaoyue invalidate];
                    [_renwuluoxia invalidate];
                    [_shijian invalidate];
                    [_tiaoyue setUserInteractionEnabled:NO];
                    [_dunxia setUserInteractionEnabled:NO];
                    
                    
                    [NSThread sleepForTimeInterval:3];
                    [self suanfenyemian];
                    _bofanfcishi = 2;
                    [_gameTimer invalidate];
                }
                
                
            }
        }
        
        
    }




    
    if (CGRectIntersectsRect([_dunxiatupian frame], [_zhadan frame])) {
        NSLog(@"撞到炸弹了");
        
//        if (_bofanfcishi == 0) {
//            [self youxijieshu];
//            [_bofangqi pause];
//            [_player stop];
//            [_renwutiaoyue invalidate];
//            [_renwuluoxia invalidate];
//            [_shijian invalidate];
//            [_tiaoyue setUserInteractionEnabled:NO];
//            [_dunxia setUserInteractionEnabled:NO];
//            
//            _bofanfcishi = 1;
//        }
//        
//        //        [_gameTimer invalidate];
//        
//        
//        _gameTimer.frameInterval = 2;
//        
//        CGPoint zuobiao = _dunxiatupian.center;
//        zuobiao.x -= 4;
//        _dunxiatupian.center = zuobiao;
//        CGPoint zhandanzuobiao = _zhadan.center;
//        zhandanzuobiao.x = zuobiao.x;
//        _zhadan.center = zhandanzuobiao;
//        
//        if (zuobiao.x < -10 && _bofanfcishi == 1) {
//            [NSThread sleepForTimeInterval:2];
//            //            [self performSelector:@selector(jifenjiemian) withObject:nil];
//            [self suanfenyemian];
//            _bofanfcishi = 2;
//            [_gameTimer invalidate];
//        }
        
        if (_bofanfcishi == 0) {
            [self youxijieshu];
            [_bofangqi pause];
            [_player stop];
            [_renwutiaoyue invalidate];
            [_renwuluoxia invalidate];
            [_shijian invalidate];
            [_tiaoyue setUserInteractionEnabled:NO];
            [_dunxia setUserInteractionEnabled:NO];
            
            _bofanfcishi = 1;
        }
        
        //        [_gameTimer invalidate];
        
        
        _gameTimer.frameInterval = 2;
        
        CGPoint zuobiao = _dunxiatupian.center;
        zuobiao.x -= 4;
        _dunxiatupian.center = zuobiao;
        CGPoint zhandanzuobiao = _zhadan.center;
        zhandanzuobiao.x = zuobiao.x;
        _zhadan.center = zhandanzuobiao;
        
        if (zuobiao.x < -10 && _bofanfcishi == 1) {
            [NSThread sleepForTimeInterval:2];
            //            [self performSelector:@selector(jifenjiemian) withObject:nil];
            [self suanfenyemian];
            _bofanfcishi = 2;
            [_gameTimer invalidate];
        }

        
    }
    
    if (CGRectIntersectsRect([_dunxiatupian frame], [_zhuzi frame])) {
        NSLog(@"撞到柱子了");
        
//        [_gameTimer invalidate];
//        [_bofangqi pause];
        
        NSLog(@"被柱子卡住了");
        
        //        [_gameTimer invalidate];
        //        [_bofangqi pause];
        
        if (_zhuzi.center.x > _dunxiatupian.center.x) {
            CGPoint zuobiao = _dunxiatupian.center;
            zuobiao.x -= 3;
            _dunxiatupian.center = zuobiao;
            
            if (zuobiao.x < -10 && _bofanfcishi == 1) {
                
                if (_bofanfcishi == 0) {
                    [self youxijieshu];
                    [_bofangqi pause];
                    [_player stop];
                    [_renwutiaoyue invalidate];
                    [_renwuluoxia invalidate];
                    [_shijian invalidate];
                    [_tiaoyue setUserInteractionEnabled:NO];
                    [_dunxia setUserInteractionEnabled:NO];
                    
                    
                    [NSThread sleepForTimeInterval:3];
                    [self suanfenyemian];
                    _bofanfcishi = 2;
                    [_gameTimer invalidate];
                }
                
                
            }
        }

    }
    
    //障碍物
    //1.炸弹
    
    _shijianleijia++;
    
    NSLog(@"%ld",(long)_shijianleijia);
    
    //炸弹提示 = 炸弹发射 - 30
    //炸弹和柱子回场一定要两个等于号，因为要瞬间回场，不然就会一直卡在那里
    //金币图的设置也一定要用两个等于号，否则走到一半就会消失
    
    if (_shijianleijia == 69) {
        [self zhadanlailetishi];
    }
    
    if (_shijianleijia > 99 && _shijianleijia < 400) {
        
        //柱子回场
        _zhuzi.frame = CGRectMake(586, 0, 44, 180);
        
        [self zhadanfashe];
        [self zhuzilaile];
        [self zhuzilaile2];
        [self zhuzilaile3];
        [self zhuzilaile4];
        [self zhuzilaile5];
        
//        NSLog(@"执行方法");
    }
    
    if (_shijianleijia == 400) {
        //炸弹回场
        _zhadan.frame = CGRectMake(568, 200, 33, 20);
        [self jinbitu];
        _zhuzi.frame = CGRectMake(586, 0, 44, 180);
        _zhuzi2.frame = CGRectMake(100 + 586, 0, 44, 180);
        _zhuzi3.frame = CGRectMake(674 + 586, 0, 44, 180);
        _zhuzi4.frame = CGRectMake(718 + 586, 0, 44, 180);
        _zhuzi5.frame = CGRectMake(762 + 586, 0, 44, 180);
    }
    
    if (_shijianleijia == 470) {
        [self zhadanlailetishi];
    }
    
    if (_shijianleijia > 500 && _shijianleijia < 900) {
        
        [self zhuzilaile];
        [self zhuzilaile2];
        [self zhuzilaile3];
        [self zhuzilaile4];
        [self zhuzilaile5];
        
        [self zhadanfashe];
    }
    
    if (_shijianleijia == 600) {
        [self jinbitu];
    }
    
    if (_shijianleijia == 900) {
        [self dierfujinbitu];
    }
    
    if (_shijianleijia == 970) {
        [self dierfujinbitu];
        _zhadan.frame = CGRectMake(568, 200, 33, 20);
    }
    
    if (_shijianleijia > 1000 && _shijianleijia < 1400)
    {
//        NSLog(@"执行方法2");
        
        [self zhuzilaile];
        [self zhuzilaile2];
        [self zhuzilaile3];
        [self zhuzilaile4];
        [self zhuzilaile5];
    }
    
    if (_shijianleijia == 1300) {
        _zhadan.frame = CGRectMake(568, 200, 33, 20);
        [self jinbitu];
    }
    
    if (_shijianleijia == 1470) {
        [self zhadanlailetishi];
    }
    
    if (_shijianleijia > 1500 && _shijianleijia < 1800) {
        [self zhadanfashe];
    }
    
    if (_shijianleijia == 1600) {
        [self dierfujinbitu];
        
        _zhadan.frame = CGRectMake(588, 200, 33, 20);
        
        _zhuzi.frame = CGRectMake(586, 0, 44, 180);
        _zhuzi2.frame = CGRectMake(100 + 586, 0, 44, 180);
        _zhuzi3.frame = CGRectMake(674 + 586, 0, 44, 180);
        _zhuzi4.frame = CGRectMake(718 + 586, 0, 44, 180);
        _zhuzi5.frame = CGRectMake(762 + 586, 0, 44, 180);
    }
    
    if (_shijianleijia > 1601 && _shijianleijia < 1900) {
        [self zhuzilaile2];
        [self zhuzilaile3];
        [self zhuzilaile4];
        [self zhuzilaile5];
    }
    
    if (_shijianleijia == 2000) {
        
        _zhadan.frame = CGRectMake(588, 200, 33, 20);
        
        _zhuzi.frame = CGRectMake(586, 0, 44, 180);
        _zhuzi2.frame = CGRectMake(100 + 586, 0, 44, 180);
        _zhuzi3.frame = CGRectMake(674 + 586, 0, 44, 180);
        _zhuzi4.frame = CGRectMake(718 + 586, 0, 44, 180);
        _zhuzi5.frame = CGRectMake(762 + 586, 0, 44, 180);
    }
    
    if (_shijianleijia == 2001) {
        [self dierfujinbitu];
    }
    
    if (_shijianleijia > 2000 && _shijianleijia < 2300) {
        [self zhuzilaile];
    }
    
    if (_shijianleijia > 2100 && _shijianleijia < 2400) {
        [self zhuzilaile2];
    }
    
    if (_shijianleijia > 2150 && _shijianleijia < 2450) {
        [self zhuzilaile3];
        _zhadan.frame = CGRectMake(586, 200, 33, 20);
    }
    
    if (_shijianleijia > 2200 && _shijianleijia < 2500) {
        [self zhuzilaile4];
    }
    
    if (_shijianleijia == 2270) {
        [self zhadanlailetishi];
    }
    
    if (_shijianleijia > 2300 && _shijianleijia < 2600) {
        [self zhuzilaile5];
        [self zhadanfashe];
    }
    
    if (_shijianleijia == 2601) {
        _zhadan.frame = CGRectMake(568, 200, 33, 20);
        
        _zhuzi.frame = CGRectMake(586, 0, 44, 180);
        _zhuzi2.frame = CGRectMake(100 + 586, 0, 44, 180);
        _zhuzi3.frame = CGRectMake(674 + 586, 0, 44, 180);
        _zhuzi4.frame = CGRectMake(718 + 586, 0, 44, 180);
        _zhuzi5.frame = CGRectMake(762 + 586, 0, 44, 180);
    }
    
    if (_shijianleijia == 2570) {
        [self zhadanlailetishi];
    }
    
    if (_shijianleijia > 2602 && _shijianleijia < 2902) {
        [self zhadanfashe];
        
        [self zhuzilaile];
        [self zhuzilaile2];
        [self zhuzilaile3];
    }
    
    if (_shijianleijia == 3000) {
        
        _shijianleijia = 0;
        
        _zhadan.frame = CGRectMake(568, 200, 33, 20);
        
        _zhuzi.frame = CGRectMake(586, 0, 44, 180);
        _zhuzi2.frame = CGRectMake(100 + 586, 0, 44, 180);
        _zhuzi3.frame = CGRectMake(674 + 586, 0, 44, 180);
        _zhuzi4.frame = CGRectMake(718 + 586, 0, 44, 180);
        _zhuzi5.frame = CGRectMake(762 + 586, 0, 44, 180);
    }
    
    //大桥刷新
    [self daqiaoyidong];
    
    NSLog(@"金币总数 %d",(int)_jinbizongshu);
    
    //吃金币
    if (CGRectIntersectsRect([_renwu frame], [_jinbi1 frame])) {
        [_jinbi1 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
        NSLog(@"吃到金币了");
    }
    
    if (CGRectIntersectsRect([_renwu frame], [_jinbi2 frame])) {
        [_jinbi2 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_renwu frame], [_jinbi3 frame])) {
        [_jinbi3 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_renwu frame], [_jinbi4 frame])) {
        [_jinbi4 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_renwu frame], [_jinbi5 frame])) {
        [_jinbi5 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_renwu frame], [_jinbi6 frame])) {
        [_jinbi6 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_renwu frame], [_jinbi7 frame])) {
        [_jinbi7 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_renwu frame], [_jinbi8 frame])) {
        [_jinbi8 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_renwu frame], [_jinbi9 frame])) {
        [_jinbi9  setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_renwu frame], [_jinbi10 frame])) {
        [_jinbi10 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_renwu frame], [_jinbi11 frame])) {
        [_jinbi11 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_renwu frame], [_jinbi12 frame])) {
        [_jinbi12 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_renwu frame], [_jinbi13 frame])) {
        [_jinbi13 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    //蹲下吃金币
    if (CGRectIntersectsRect([_dunxiatupian frame], [_jinbi1 frame])) {
        [_jinbi1 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
        NSLog(@"吃到金币了");
    }
    
    if (CGRectIntersectsRect([_dunxiatupian frame], [_jinbi2 frame])) {
        [_jinbi2 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_dunxiatupian frame], [_jinbi3 frame])) {
        [_jinbi3 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_dunxiatupian frame], [_jinbi4 frame])) {
        [_jinbi4 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_dunxiatupian frame], [_jinbi5 frame])) {
        [_jinbi5 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_dunxiatupian frame], [_jinbi6 frame])) {
        [_jinbi6 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_dunxiatupian frame], [_jinbi7 frame])) {
        [_jinbi7 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_dunxiatupian frame], [_jinbi8 frame])) {
        [_jinbi8 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_dunxiatupian frame], [_jinbi9 frame])) {
        [_jinbi9  setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_dunxiatupian frame], [_jinbi10 frame])) {
        [_jinbi10 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_dunxiatupian frame], [_jinbi11 frame])) {
        [_jinbi11 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_dunxiatupian frame], [_jinbi12 frame])) {
        [_jinbi12 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }
    
    if (CGRectIntersectsRect([_dunxiatupian frame], [_jinbi13 frame])) {
        [_jinbi13 setFrame:CGRectMake(-50, -50, 0, 0)];
        _jinbizongshu++;
    }

    
    //金币移动
    NSInteger jinbiyidongsudu = 3;
    
    CGPoint jinbiyidong1 = _jinbi1.center;
    jinbiyidong1.x -= jinbiyidongsudu;
    _jinbi1.center = jinbiyidong1;
    
    CGPoint jinbiyidong2 = _jinbi2.center;
    jinbiyidong2.x -= jinbiyidongsudu;
    _jinbi2.center = jinbiyidong2;
    
    CGPoint jinbiyidong3 = _jinbi3.center;
    jinbiyidong3.x -= jinbiyidongsudu;
    _jinbi3.center = jinbiyidong3;
    
    CGPoint jinbiyidong4 = _jinbi4.center;
    jinbiyidong4.x -= jinbiyidongsudu;
    _jinbi4.center = jinbiyidong4;
    
    CGPoint jinbiyidong5 = _jinbi5.center;
    jinbiyidong5.x -= jinbiyidongsudu;
    _jinbi5.center = jinbiyidong5;
    
    CGPoint jinbiyidong6 = _jinbi6.center;
    jinbiyidong6.x -= jinbiyidongsudu;
    _jinbi6.center = jinbiyidong6;
    
    CGPoint jinbiyidong7 = _jinbi7.center;
    jinbiyidong7.x -= jinbiyidongsudu;
    _jinbi7.center = jinbiyidong7;
    
    CGPoint jinbiyidong8 = _jinbi8.center;
    jinbiyidong8.x -= jinbiyidongsudu;
    _jinbi8.center = jinbiyidong8;
    
    CGPoint jinbiyidong9 = _jinbi9.center;
    jinbiyidong9.x -= jinbiyidongsudu;
    _jinbi9.center = jinbiyidong9;
    
    CGPoint jinbiyidong10 = _jinbi10.center;
    jinbiyidong10.x -= jinbiyidongsudu;
    _jinbi10.center = jinbiyidong10;
    
    CGPoint jinbiyidong11 = _jinbi11.center;
    jinbiyidong11.x -= jinbiyidongsudu;
    _jinbi11.center = jinbiyidong11;
    
    CGPoint jinbiyidong12 = _jinbi12.center;
    jinbiyidong12.x -= jinbiyidongsudu;
    _jinbi12.center = jinbiyidong12;
    
    CGPoint jinbiyidong13 = _jinbi13.center;
    jinbiyidong13.x -= jinbiyidongsudu;
    _jinbi13.center = jinbiyidong13;
    
}

//跳跃方法
- (void)tiaoyuefangfa {
    
    NSLog(@"按跳跃按钮");
    [_renwutiaoyue setPaused:NO];
    [_dunxia setUserInteractionEnabled:NO];
    _tiaoyue.userInteractionEnabled = NO;
    CGFloat yzhou = _renwu.center.y;
    
    if (yzhou >= 30) {
        _renwu.center = CGPointMake(_renwu.center.x, _renwu.center.y-10);

        }
        if (yzhou <= 90) {
//            [self renwuluoxiafangfa];
            [self performSelector:@selector(renwuluoxiafangfa) withObject:nil afterDelay:0.5];
            [_renwutiaoyue setPaused:YES];
    }

//    [self renwuluoxiafangfa];
    
}

//人物落下方法
- (void)renwuluoxiafangfa
{
    
    [_renwuluoxia setPaused:NO];
    
    if (_renwu.center.y < 195) {
        _renwu.center = CGPointMake(_renwu.center.x, _renwu.center.y+10);
        
        if (_renwu.center.y == 195) {
            [_renwuluoxia setPaused:YES];
            _tiaoyue.userInteractionEnabled = YES;
        }

    }
    
    [_dunxia setUserInteractionEnabled:YES];
  
}

//人物蹲下方法
- (void)renwudunxiafangfa
{
//    NSLog(@"按了蹲下");
    
    [_tiaoyue setUserInteractionEnabled:NO];
    
    _renwu.hidden = YES;
    
    _dunxiatupian.hidden = NO;
    
    _renwu.frame = CGRectMake(0, 1000, 0, 0);
    
    _dunxiatupian.frame = CGRectMake(150, 190, 102, 48);
    
}

//人物站起
- (void)renwuzhanqi
{
    NSLog(@"人物站起");
    
    _renwu.hidden = NO;
    
    _dunxiatupian.hidden = YES;
    
    _renwu.frame = CGRectMake(150, 170, 84, 70);
    
    _dunxiatupian.frame = CGRectMake(0, 1000, 0, 0);
    
    [_tiaoyue setUserInteractionEnabled:YES];
}

//背景
- (void)beijing
{
    NSString *str = [[NSBundle mainBundle] pathForResource:@"youxibeijing2" ofType:@"mov"];
    
    NSURL *url = [NSURL fileURLWithPath:str];
    
    _bofangqi = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    _bofangqi.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    
//    _bofangqi.view.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
//    [_bofangqi setFullscreen:YES animated:NO];
    
    _bofangqi.controlStyle = MPMovieControlStyleNone;
    
    //重复播放
    _bofangqi.repeatMode = MPMovieRepeatModeOne;
    
    [self.view insertSubview:_bofangqi.view atIndex:0];
    
    [_bofangqi prepareToPlay];
    
    [_bofangqi play];
    
}

//炸弹的动作
- (void)zhadandongzuo
{
    _zhadan = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhadan"]];
    
    _zhadan.frame = CGRectMake(568, 200, 33, 20);
    
    [self.view insertSubview:_zhadan aboveSubview:_tiaoyue];
}

//炸弹发射
- (void)zhadanfashe
{
    _zhadan.center = CGPointMake(_zhadan.center.x - 6, 200);
}

//柱子的动作
- (void)zhuzidongzuo
{
    _zhuzi = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhuzi"]];
    
    _zhuzi.frame = CGRectMake(586, 0, 44, 180);
    
    [self.view insertSubview:_zhuzi aboveSubview:_tiaoyue];
}

//柱子来了
- (void)zhuzilaile
{
    _zhuzi.center = CGPointMake(_zhuzi.center.x - 3, 90);
}

//柱子的动作2
- (void)zhuzidongzuo2
{
    _zhuzi2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhuzi"]];
    
    _zhuzi2.frame = CGRectMake(100, 0, 44, 180);
    
    [self.view insertSubview:_zhuzi2 aboveSubview:_zhuzi];
}

//柱子来了2
- (void)zhuzilaile2
{
    _zhuzi2.center = CGPointMake(_zhuzi2.center.x - 3, 90);
}

//柱子的动作3
- (void)zhuzidongzuo3
{
    _zhuzi3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhuzi"]];
    
    _zhuzi3.frame = CGRectMake(674, 0, 44, 180);
    
    [self.view insertSubview:_zhuzi3 aboveSubview:_zhuzi2];
}

//柱子来了3
- (void)zhuzilaile3
{
    _zhuzi3.center = CGPointMake(_zhuzi3.center.x - 3, 90);
}

//柱子的动作4
- (void)zhuzidongzuo4
{
    _zhuzi4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhuzi"]];
    
    _zhuzi4.frame = CGRectMake(718, 0, 44, 180);
    
    [self.view insertSubview:_zhuzi4 aboveSubview:_zhuzi3];
}

//柱子来了4
- (void)zhuzilaile4
{
    _zhuzi4.center = CGPointMake(_zhuzi4.center.x - 3, 90);
}

//柱子的动作5
- (void)zhuzidongzuo5
{
    _zhuzi5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhuzi"]];
    
    _zhuzi5.frame = CGRectMake(762, 0, 44, 180);
    
    [self.view insertSubview:_zhuzi5 aboveSubview:_zhuzi4];
}

//柱子来了5
- (void)zhuzilaile5
{
    _zhuzi5.center = CGPointMake(_zhuzi5.center.x - 3, 90);
}



//大桥布局
- (void)daqiao2
{
    _daqiao1imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"daqiao4"]];
    
    _daqiao1imageview.frame = CGRectMake(0, 225, 9996, 110);
    
    _daqiao2imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"daqiao4"]];
    
    _daqiao2imageview.frame = CGRectMake(4000, 225, 9996, 110);
    
    //    _imageview3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"daqiao4"]];
    //
    //    _imageview3.frame = CGRectMake(1300, 100, 9996, 220);
    
    [self.view insertSubview:_daqiao1imageview belowSubview:_renwu];
    
    [self.view insertSubview:_daqiao2imageview belowSubview:_renwu];

}

//大桥移动
- (void)daqiaoyidong
{
    CGPoint fangwei = _daqiao1imageview.center;
    
    fangwei.x -= 5;
    
    _daqiao1imageview.center = fangwei;
    
    CGPoint fangwei2 = _daqiao2imageview.center;
    
    fangwei2.x -= 5;
    
    _daqiao2imageview.center = fangwei2;
    
    
    if (_daqiao2imageview.center.x < 200) {
        CGPoint fangweiyidong2 = _daqiao2imageview.center;
        
        fangweiyidong2.x = 8000;
        
        _daqiao2imageview.center = fangweiyidong2;
    }
    
    if (_daqiao1imageview.center.x < 200) {
        CGPoint fangweiyidong = _daqiao1imageview.center;
        
        fangweiyidong.x = 8000;
        
        _daqiao1imageview.center = fangweiyidong;
    }
}

//暂停按钮
- (void)zantinganniu
{
    _zanting = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *image = [UIImage imageNamed:@"zanting"];
    
    [_zanting setBackgroundImage:image forState:UIControlStateNormal];
    
    _zanting.frame = CGRectMake([UIScreen mainScreen].applicationFrame.size.height - 50, 10, 32, 32);
    
    [self.view addSubview:_zanting];
}

//暂停方法
- (void)zantingfangfa
{
    [self shijianzanting];
    
    [_gameTimer setPaused:YES];
    
    [_bofangqi pause];
    
    _zantingview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width)];
    
    _zantingview.backgroundColor = [UIColor blackColor];
    
    _zantingview.alpha = 0.5;
    
    [self.view addSubview:_zantingview];
    
    _zantingimageview = [[UIImageView alloc] init];
    
    _zantingimageview.frame = CGRectMake(100, 100, [UIScreen mainScreen].bounds.size.height / 1.5, [UIScreen mainScreen].bounds.size.width / 1.5);
    
    _zantingimageview.center = CGPointMake([UIScreen mainScreen].applicationFrame.size.height / 2, [UIScreen mainScreen].applicationFrame.size.width / 2);
    
    _zantingimageview.image = [UIImage imageNamed:@"zantingjiemian"];
    
    [self.view addSubview:_zantingimageview];
    
    //继续游戏按钮
    _jixuyouxi = [UIButton buttonWithType:UIButtonTypeCustom];
    
//    _jixuyouxi.backgroundColor = [UIColor redColor];
    
//    _jixuyouxi.alpha = 0.3;
    
    _jixuyouxi.frame = CGRectMake(_zantingimageview.frame.origin.x * 2.2, _zantingimageview.frame.origin.y * 2, _zantingimageview.frame.size.height * 0.7, _zantingimageview.frame.size.width * 0.1);
    
    [self.view addSubview:_jixuyouxi];
    
    [_jixuyouxi addTarget:self action:@selector(jixuyouxifangfa) forControlEvents:UIControlEventTouchDown];
    
    //重新开始
    _chongxinkaishi = [UIButton buttonWithType:UIButtonTypeCustom];
    
//    _chongxinkaishi.backgroundColor = [UIColor yellowColor];
    
//    _chongxinkaishi.alpha = 0.3;
    
    _chongxinkaishi.frame = CGRectMake(_zantingimageview.frame.origin.x * 2.2, _zantingimageview.frame.origin.y * 2.9, _zantingimageview.frame.size.height * 0.7, _zantingimageview.frame.size.width * 0.1);
    
    [self.view addSubview:_chongxinkaishi];
    
    [_chongxinkaishi addTarget:self action:@selector(chongxinkaishifangfa) forControlEvents:UIControlEventTouchDown];
    
    //主界面
    _zhujiemian = [UIButton buttonWithType:UIButtonTypeCustom];
    
//    _zhujiemian.backgroundColor = [UIColor brownColor];
    
//    _zhujiemian.alpha = 0.3;
    
    _zhujiemian.frame = CGRectMake(_zantingimageview.frame.origin.x * 2.2, _zantingimageview.frame.origin.y * 3.8, _zantingimageview.frame.size.height * 0.7, _zantingimageview.frame.size.width * 0.1);
    
    [self.view addSubview:_zhujiemian];
    
    [_zhujiemian addTarget:self action:@selector(zhujiemianfangfa) forControlEvents:UIControlEventTouchDown];
    
}

//继续游戏方法
- (void)jixuyouxifangfa
{
    NSLog(@"继续游戏");
    
    [_zantingview removeFromSuperview];
    [_zantingimageview removeFromSuperview];
    [_jixuyouxi removeFromSuperview];
    [_chongxinkaishi removeFromSuperview];
    [_zhujiemian removeFromSuperview];
    [_bofangqi play];
    
    //时间恢复
    if (![_shijian isValid]) {
        return ;
    }
    
    [_shijian setFireDate:[NSDate dateWithTimeIntervalSinceNow:0]];
//    [_shijian setFireDate:[NSDate date]];
    
    [_gameTimer setPaused:NO];
}

//重新开始方法
- (void)chongxinkaishifangfa
{
    NSLog(@"重新开始");
    
    [_player stop];
    [_zantingview removeFromSuperview];
    [_zantingimageview removeFromSuperview];
    [_jixuyouxi removeFromSuperview];
    [_chongxinkaishi removeFromSuperview];
    [_zhujiemian removeFromSuperview];
    [_gameTimer invalidate];
    [_shijian invalidate];
    
//    Zhunbeikaishijiemian *zhunbeikaishi = [[Zhunbeikaishijiemian alloc] init];
//    
//    [self.navigationController pushViewController:zhunbeikaishi animated:NO];
    
    ViewController *vc1 = [[ViewController alloc] init];
    
    [self.navigationController pushViewController:vc1 animated:NO];
}

//回到主界面
- (void)zhujiemianfangfa
{
    NSLog(@"主界面");
    
    [_player stop];
    [_zantingview removeFromSuperview];
    [_zantingimageview removeFromSuperview];
    [_jixuyouxi removeFromSuperview];
    [_chongxinkaishi removeFromSuperview];
    [_zhujiemian removeFromSuperview];
    [_gameTimer invalidate];
    [_shijian invalidate];
    
    Kaishijiemian *kaishijiemian = [[Kaishijiemian alloc]init];
    
    [self.navigationController pushViewController:kaishijiemian animated:NO];
}

//时间暂停
- (void)shijianzanting
{
    if (![_shijian isValid]) {
        return ;
    }
    
    [_shijian setFireDate:[NSDate distantFuture]];
}

//表现分
- (void)biaoxianfen
{
    UIImage *image = [UIImage imageNamed:@"biaoxianfen"];
    
    _biaoxianfenimageview = [[UIImageView alloc] initWithImage:image];
    
    _biaoxianfenimageview.frame = CGRectMake(10, 10, 133, 26);
    
    [self.view addSubview:_biaoxianfenimageview];
    
    _biaoxianfenlable = [[UILabel alloc] initWithFrame:CGRectMake(45, 3, 60, 20)];
    
    _biaoxianfenlable.backgroundColor = [UIColor clearColor];
    
    _biaoxianfenlable.text = _julilable.text;
    
    _biaoxianfenlable.textAlignment = UITextAlignmentRight;
    
    _biaoxianfenlable.textColor = [UIColor yellowColor];
    
    [_biaoxianfenimageview addSubview:_biaoxianfenlable];
}

- (void)biaoxianfenshuaxin
{
    NSInteger bianxianfenshuzhi = _mishushuzhi * 1.5;
    
    NSString *str = [NSString stringWithFormat:@"%d",(int)bianxianfenshuzhi];
    
    _biaoxianfenlable.text = str;
}



//距离
- (void)juli
{
    UIImage *image = [UIImage imageNamed:@"juli"];
    
    UIImageView *juliimageview = [[UIImageView alloc] initWithImage:image];
    
    juliimageview.frame = CGRectMake(150, 10, 133, 26);
    
    [self.view addSubview:juliimageview];
    
    _julilable = [[UILabel alloc] init];
    _julilable.frame = CGRectMake(45, 3, 60, 20);
    NSString *str = [NSString stringWithFormat:@"%ld",(long)_mishushuzhi];
    
    _julilable.backgroundColor = [UIColor clearColor];
    
    _julilable.text = str;
    
    _julilable.textAlignment = UITextAlignmentRight;
    
    _julilable.textColor = [UIColor yellowColor];
    
    [juliimageview addSubview:_julilable];
}

- (void)mishu
{
    _mishushuzhi++;
    
    NSString *str = [NSString stringWithFormat:@"%ld",(long)_mishushuzhi];
    
    _julilable.text = str;
}

//计分界面
- (void)jifenjiemian
{
    [_gameTimer invalidate];
    [_bofangqi stop];
    [_shijian invalidate];
    Suanfenjiemian *suanfenjiemian = [[Suanfenjiemian alloc] init];
    
    [self.navigationController pushViewController:suanfenjiemian animated:NO];
}

//游戏结束
- (void)youxijieshu
{
    //1.获得音效文件的全路径
    
    NSString *str = [[NSBundle mainBundle] pathForResource:@"youxijieshu" ofType:@"wav"];
    
    NSURL *url = [NSURL fileURLWithPath:str];
    
    //2.加载音效文件，创建音效ID（SoundID,一个ID对应一个音效文件）
    SystemSoundID soundID=0;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    
    //把需要销毁的音效文件的ID传递给它既可销毁
    //AudioServicesDisposeSystemSoundID(soundID);
    
    //3.播放音效文件
    //下面的两个函数都可以用来播放音效文件，第一个函数伴随有震动效果
    //    AudioServicesPlayAlertSound(soundID);
    //AudioServicesPlaySystemSound(<#SystemSoundID inSystemSoundID#>)
    AudioServicesPlaySystemSound(soundID);
}

//算分页面
- (void)suanfenyemian
{
    UIImage *suanfenbeijing = [UIImage imageNamed:@"Suanfenjiemianbeijing"];
    
    UIImageView *imageview = [[UIImageView alloc] initWithImage:suanfenbeijing];
    
    imageview.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    
    [self.view addSubview:imageview];
    
    UIImageView *xianshipai = [[UIImageView alloc] init];
    
    xianshipai.frame = CGRectMake(50, 20, 260, 280);
    
    xianshipai.image = [UIImage imageNamed:@"jingdianmoshizongfen2"];
    
    [self.view addSubview:xianshipai];
    
    
    
    
    
    UIButton *suanfenfanhuianniu = [UIButton buttonWithType:UIButtonTypeCustom];
    
    suanfenfanhuianniu.frame = CGRectMake(xianshipai.frame.origin.x + 260, 250, 160, 50);
    
    [suanfenfanhuianniu setBackgroundImage:[UIImage imageNamed:@"kanwanjieguofanhuianniu"] forState:UIControlStateNormal];
    
    [self.view addSubview:suanfenfanhuianniu];
    
    [suanfenfanhuianniu addTarget:self action:@selector(fanhuikaishijiemian) forControlEvents:UIControlEventTouchDown];
    
    //距离
    UILabel *juli = [[UILabel alloc] init];
    juli.frame = CGRectMake(110, 130, 60, 20);
    
    NSString *shuzhizhuanhuan2 = [NSString stringWithFormat:@"%d",(int)_mishushuzhi];
    
    juli.backgroundColor = [UIColor clearColor];
    
    juli.text = shuzhizhuanhuan2;
    
    [juli setFont:[UIFont boldSystemFontOfSize:20]];
    
    juli.textAlignment = UITextAlignmentLeft;
    
    juli.textColor = [UIColor blueColor];
    
    [xianshipai addSubview:juli];
    
    //表现
    UILabel *biaoxianlable = [[UILabel alloc] init];
    biaoxianlable.frame = CGRectMake(110, 160, 60, 20);
    
    NSInteger biaoxianfenzhuanhuan;
    biaoxianfenzhuanhuan = _mishushuzhi * 1.5;
    
    NSString *shuzhizhuanhuan3 = [NSString stringWithFormat:@"%d",(int)biaoxianfenzhuanhuan];
    
    biaoxianlable.backgroundColor = [UIColor clearColor];
    
    biaoxianlable.text = shuzhizhuanhuan3;
    
    [biaoxianlable setFont:[UIFont boldSystemFontOfSize:20]];
    
    biaoxianlable.textAlignment = UITextAlignmentLeft;
    
    biaoxianlable.textColor = [UIColor blueColor];
    
    [xianshipai addSubview:biaoxianlable];
    
    UIImageView *suanfenrenwu = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fenshubji"]];
    
    suanfenrenwu.frame = CGRectMake(xianshipai.frame.origin.x + 280, 20, 168, 242);
        
    //金币数量
    UILabel *jinbishulianglable = [[UILabel alloc] init];
    jinbishulianglable.frame = CGRectMake(110, 213, 60, 20);
    
    jinbishulianglable.backgroundColor = [UIColor clearColor];
    
    NSString *jinbishuliangzhuanhuan = [NSString stringWithFormat:@"%d",(int)_jinbizongshu];
    
    jinbishulianglable.text = jinbishuliangzhuanhuan;
    
    [jinbishulianglable setFont:[UIFont boldSystemFontOfSize:20]];
    
    jinbishulianglable.textAlignment = UITextAlignmentCenter;
    
    jinbishulianglable.textColor = [UIColor redColor];
    
    [xianshipai addSubview:jinbishulianglable];
    
    //总分
    UILabel *zongfen = [[UILabel alloc] init];
    zongfen.frame = CGRectMake(60, 60, 140, 50);
    
    NSInteger zongfenshuzi = _mishushuzhi + biaoxianfenzhuanhuan + _jinbizongshu;
    
    NSString *str = [NSString stringWithFormat:@"%i",(int)zongfenshuzi];
    
    zongfen.backgroundColor = [UIColor clearColor];
    
    zongfen.text = str;
    
    [zongfen setFont:[UIFont boldSystemFontOfSize:45]];
    
    zongfen.textAlignment = UITextAlignmentCenter;
    
    zongfen.textColor = [UIColor redColor];
    
    [xianshipai addSubview:zongfen];
    
    if (zongfenshuzi < 200) {
        suanfenrenwu.image = [UIImage imageNamed:@"fenshubji"];
        [self.view addSubview:suanfenrenwu];
    }else if (zongfenshuzi > 200 && zongfenshuzi < 2000) {
        suanfenrenwu.image = [UIImage imageNamed:@"fenshuaji"];
        [self.view addSubview:suanfenrenwu];
    }else if (zongfenshuzi > 2000 && zongfenshuzi < 4000){
        suanfenrenwu.image = [UIImage imageNamed:@"fenshusji"];
        [self.view addSubview:suanfenrenwu];
    }else if (zongfenshuzi > 4000)
    {
        suanfenrenwu.image = [UIImage imageNamed:@"fenshussji"];
        [self.view addSubview:suanfenrenwu];
    }
    
    //1.获得音效文件的全路径
    
    NSString *stryinyue = [[NSBundle mainBundle] pathForResource:@"defen" ofType:@"wav"];
    
    NSURL *url = [NSURL fileURLWithPath:stryinyue];
    
    //2.加载音效文件，创建音效ID（SoundID,一个ID对应一个音效文件）
    SystemSoundID soundID=1;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    
    //把需要销毁的音效文件的ID传递给它既可销毁
    //AudioServicesDisposeSystemSoundID(soundID);
    
    //3.播放音效文件
    //下面的两个函数都可以用来播放音效文件，第一个函数伴随有震动效果
    //    AudioServicesPlayAlertSound(soundID);
    //AudioServicesPlaySystemSound(<#SystemSoundID inSystemSoundID#>)
    AudioServicesPlaySystemSound(soundID);
    
    //分享到新浪微博
    UIButton *fenxiangdaoweibo = [UIButton buttonWithType:UIButtonTypeCustom];
    
    fenxiangdaoweibo.frame = CGRectMake(128, 303, 71, 16);
    
    [fenxiangdaoweibo setBackgroundImage:[UIImage imageNamed:@"fenxiangdaoweibo.gif"] forState:UIControlStateNormal];
    
    [self.view addSubview:fenxiangdaoweibo];
    
    //分数写在这里
    NSInteger defen = zongfenshuzi;
    
    NSString *zhuanhuanfenshu = [NSString stringWithFormat:@"%li",(long)defen];
    
    _fenxiangdefen = zhuanhuanfenshu;
    
    [fenxiangdaoweibo addTarget:self action:@selector(shareButtonPressed) forControlEvents:UIControlEventTouchDown];
}

- (void)fanhuikaishijiemian
{
    Kaishijiemian *kaishijiemian = [[Kaishijiemian alloc] init];
    
    [self.navigationController pushViewController:kaishijiemian animated:NO];
}

//金币初始化
- (void)jinbi
{
    NSInteger zengjiamishu = 150;
    
    _jinbi1 = [[UIImageView alloc] initWithFrame:CGRectMake(132 + zengjiamishu, 200, 20, 19)];
    
    _jinbi1.image = [UIImage imageNamed:@"jinbi"];
    
    [self.view addSubview:_jinbi1];
    
    _jinbi2 = [[UIImageView alloc] initWithFrame:CGRectMake(161 + zengjiamishu, 168, 20, 19)];
    
    _jinbi2.image = [UIImage imageNamed:@"jinbi"];
    
    [self.view addSubview:_jinbi2];
    
    _jinbi3 = [[UIImageView alloc] initWithFrame:CGRectMake(184 + zengjiamishu, 144, 20, 19)];
    
    _jinbi3.image = [UIImage imageNamed:@"jinbi"];
    
    [self.view addSubview:_jinbi3];
    
    _jinbi4 = [[UIImageView alloc] initWithFrame:CGRectMake(207 + zengjiamishu, 117, 20, 19)];
    
    _jinbi4.image = [UIImage imageNamed:@"jinbi"];
    
    [self.view addSubview:_jinbi4];
    
    _jinbi5 = [[UIImageView alloc] initWithFrame:CGRectMake(239 + zengjiamishu, 92, 20, 19)];
    
    _jinbi5.image = [UIImage imageNamed:@"jinbi"];
    
    [self.view addSubview:_jinbi5];
    
    _jinbi6 = [[UIImageView alloc] initWithFrame:CGRectMake(268 + zengjiamishu, 117, 20, 19)];
    
    _jinbi6.image = [UIImage imageNamed:@"jinbi"];
    
    [self.view addSubview:_jinbi6];
    
    _jinbi7 = [[UIImageView alloc] initWithFrame:CGRectMake(293 + zengjiamishu, 92, 20, 19)];
    
    _jinbi7.image = [UIImage imageNamed:@"jinbi"];
    
    [self.view addSubview:_jinbi7];
    
    _jinbi8 = [[UIImageView alloc] initWithFrame:CGRectMake(320 + zengjiamishu, 168, 20, 19)];
    
    _jinbi8.image = [UIImage imageNamed:@"jinbi"];
    
    [self.view addSubview:_jinbi8];
    
    _jinbi9 = [[UIImageView alloc] initWithFrame:CGRectMake(349 + zengjiamishu, 168, 20, 19)];
    
    _jinbi9.image = [UIImage imageNamed:@"jinbi"];
    
    [self.view addSubview:_jinbi9];
    
    _jinbi10 = [[UIImageView alloc] initWithFrame:CGRectMake(420 + zengjiamishu, 144, 20, 19)];
    
    _jinbi10.image = [UIImage imageNamed:@"jinbi"];
    
    [self.view addSubview:_jinbi10];
    
    _jinbi11 = [[UIImageView alloc] initWithFrame:CGRectMake(132 + zengjiamishu, 200, 20, 19)];
    
    _jinbi11.image = [UIImage imageNamed:@"jinbi"];
    
    [self.view addSubview:_jinbi11];
    
    _jinbi12 = [[UIImageView alloc] initWithFrame:CGRectMake(132 + zengjiamishu, 200, 20, 19)];
    
    _jinbi12.image = [UIImage imageNamed:@"jinbi"];
    
    [self.view addSubview:_jinbi12];
    
    _jinbi13 = [[UIImageView alloc] initWithFrame:CGRectMake(132 + zengjiamishu, 200, 20, 19)];
    
    _jinbi13.image = [UIImage imageNamed:@"jinbi"];
    
    [self.view addSubview:_jinbi13];
}

//第一幅金币图
- (void)jinbitu
{
    NSInteger zengjiamishu = 568;
    
    _jinbi1.frame = CGRectMake(132 + zengjiamishu, 200, 20, 19);
    _jinbi2.frame = CGRectMake(161 + zengjiamishu, 168, 20, 19);
    _jinbi3.frame = CGRectMake(184 + zengjiamishu, 144, 20, 19);
    _jinbi4.frame = CGRectMake(207 + zengjiamishu, 117, 20, 19);
    _jinbi5.frame = CGRectMake(239 + zengjiamishu, 92, 20, 19);
    _jinbi6.frame = CGRectMake(268 + zengjiamishu, 117, 20, 19);
    _jinbi7.frame = CGRectMake(293 + zengjiamishu, 92, 20, 19);
    _jinbi8.frame = CGRectMake(320 + zengjiamishu, 168, 20, 19);
    _jinbi9.frame = CGRectMake(349 + zengjiamishu, 168, 20, 19);
    _jinbi10.frame = CGRectMake(420 + zengjiamishu, 144, 20, 19);
    _jinbi11.frame = CGRectMake(132 + zengjiamishu, 200, 20, 19);
    _jinbi12.frame = CGRectMake(132 + zengjiamishu, 200, 20, 19);
    _jinbi13.frame = CGRectMake(132 + zengjiamishu, 200, 20, 19);
}

//第二幅金币图
- (void)dierfujinbitu
{
    NSInteger zengjiamishu2 = 568;
    
    _jinbi1.frame = CGRectMake(148 + zengjiamishu2, 56, 20, 19);
    _jinbi2.frame = CGRectMake(148 + zengjiamishu2, 102, 20, 19);
    _jinbi3.frame = CGRectMake(148 + zengjiamishu2, 150, 20, 19);
    _jinbi4.frame = CGRectMake(148 + zengjiamishu2, 200, 20, 19);
    _jinbi5.frame = CGRectMake(194 + zengjiamishu2, 200, 20, 19);
    _jinbi6.frame = CGRectMake(252 + zengjiamishu2, 200, 20, 19);
    _jinbi7.frame = CGRectMake(428 + zengjiamishu2, 56, 20, 19);
    _jinbi8.frame = CGRectMake(390 + zengjiamishu2, 97, 20, 19);
    _jinbi9.frame = CGRectMake(360 + zengjiamishu2, 130, 20, 19);
    _jinbi10.frame = CGRectMake(419 + zengjiamishu2, 97, 20, 19);
    _jinbi11.frame = CGRectMake(419 + zengjiamishu2, 130, 20, 19);
    _jinbi12.frame = CGRectMake(419 + zengjiamishu2, 165, 20, 19);
    _jinbi13.frame = CGRectMake(419 + zengjiamishu2, 200, 20, 19);
}

//炸弹来了
- (void)zhadanlailetishi
{
    //1.获得音效文件的全路径
    
    NSString *str = [[NSBundle mainBundle] pathForResource:@"zhadanlaile" ofType:@"wav"];
    
    NSURL *url = [NSURL fileURLWithPath:str];
    
    //2.加载音效文件，创建音效ID（SoundID,一个ID对应一个音效文件）
    SystemSoundID soundID=2;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    
    //把需要销毁的音效文件的ID传递给它既可销毁
    //AudioServicesDisposeSystemSoundID(soundID);
    
    //3.播放音效文件
    //下面的两个函数都可以用来播放音效文件，第一个函数伴随有震动效果
//        AudioServicesPlayAlertSound(soundID);
    //AudioServicesPlaySystemSound(<#SystemSoundID inSystemSoundID#>)
    AudioServicesPlaySystemSound(soundID);

}

//准备开始界面
- (void)zhunbeikaishi
{
    //准备开始界面的底层
    _diceng = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    [self.view addSubview:_diceng];
    
    //游戏背景音乐
    NSString *beijingyinyueming = [[NSBundle mainBundle] pathForResource:@"youxiyinyue" ofType:@"mp3"];
    
    NSURL *url1 = [NSURL fileURLWithPath:beijingyinyueming];
    
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:nil];
    
    _player.numberOfLoops = -1;
    
    [_player prepareToPlay];
    
    [_player play];
    
    //准备动画
    NSString *str = [[NSBundle mainBundle] pathForResource:@"zhunbeikaishijiemian3" ofType:@"mov"];
    
    NSURL *url = [NSURL fileURLWithPath:str];
    
    _bofangqi1 = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    _bofangqi1.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    
//    _bofangqi1.view.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    _bofangqi1.controlStyle = MPMovieControlStyleNone;
    
    //重复播放
    _bofangqi1.repeatMode = MPMovieRepeatModeNone;
    
    [_diceng addSubview:_bofangqi1.view];
    
    [_bofangqi1 prepareToPlay];
    
    [_bofangqi1 play];
    
    [self performSelector:@selector(zhunbeikaishijiemianxiaoshi) withObject:nil afterDelay:1.8];
}

- (void)zhunbeikaishijiemianxiaoshi
{
//    [_diceng setFrame:CGRectMake(-500, -500, 0, 0)];
    
    //使用hidden音效才不会消失
    [_diceng setHidden:YES];
//    [self youxikaishi];
}

//这个是分享到微博
- (void)shareButtonPressed
{
    AppDelegate *myDelegate =(AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    WBAuthorizeRequest *authRequest = [WBAuthorizeRequest request];
    authRequest.redirectURI = @"http://www.sina.com";
    authRequest.scope = @"all";
    
    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:[self messageToShare] authInfo:authRequest access_token:nil];
    request.userInfo = @{@"ShareMessageFrom": @"SendMessageToWeiboViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    //    request.shouldOpenWeiboAppInstallPageIfNotInstalled = NO;
    [WeiboSDK sendRequest:request];
}

//这个是分享到微博的内容
- (WBMessageObject *)messageToShare
{
    WBMessageObject *message = [WBMessageObject message];
    
    if (YES)
    {
        //        message.text = NSLocalizedString(@"123 test", nil);
        NSString *qianmianyu = @"跑跑完全停不下来，跑了";
        NSString *houmianyu = @"分!跑跑完全停不下来是一款很好玩的游戏哦！";
        
        NSString *hebing = [NSString stringWithFormat:@"%@%@%@",qianmianyu,_fenxiangdefen,houmianyu];
        message.text = hebing;
    }
    
    if (self.imageSwitch.on)
    {
        WBImageObject *image = [WBImageObject object];
        image.imageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image_1" ofType:@"jpg"]];
        message.imageObject = image;
    }
    
    if (self.mediaSwitch.on)
    {
        WBWebpageObject *webpage = [WBWebpageObject object];
        webpage.objectID = @"identifier1";
        webpage.title = NSLocalizedString(@"分享网页标题", nil);
        webpage.description = [NSString stringWithFormat:NSLocalizedString(@"分享网页内容简介-%.0f", nil), [[NSDate date] timeIntervalSince1970]];
        webpage.thumbnailData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image_2" ofType:@"jpg"]];
        webpage.webpageUrl = @"http://sina.cn?a=1";
        message.mediaObject = webpage;
    }
    
    return message;
}


@end
