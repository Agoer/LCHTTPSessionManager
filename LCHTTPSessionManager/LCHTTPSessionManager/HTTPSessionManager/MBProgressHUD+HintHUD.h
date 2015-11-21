//
//  MBProgressHUD+HintHUD.h
//  HudDemo
//
//  Created by chanli on 15/11/21.
//  Copyright © 2015年 Matej Bukovinski. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (HintHUD)

+ (MBProgressHUD *)showHUDHint:(NSString *)hintString
                        toView:(UIView *)toView
                      complete:(void(^)())complete;

+ (MBProgressHUD *)showHUDProgress:(NSString *)title
                            toView:(UIView *)toView;

@end
