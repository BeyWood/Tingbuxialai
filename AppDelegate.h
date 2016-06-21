//
//  AppDelegate.h
//  试做一个天天酷跑
//
//  Created by Administartor on 16-5-9.
//  Copyright (c) 2016年 Administartor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboSDK.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, WeiboSDKDelegate>
{
    NSString* wbtoken;
    NSString* wbCurrentUserID;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (strong, nonatomic) NSString *wbtoken;
@property (strong, nonatomic) NSString *wbCurrentUserID;


@end
