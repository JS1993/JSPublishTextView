//
//  JSPublishTextView.m
//  JSPublishTextView
//
//  Created by  江苏 on 16/5/29.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSPublishTextView.h"


@interface JSPublishTextView()

/*占位label*/
@property(strong,nonatomic)UILabel* placeHolderLabel;

@end

@implementation JSPublishTextView

/*占位label*/
-(UILabel *)placeHolderLabel
{
    if (_placeHolderLabel==nil) {
        _placeHolderLabel=[[UILabel alloc]init];
        _placeHolderLabel.font=self.font;
        _placeHolderLabel.textColor=[UIColor grayColor];
        
        _placeHolderLabel.numberOfLines=0;
        [self addSubview:_placeHolderLabel];
    }
    return _placeHolderLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUp];
    }
    return self;
}

-(void)awakeFromNib{
    [self setUp];
}

/**
 *  初始化控件操作
 */
-(void)setUp{
    
    self.alwaysBounceVertical=YES;
    
    self.font=[UIFont systemFontOfSize:14.0];
    self.textColor=[UIColor blackColor];
    
    //监听文字改变的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextViewTextDidChangeNotification object:nil];
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat labelWidth= self.frame.size.width-4*2;
    
    self.placeHolderLabel.frame=CGRectMake(4, 7, labelWidth, self.placeHolderLabel.bounds.size.height);
    
    [self.placeHolderLabel sizeToFit];
}

#pragma mark--可以不用label直接将占位文字绘制上去，此方法需在下面的setter方法调用setNeedsDisplay方法
//- (void)drawRect:(CGRect)rect {
//
//    //如果有文字，就直接返回
//    if ( self.hasText) return;
//
//    rect.origin.x=4;
//    rect.origin.y=7;
//    rect.size.width-=2*rect.origin.x;
//
//    [self.placeHolder drawInRect:rect withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0],NSForegroundColorAttributeName:[UIColor grayColor]}];
//}

#pragma mark--重写setter方法

-(void)setPlaceHolder:(NSString *)placeHolder{
    _placeHolder=[placeHolder copy];
    self.placeHolderLabel.text=placeHolder;
    [self setNeedsLayout];
    
}

-(void)setPlaceHolderColor:(UIColor *)placeHolderColor{
    _placeHolderColor=placeHolderColor;
    self.textColor=placeHolderColor;
    
}

-(void)setFont:(UIFont *)font{
    [super setFont:font];
    self.placeHolderLabel.font=font;
    
    [self setNeedsLayout];
}


-(void)setText:(NSString *)text{
    [super setText:text];
    
    [self textChanged];
}

-(void)setAttributedText:(NSAttributedString *)attributedText{
    [super setAttributedText:attributedText];
    [self textChanged];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark--判断占位文字是否需要影藏
-(void)textChanged{
    //只要有文字就影藏
    self.placeHolderLabel.hidden=self.hasText;
}

@end
