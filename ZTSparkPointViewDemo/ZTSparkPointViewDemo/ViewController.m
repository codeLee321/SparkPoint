//
//  ViewController.m
//  ZTSparkPointViewDemo
//
//  Created by tony on 16/12/9.
//  Copyright © 2016年 ZThink. All rights reserved.
//

#import "ViewController.h"
#import "MWSparkPointView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MWSparkPointView * pointView = [[MWSparkPointView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:pointView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
