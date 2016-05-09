/*
 ***************************************************************************
 * 建立日期	： 2014-04-15
 * 版权声明	： 本代码版权归圣笛科技所有，禁止任何未授权的传播和使用
 * 作者		： yanjiaming@sainti.com
 * 模块		：
 * 描述		： 请求接口封装 DAO
 * -------------------------------------------------------------------------
 * 修改历史
 * 序号			日期					修改人				修改原因
 * <#序号#>        <#日期#>                <#修改人#>              <#修改原因#>
 *
 ***************************************************************************
 */

#import <Foundation/Foundation.h>
#import "OrderModel.h"
@interface SendRequest : NSObject
/*
 方法说明:
 AFNetWorking的GET请求实例
 
 参数说明:
 userId:请求参数
 
 返回结果:
  OrderModel *result；block的返回结果，这个可以自定义，可以是数组，字典，也可以是一个实例类，建议实例类，这样用起来比较方便，代码易读。
 */
+ (NSURLSessionDataTask *)orderDetailWith:(NSString *)userId result:(void (^)(NSDictionary *result, NSError *error))block;
/*
 方法说明:
 AFNetWorking的POST请求实例
 
 参数说明:
 userName:请求参数
 passWord:
 返回结果:
 NSDictionary *result；block的返回结果，这个可以自定义，可以是数组，字典，也可以是一个实例类，建议实例类，这样用起来比较方便，代码易读。
 */
+ (NSURLSessionDataTask *)loginWithUserName:(NSString *)userName passWord:(NSString *)passWord result:(void (^)(NSDictionary *result, NSError *error))block;
//注册
+ (NSURLSessionDataTask *) registWithPhone:(NSString *)phone
                                      Code:(NSString *)code
                                       pwd:(NSString *)pwd
result:(void(^)(NSDictionary *data , NSError *error))block;
//获取验证码
+ (NSURLSessionDataTask *) getCodeWithPhone:(NSString *)phone
                                      type:(NSString *)type
                                    result:(void(^)(NSDictionary *data , NSError *error))block;

//登录
+ (NSURLSessionDataTask *) loginWithPhone:(NSString *)phone
                                       mima:(NSString *)mima
                                     result:(void(^)(NSDictionary *data , NSError *error))block;
@end
