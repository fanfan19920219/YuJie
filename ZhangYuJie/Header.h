//
//  Header.h
//  MingTu
//
//  Created by zhangzhihua on 16/3/3.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

//$(PRODUCT_BUNDLE_IDENTIFIER)
//self.view.frame.size.width
//self.view.frame.size.height
#ifndef Header_h
#define Header_h

typedef void(^AVPlayerTableViewReturnBlock)(id obj);

#import <AFNetworking.h>

#import "MainPageViewController.h"
#import "selfViewController.h"



//自定义控件
#import "selectView.h"
#import <MBProgressHUD.h>



//颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define MainColor RGBA(198, 31, 30, 1)
#define TEXT_COLOR RGBA(152, 122, 122, 1)

#define TABBARSHOW self.tabBarController.tabBar.hidden=NO
#define TABBARHIDDEN self.tabBarController.tabBar.hidden=YES

//判断版本型号
#define IsIOS7 ([[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=7)
#define CGRECT_NO_NAV(x,y,w,h) CGRectMake((x), (y+(IsIOS7?20:0)), (w), (h))
#define CGRECT_HAVE_NAV(x,y,w,h) CGRectMake((x), (y+(IsIOS7?64:0)), (w), (h))
//by  Box
#define isIPHONE4S ([UIScreen mainScreen].bounds.size.height == 480.0)
#define isIPHONE5 ([UIScreen mainScreen].bounds.size.height == 568.0)
#define isIPHONE6 ([UIScreen mainScreen].bounds.size.height == 667.0)
#define isIPHONE6P ([UIScreen mainScreen].bounds.size.height == 736.0)
#define isIPADAIR ([UIScreen mainScreen].bounds.size.height == 2048.0)


//特殊名称
#define BIANNAME @"bianbian"

#define PERSONAL_IMG_PATHNAME(name) [NSHomeDirectory() stringByAppendingString:[NSString stringWithFormat:@"/%@_img.plist",name]]
#define PERSONAL_PATHNAME(name) [NSHomeDirectory() stringByAppendingString:[NSString stringWithFormat:@"/%@.plist",name]]

#define TRUEPATH(name) [NSString stringWithFormat:@"%@/%@.plist",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0],name]

#define TRUEPATH_IMAGE(name) [NSString stringWithFormat:@"%@/%@img.plist",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0],name]
//shareSdk

//新浪微博SDK需要在项目Build Settings中的Other Linker Flags添加"-ObjC"


#define GETFRIEND [[NSUserDefaults standardUserDefaults]objectForKey:@"friend"]
#define SAVEFRIEND(array)  [[NSUserDefaults standardUserDefaults]setObject:array forKey:@"friend"];\
[[NSUserDefaults standardUserDefaults] synchronize];


#endif /* Header_h */

