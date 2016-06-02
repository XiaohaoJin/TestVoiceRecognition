//
//  AppMacro.h
//  MiaoMiaoVoice
//
//  Created by 金晓浩 on 16/6/1.
//  Copyright © 2016年 XiaoHaoJin. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

#define APPID_VALUE           @"574efd1c"

/* 尺寸 */
#define ScreenRect                          [[UIScreen mainScreen] bounds]
#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height
#define RectMaxX(f)                         CGRectGetMaxX(f)
#define RectMaxY(f)                         CGRectGetMaxY(f)
#define RectMinX(f)                         CGRectGetMinX(f)
#define RectMinY(f)                         CGRectGetMinY(f)
#define RectX(f)                            f.frame.origin.x
#define RectY(f)                            f.frame.origin.y
#define RectWidth(f)                        f.bounds.size.width
#define RectHeight(f)                       f.bounds.size.height
#define RectSetWidth(f, w)                  CGRectMake(RectX(f), RectY(f), w, RectHeight(f))
#define RectSetHeight(f, h)                 CGRectMake(RectX(f), RectY(f), RectWidth(f), h)
#define RectSetX(f, x)                      CGRectMake(x, RectY(f), RectWidth(f), RectHeight(f))
#define RectSetY(f, y)                      CGRectMake(RectX(f), y, RectWidth(f), RectHeight(f))
#define RectSetSize(f, w, h)                CGRectMake(RectX(f), RectY(f), w, h)
#define RectSetOrigin(f, x, y)              CGRectMake(x, y, RectWidth(f), RectHeight(f))
#define Rect(x, y, w, h)                    CGRectMake(x, y, w, h)
#define Size(w, h)                          CGSizeMake(w, h)
#define Point(x, y)                         CGPointMake(x, y)
#define TabBarHeight                        49.0f
#define NaviBarHeight                       44.0f

#define kIsNull(exp) ((exp == nil || exp == NULL || ([exp isKindOfClass:[NSString class]] && [exp length] == 0))?1:0)

#endif /* AppMacro_h */
