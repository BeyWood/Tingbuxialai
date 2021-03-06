//
//  AppDelegate.m
//  试做一个天天酷跑
//
//  Created by Administartor on 16-5-9.
//  Copyright (c) 2016年 Administartor. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Kaishijiemian.h"
#import "WeiboSDK.h"

@interface WBBaseRequest ()
- (void)debugPrint;
@end

@interface WBBaseResponse ()
- (void)debugPrint;
@end

@interface WBBaseRequest ()
- (void)debugPrint;
@end

@interface WBBaseResponse ()
- (void)debugPrint;
@end

@implementation AppDelegate

@synthesize wbtoken;
@synthesize wbCurrentUserID;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:@"171102816"];
    
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    //设置窗口的根控制器为导航控制器
    
//    OneViewController *oneVc = [[OneViewController alloc] init];
    //oneVc.view.backgroundColor = [UIColor redColor];
    
//    ViewController *vcontroller = [[ViewController alloc] init];
    
    Kaishijiemian *kaishi = [[Kaishijiemian alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:kaishi];
    
    window.rootViewController = nav;
    
    nav.navigationBarHidden = YES;
    
    [window makeKeyAndVisible];
    
    self.window = window;
    
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [WeiboSDK handleOpenURL:url delegate:self ];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

//- (void)applicationWillTerminate:(UIApplication *)application
//{
//    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//}

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    //    if ([response isKindOfClass:WBSendMessageToWeiboResponse.class])
    //    {
    //        NSString *title = NSLocalizedString(@"发送结果", nil);
    //        NSString *message = [NSString stringWithFormat:@"%@: %d\n%@: %@\n%@: %@", NSLocalizedString(@"响应状态", nil), (int)response.statusCode, NSLocalizedString(@"响应UserInfo数据", nil), response.userInfo, NSLocalizedString(@"原请求UserInfo数据", nil),response.requestUserInfo];
    //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
    //                                                        message:message
    //                                                       delegate:nil
    //                                              cancelButtonTitle:NSLocalizedString(@"确定", nil)
    //                                              otherButtonTitles:nil];
    //        WBSendMessageToWeiboResponse* sendMessageToWeiboResponse = (WBSendMessageToWeiboResponse*)response;
    //        NSString* accessToken = [sendMessageToWeiboResponse.authResponse accessToken];
    //        if (accessToken)
    //        {
    //            self.wbtoken = accessToken;
    //        }
    //        NSString* userID = [sendMessageToWeiboResponse.authResponse userID];
    //        if (userID) {
    //            self.wbCurrentUserID = userID;
    //        }
    //        [alert show];
    //        //[alert release];
    //    }
    //    else if ([response isKindOfClass:WBAuthorizeResponse.class])
    //    {
    //        NSString *title = NSLocalizedString(@"认证结果", nil);
    //        NSString *message = [NSString stringWithFormat:@"%@: %d\nresponse.userId: %@\nresponse.accessToken: %@\n%@: %@\n%@: %@", NSLocalizedString(@"响应状态", nil), (int)response.statusCode,[(WBAuthorizeResponse *)response userID], [(WBAuthorizeResponse *)response accessToken],  NSLocalizedString(@"响应UserInfo数据", nil), response.userInfo, NSLocalizedString(@"原请求UserInfo数据", nil), response.requestUserInfo];
    //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
    //                                                        message:message
    //                                                       delegate:nil
    //                                              cancelButtonTitle:NSLocalizedString(@"确定", nil)
    //                                              otherButtonTitles:nil];
    //
    //        self.wbtoken = [(WBAuthorizeResponse *)response accessToken];
    //        self.wbCurrentUserID = [(WBAuthorizeResponse *)response userID];
    //        [alert show];
    ////        [alert release];
    //    }
    //    else if ([response isKindOfClass:WBPaymentResponse.class])
    //    {
    //        NSString *title = NSLocalizedString(@"支付结果", nil);
    //        NSString *message = [NSString stringWithFormat:@"%@: %d\nresponse.payStatusCode: %@\nresponse.payStatusMessage: %@\n%@: %@\n%@: %@", NSLocalizedString(@"响应状态", nil), (int)response.statusCode,[(WBPaymentResponse *)response payStatusCode], [(WBPaymentResponse *)response payStatusMessage], NSLocalizedString(@"响应UserInfo数据", nil),response.userInfo, NSLocalizedString(@"原请求UserInfo数据", nil), response.requestUserInfo];
    //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
    //                                                        message:message
    //                                                       delegate:nil
    //                                              cancelButtonTitle:NSLocalizedString(@"确定", nil)
    //                                              otherButtonTitles:nil];
    //        [alert show];
    ////        [alert release];
    //    }
}

@end
