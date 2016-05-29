//
//  ViewController.m
//  JSPublishTextView
//
//  Created by  江苏 on 16/5/29.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "JSPublishTextView.h"

@interface ViewController ()<UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    JSPublishTextView* pubTV=[[JSPublishTextView alloc]init];
    pubTV.frame=CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 500);
    pubTV.backgroundColor=[UIColor redColor];
    pubTV.placeHolderColor=[UIColor yellowColor];
    pubTV.font=[UIFont systemFontOfSize:20.0];
    
    pubTV.delegate=self;
 pubTV.placeHolder=@"ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    
    [self.view addSubview:pubTV];
    
    
    [pubTV becomeFirstResponder];
}

@end
