//
//  AppDelegate.m
//  UMDemo
//
//  Created by Kevin on 16/6/16.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "AppDelegate.h"
//引入头文件
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /*
     手动添加SDK 系统需要的framework
     
     添加SDK后需要手动添加系统库SystemConfiguration.framework
     
     在other linker flags增加-ObjC 选项，并添加ImageIO 系统framework（实现新浪微博必须完成的步骤）
     
     添加SDK依赖的系统库文件
     
     在Xcode中打开工程配置文件，选择“summary”一栏。在“summary”中选择“Linked Frameworks and Libraries”一栏，点击“+”图标添加下面八个库文件，分别是
     Security.framework
     libiconv.dylib
     SystemConfiguration.framework
     CoreGraphics.Framework
     libsqlite3.dylib
     CoreTelephony.framework
     libstdc++.dylib
     libz.dylib
*/
    /*
     *  适配iOS9.0 需要加入白名单 
     
    * 如果你的应用使用了如SSO授权登录或跳转分享功能，在iOS9下就需要增加一个可跳转的白名单，指定对应跳转App的URL Scheme，否则将在第三方平台判断是否跳转时用到的canOpenURL时返回NO，进而只进行webview授权或授权/分享失败。
     同样在info.plist增加：
     
     <key>LSApplicationQueriesSchemes</key>
     <array>
     <!-- 微信 URL Scheme 白名单-->
     <string>wechat</string>
     <string>weixin</string>
     
     集体在友盟上链接：http://dev.umeng.com/social/ios/ios9 （我只加了几个你可以在plist文件中看到）
     
     
     要配置  配置URL scheme 链接：http://dev.umeng.com/social/ios/quick-integration?spm=0.0.0.0.Pj9VMG#1_4_3
     图：Snip20160616_1.png
     */
    
    
    
    // 集成好了啦 开始 先注册友盟和微信、QQ
    [UMSocialData setAppKey:@"569c98cc67e58e4b5b000456"];//1.注册友盟，需要友盟账号->获取appkey 一般老大不给 就用自己的
    
    
    [UMSocialWechatHandler setWXAppId:@"wxe798deeb2c5cfd4b" appSecret:@"0acf102c08aa49db1c52bec556631710" url:@"http://www.baxianyipin.com"];//2。微信分享注册，需要去官网上注册 （一般老大给的）这是我公司的账号 (其中包含 朋友圈和好友)
     [UMSocialQQHandler setQQWithAppId:@"100424468" appKey:@"c7394704798a158208a74ab60104f0ba" url:@"http://vip.k-touch.cn"];//3.qq注册 同上

    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
