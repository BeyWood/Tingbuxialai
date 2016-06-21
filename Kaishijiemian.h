//
//  Kaishijiemian.h
//  试做一个天天酷跑
//
//  Created by Administartor on 16-5-14.
//  Copyright (c) 2016年 Administartor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "Guanyujiemian.h"
#import "Zhunbeikaishijiemian.h"
#import "Suanfenjiemian.h"

@interface Kaishijiemian : UIViewController

//人物图片
@property (nonatomic,strong) UIImageView *renwuimageview;

//进场音乐
@property (nonatomic,strong) AVAudioPlayer *jinchangyinyue;

//进场次数(音乐)
@property NSInteger chuangjiancishu;

@end
