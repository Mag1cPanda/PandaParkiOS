//
//  BasicController.m
//  learnMasonry
//
//  Created by huangyibiao on 15/11/27.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "BasicController.h"

@implementation BasicController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    greenView.layer.borderColor = UIColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self.view addSubview:greenView];
    
    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self.view addSubview:redView];
    
    UIView *blueView = UIView.new;
    blueView.backgroundColor = UIColor.blueColor;
    blueView.layer.borderColor = UIColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self.view addSubview:blueView];
    

    CGFloat vWH = 100;
    CGFloat padding = 10;
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(50);
        make.width.height.mas_equalTo(vWH);
    }];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(redView.mas_bottom).offset(-padding);
        make.left.mas_equalTo(redView.mas_right).offset(-padding);
        make.width.height.mas_equalTo(vWH);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(greenView.mas_bottom).offset(-padding);
        make.left.mas_equalTo(greenView.mas_right).offset(-padding);
        make.width.height.mas_equalTo(vWH);
    }];
}

@end
