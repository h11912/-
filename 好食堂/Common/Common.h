/*
 ***************************************************************************
 * 建立日期	： 2014-04-15
 * 版权声明	： 本代码版权归圣笛科技所有，禁止任何未授权的传播和使用
 * 作者		： yanjiaming@sainti.com
 * 模块		：
 * 描述		： 宏定义公共类
 * -------------------------------------------------------------------------
 * 修改历史
 * 序号			日期					修改人				修改原因
 * <#序号#>        <#日期#>                <#修改人#>              <#修改原因#>
 *
 ***************************************************************************
 */

#ifndef DiscoveryLand_Common_h
#define DiscoveryLand_Common_h
//默认坐标相关宏定义
#define NavigationBar_HEIGHT 44
#define UILABEL_DEFAULT_FONT_SIZE 20.0f

/********系统相关宏*******/
//当前系统版本
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])

#define IOS7Later [[[UIDevice currentDevice] systemVersion]floatValue]>=7

//判断设备类型
#define iPhone4 ([UIScreen mainScreen].bounds.size.height == 480)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size)) : NO)
#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kWidth(R) (R)*(kScreenWidth)/320
#define kHeight(R) (iPhone4?((R)*(kScreenHeight)/480):((R)*(kScreenHeight)/568))
/********颜色相关宏***********/
//十六进制颜色
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kColor(R,G,B,A) [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]
#define kWhiteColor     [UIColor whiteColor]
#define kLightGrayColor [UIColor lightGrayColor]
#define kBlackColor     [UIColor blackColor]
#define kClearColor     [UIColor clearColor]
#define kGrayColor      [UIColor grayColor]
#define kRedColor      [UIColor redColor]
#define kYellowColor      [UIColor yellowColor]

#define kGreenColor      [UIColor greenColor]
#define kLineColor UIColorFromRGB(0xdbdbdb)
//系统log封装
#if 1
#define SaintiLog(x, ...) NSLog(x, ## __VA_ARGS__);
#else
#define SaintiLog(x, ...)
#endif
//#define BASEURL @"http://demo.asiasea.com.cn/app/"//post请求测试
#define BASEURL @"http://www.asae.cn/app/"//post请求正式

//APPID，应用提交时候替换
#define APPID @"863892746"

#define SAFE_RELEASE(obj)     [obj release]; obj = nil;
//图片获取宏IMAGE会缓存到内存中
//#define IMAGE(img) iPhone6?[UIImage imageNamed:[NSString stringWithFormat:@"%@6-",img]]:[UIImage imageNamed:img]
#define IMAGE1(img) (iPhone6?[UIImage imageNamed:[NSString stringWithFormat:@"%@-6",img]]:[UIImage imageNamed:img])
#define IMAGE(img) [UIImage imageNamed:img]
#define GetImageByName(name) iPhone6?[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@-6",name] ofType:@"png"]]:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"png"]]
#endif

//Nslog
#ifdef SHOW_S_LOG
#define SLogDetail(s, ... ) NSLog(@"\r\nFile: ---------------------> %s\r\n---------------------> %s :Line->%d \r\nlogInfo=> %@",__FILE__,__func__, __LINE__,[NSString stringWithFormat:(s), ##__VA_ARGS__]);
#define SLog(s, ... ) NSLog(@"\r\n\r\n------------------------logInfo start------------------------\n%@",[NSString stringWithFormat:(s), ##__VA_ARGS__]);
#elif SHOW_S_LOG_AND_CONSOLE
#define SLogDetail(s, ... ) NSLog(@"\r\nFile: ---------------------> %s\r\n---------------------> %s :Line->%d \r\nlogInfo=> %@",__FILE__,__func__, __LINE__,[NSString stringWithFormat:(s), ##__VA_ARGS__]);[iConsole info:@"File: ----> %s\r\n------> %s :Line->%d \r\n---> %@",__FILE__,__func__, __LINE__,[NSString stringWithFormat:(s), ##__VA_ARGS__]];
#define SLog(s, ... ) NSLog(@"\r\n---------------------logInfo---------------------\n%@",[NSString stringWithFormat:(s), ##__VA_ARGS__]); [iConsole info:@"---------------------logInfo---------------------\n%@",[NSString stringWithFormat:(s), ##__VA_ARGS__]];
#elif SHOW_S_LOG_NONE
#define SLogDetail(s, ... )
#define SLog(s, ... )
#endif

//printf
#ifdef SHOW_S_PRINTF
#define SPrintf(s, ... ) (printf("\r\n---> SPrintf =>" s,##__VA_ARGS__));
#else
#define SPrintf(s, ... )
#endif
/********网络请求*******/
//请求失败后封装
#define ERRORCODE @"errorCode"
#define MESSAGE @"message"
#define kHTTPRequestFormater @"{\"errCode\":\"%@\",\"rspMsg\":\"%@\"}"

//操作成功的返回码
#define kSuccessResultCode @"0"

//无网络连接的返回码
#define kNoNetworkResultCode @"9001"

#define kNoNetworkResultMsg @"请检查网络连接后重试"

//服务端返回信息无法解析返回码
#define kBadResDataResultCode @"9002"

//服务端返回信息为空的返回码
#define kEmptyResultCode @"9003"

//服务端返回信息为空的JSON字符串
#define kEmptyResultMsg @"请求失败，请重试"

//每页请求的数据条数
#define kNumOfPageSize @"10"
#define kNumOfPageIntSize 10
#define kPagePerModelOutTime [PagePerModel sharedInstance].strOutTime
#define kPagePerModelPerPageFollow [PagePerModel sharedInstance].strPerPageFollow
#define kPagePerModelPerPageMyOrd [PagePerModel sharedInstance].strPerPageMyOrd
#define kPagePerModelPerPageOften [PagePerModel sharedInstance].strPerPageOften
#define kPagePerModelPerPagePro [PagePerModel sharedInstance].strPerPagePro

#define kStartPage 0
#define k12Font [UIFont systemFontOfSize:12.0f]
#define k14Font [UIFont systemFontOfSize:14.0f]
#define k15Font [UIFont systemFontOfSize:15.0f]
#define k18Font [UIFont systemFontOfSize:18.0f]

//UserDefault的宏定义
#define USERDEFAULTS NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]

#define KUserInfoModel UserInfoModel *userModel = [UserInfoModel sharedInstance];

#define KPagePerModel PagePerModel *pagePerModel = [PagePerModel sharedInstance];