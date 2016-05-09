//
//  SendRequest.m
//  SaintiFrameWork
//
//  Created by yan.jm on 14-5-6.
//  Copyright (c) 2014年 yan.jm. All rights reserved.
//

#import "SendRequest.h"
#import "SaintiNetWork.h"
#import "NSString+Expand.h"

@implementation SendRequest
+ (NSURLSessionDataTask *)orderDetailWith:(NSString *)userId result:(void (^)(NSDictionary *result, NSError *error))block{
    
    return [[SaintiNetWork sharedClient] GET:[NSString stringWithFormat:@"gift/my_order?uid=%@",userId] parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        
        
        if (block) {//添加block返回
            block(JSON, nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}
/*
 方法说明:
 AFNetWorking的POST请求实例
 
 参数说明:
 userName:请求参数
 passWord:
 返回结果:
 NSDictionary *result；block的返回结果，这个可以自定义，可以是数组，字典，也可以是一个实例类，建议实例类，这样用起来比较方便，代码易读。
 */
+ (NSURLSessionDataTask *)loginWithUserName:(NSString *)userName passWord:(NSString *)passWord result:(void (^)(NSDictionary *result, NSError *error))block{
    //    NSDictionary *dic=[[NSDictionary alloc]init];
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:userName forKey:@"usr_name"];
    [dic setObject:passWord forKey:@"usr_pass"];
    return [[SaintiNetWork sharedClient]POST:@"tjstc_ydyyinternal_serverlet/LoginServlet" parameters:dic success:^(NSURLSessionDataTask * __unused task, id JSON){
        if (block) {//添加block返回
            block(JSON, nil);
        }
    }failure:^(NSURLSessionDataTask *task, NSError *error){
        if (block) {
            block(nil, error);
        }
    }];
    
}
//注册
+ (NSURLSessionDataTask *)registWithPhone:(NSString *)phone Code:(NSString *)code pwd:(NSString *)pwd result:(void (^)(NSDictionary *, NSError *))block
{
    NSString *pwd_md5 = [[pwd stringFromMD5]uppercaseString];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:phone forKey:@"phone"];
    [dict setObject:code forKey:@"code"];
    [dict setObject:pwd_md5 forKey:@"pwd"];
    
    return [[SaintiNetWork sharedClient] POST:@"regist" parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            block(responseObject,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block(nil,error);
            NSLog(@"%@",error);
        }
    }];
}

+ (NSURLSessionDataTask *)getCodeWithPhone:(NSString *)phone type:(NSString *)type result:(void (^)(NSDictionary *, NSError *))block
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:phone forKey:@"phone"];
    [dict setObject:type forKey:@"type"];
    return [[SaintiNetWork sharedClient] POST:@"getcode" parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            block(responseObject,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block(nil,error);
            NSLog(@"%@",error);
        }
    }];
}

//+ (NSURLSessionDataTask *)loginWithPhone:(NSString *)phone mima:(NSString *)mima result:(void (^)(NSDictionary *, NSError *))block
//{
//    
//}

@end
