//
//  ViewController.m
//  LCHTTPSessionManager
//
//  Created by chanli on 15/11/21.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import "ViewController.h"
#import "LCHTTPSessionManager+AotumanUserAPI.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[LCHTTPSessionManager sharedLCHTTPSessionManager] signin:@"123" password:@"222" success:^(NSDictionary * dic) {
        
        NSLog(@"222=> %@",dic);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
