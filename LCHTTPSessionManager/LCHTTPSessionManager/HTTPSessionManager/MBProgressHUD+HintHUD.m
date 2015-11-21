//
//  MBProgressHUD+HintHUD.m
//  HudDemo
//
//  Created by chanli on 15/11/21.
//  Copyright © 2015年 Matej Bukovinski. All rights reserved.
//

#import "MBProgressHUD+HintHUD.h"
#import <PupaFoundation/PupaFoundation.h>

@implementation MBProgressHUD (HintHUD)

#pragma mark - Hint

+ (MBProgressHUD *)showHUDHint:(NSString *)hintString toView:(UIView *)toView complete:(void (^)())complete
{
    __block MBProgressHUD *hud = nil;
    dispatch_main_sync_safe(^{
        hud = [MBProgressHUD HUDForView:toView];
        if (hud == nil) {
            hud = [MBProgressHUD showHUDAddedTo:toView animated:YES];
        }
        
        // Configure for text only and offset down
        hud.mode = MBProgressHUDModeText;
        hud.labelText = hintString;
        hud.margin = 25.0f;
        hud.removeFromSuperViewOnHide = YES;
        
        hud.completionBlock = complete;
        
        [hud hide:YES afterDelay:2.0];
    });
    return hud;
}

#pragma mark - Progress

+ (MBProgressHUD *)showHUDProgress:(NSString *)title toView:(UIView *)toView
{
    __block MBProgressHUD *hud = nil;
    dispatch_main_sync_safe(^{
        hud = [MBProgressHUD HUDForView:toView];
        if (hud == nil) {
            hud = [MBProgressHUD showHUDAddedTo:toView animated:YES];
        }
        
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.labelText = title;
        hud.margin = 25.0;
        
        hud.removeFromSuperViewOnHide = YES;
    });
    return hud;
}


@end
