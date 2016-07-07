//
//  ViewController.m
//  UMDemo
//
//  Created by Kevin on 16/6/16.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "ViewController.h"

#import "UMSocial.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *shareBtn=[[UIButton alloc]initWithFrame:CGRectMake(150, 200, 80, 50)];
    shareBtn.backgroundColor=[UIColor blueColor];
    [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
    [shareBtn  addTarget:self action:@selector(shareBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:shareBtn];
    
}
-(void)shareBtn{
    
    /**
     *  要分享的文字和图片
     *
     *  @return nil
     */
 
    UIImageView *shareImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"test"]];
    
    NSString *text=@"要分享的文字！！~~";
    
    
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"569c98cc67e58e4b5b000456"
                                      shareText:text
                                     shareImage:shareImageView
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQQ,UMShareToSina, UMShareToRenren,UMShareToEmail,UMShareToDouban,UMShareToFacebook,UMShareToTwitter, nil]
                                       delegate:nil];//多个 比如：UMShareToWechatSession == 微信 、UMShareToQQ == QQ，...

    
    NSString *shareUrlStr=[NSString stringWithFormat:@"http://www.baidu.com"];//点击链接
    
    [UMSocialData defaultData].extConfig.wechatSessionData.url = shareUrlStr;//微信点击分享内容链接
    [UMSocialData defaultData].extConfig.wechatTimelineData.url =shareUrlStr;//朋友圈点击分享链接
    [UMSocialData defaultData].extConfig.tencentData.urlResource.url =shareUrlStr;//qq点击分享链接
    [UMSocialData defaultData].extConfig.sinaData.urlResource.url = shareUrlStr;//。。。
    [UMSocialData defaultData].extConfig.renrenData.url = shareUrlStr;
    [UMSocialData defaultData].extConfig.doubanData.urlResource.url = shareUrlStr;
    [UMSocialData defaultData].extConfig.facebookData.url = shareUrlStr;
    [UMSocialData defaultData].extConfig.twitterData.urlResource.url = shareUrlStr;
    
    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeWeb;//设置图文链接模式 这个官网上有说明 这个就行了
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
