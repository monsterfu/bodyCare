//
//  HttpRequest.m
//  IVMall (Ipad)
//
//  Created by sean on 14-2-24.
//  Copyright (c) 2014年 HYQ. All rights reserved.
//

#import "HttpRequest.h"
#import "GlobalHeader.h"
#import "AppDelegate.h"


@implementation HttpRequest
+(void)Request:(NSString*)url postdate:(NSString*)postdata tag:(int)tag delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel{
    
    NSLog(@"url is %@",url);
    NSLog(@"%@ ---------%d",postdata,tag);
    NSURL *httpurl = [NSURL URLWithString:url];
    
    ASIHTTPRequest* asiRequest = [ASIHTTPRequest requestWithURL:httpurl];
    
    [asiRequest setTag:tag];
    
    [asiRequest setRequestMethod:@"POST"];
    
//    NSStringEncoding gbkEncoding  =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    [asiRequest appendPostData:[postdata dataUsingEncoding:NSUTF8StringEncoding]];
    [asiRequest setUseSessionPersistence:YES];
    [asiRequest setUseCookiePersistence:YES];
    [asiRequest setDefaultResponseEncoding:NSUTF8StringEncoding];
    [asiRequest setDelegate:delegate];
    [asiRequest setTimeOutSeconds:8.0f];
    [asiRequest setDidFinishSelector:finishSel];
    [asiRequest setDidFailSelector:failSel];
    [asiRequest startAsynchronous];
    
}

+(void)Request:(NSString*)url postdate:(NSString*)postdata tag:(int)tag request:(ASIHTTPRequest *)request delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel{
    
    NSLog(@"url is %@",url);
    NSLog(@"%@ ---------%d",postdata,tag);
//    NSURL *httpurl = [NSURL URLWithString:url];
    
//    request = [ASIHTTPRequest requestWithURL:httpurl];
    
    [request setTag:tag];
    [request appendPostData:[postdata dataUsingEncoding:NSUTF8StringEncoding]];
    [request setUseSessionPersistence:YES];
    [request setUseCookiePersistence:YES];
    [request setDefaultResponseEncoding:NSUTF8StringEncoding];
    [request setDelegate:delegate];
    [request setTimeOutSeconds:8.0f];
    
    [request setDidFinishSelector:finishSel];
    [request setDidFailSelector:failSel];
    [request startAsynchronous];
}

+(void)LoginRequest:(NSString*)mobile password:(NSString*)password hostId:(NSString*)hostid seqno:(NSString*)seqno delegate:(id)delegate finishSel:(SEL)finishSel failSel:(SEL)failSel{
    [self Request:BASE postdate:[NSString stringWithFormat:@"{\"msgcode\":\"4002\",\"mobile\":\"%@\",\"hostid\":\"%@\",\"passwd\":\"%@\",\"seqno\":\"%@\"}",mobile,hostid,password,seqno] tag:TAG_LOGIN delegate:delegate finishSel:finishSel failSel:failSel];
}
@end









