//
//  JSPublishTextView.h
//  JSPublishTextView
//
//  Created by  江苏 on 16/5/29.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSPublishTextView : UITextView

/*占位文字*/
@property(copy,nonatomic)NSString* placeHolder;

/*占位文字颜色*/
@property(strong,nonatomic)UIColor* placeHolderColor;

@end
