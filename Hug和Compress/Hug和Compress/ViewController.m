//
//  ViewController.m
//  Hug和Compress
//
//  Created by apple on 16/10/20.
//  Copyright © 2016年 李重阳. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel * label = [[UILabel alloc]init];
    [self.view addSubview:label];
    label.backgroundColor = [UIColor yellowColor];
    
    UILabel * label2 = [[UILabel alloc]init];
    [self.view addSubview:label2];
    label2.backgroundColor = [UIColor blueColor];
    
    
    /*
     * intrinsicContentSize: 这个是label 的真实的 大小size
     * 抗拉伸 和 抗压缩 都是相对于intrinsicContentSize 值来说的
     **/
    
    
#if 0
    /*
     * 抗拉伸
     * 主要用在
     * eg：label、label2 限制后 还有空余空间，这个时候就需要谁来拉伸了，才能满足我们的限制
     * setContentHuggingPriority（值越高，越不容易拉伸，所以我取名为‘抗拉伸’）
     **/
    label.text = @"label";
    label2.text = @"label2";
    /*
     * 保证label 不被拉伸，那么只能拉伸label2
     **/
    [label setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [label2 setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
 
#else
    /*
     * 抗压缩
     * 主要用在
     * eg：label、label2 限制后 ，没有空余空间，这个时候就 只能压缩某个label，才能满足我们的限制
     * setContentCompressionResistancePriority（值越高，越不容易压缩，所以我取名为‘抗压缩’）
     **/
    label.text = @"hello，我是第一个label，请多多！";
    label2.text = @"hello，我是第二个label，谢谢";
    /*
     * 保证label2 不被压缩，那么只能压缩label
     **/
    [label setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [label2 setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    
#endif
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(@10);
        make.top.equalTo(@10);
        make.right.equalTo(label2.mas_left).offset(-20);
    }];
    
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(label.mas_right).offset(20);
        make.top.equalTo(label);
        make.right.equalTo(@(-10));
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
