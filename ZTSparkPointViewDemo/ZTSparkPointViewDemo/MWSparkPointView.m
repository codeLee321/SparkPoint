//
//  MWSparkPointView.m
//  ZTSparkPointViewDemo
//
//  Created by tony on 16/12/9.
//  Copyright © 2016年 ZThink. All rights reserved.
//

#import "MWSparkPointView.h"

@implementation MWSparkPointView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"drawRect方法被调用");
    CALayer * bgLayer = [CALayer layer];
    bgLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    bgLayer.frame = rect;
    self.layer.backgroundColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:bgLayer];
    //创建亮点光波动画的中心源
    UIBezierPath * expendedPath = [self pathWithRadius:15.0];
    CAShapeLayer * expendedLayer = [self creatShapeLayerWithPath:expendedPath.CGPath];
    [bgLayer addSublayer:expendedLayer];
    
    [expendedLayer addAnimation:[self pathAnimationWithPath:[self pathWithRadius:100].CGPath duration:2] forKey:@"SparkPointExpendAnimation"];

    [expendedLayer addAnimation:[self fillColorAnimationFromValue:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.6]  toValue:[UIColor clearColor] duration:2] forKey:@"FillAnimation"];
        

    
    //创建亮点的中心源
    UIBezierPath * expendedPath2 = [self pathWithRadius:15.0];
    CAShapeLayer * expendedLayer2 = [self creatShapeLayerWithPath:expendedPath2.CGPath];
    [bgLayer addSublayer:expendedLayer2];
    
}

//中心源绘制路线
-(UIBezierPath *)pathWithRadius:(CGFloat)radius{

    UIBezierPath * pointPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    return pointPath;

}

//根据路线，绘制中心源
-(CAShapeLayer *)creatShapeLayerWithPath:(CGPathRef)path{

    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = [UIColor whiteColor].CGColor;
    shapeLayer.strokeColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 1.0f;
    shapeLayer.path =path;
    return shapeLayer;
}

//中心源放大的动画
-(CABasicAnimation *)pathAnimationWithPath:(CGPathRef)path duration:(CGFloat)duration{
    CABasicAnimation * anima = [CABasicAnimation animationWithKeyPath:@"path"];
    anima.toValue = (__bridge id _Nullable)(path);
    anima.duration = duration;
    anima.removedOnCompletion = YES;
    anima.fillMode = kCAFillModeBackwards;
    anima.repeatCount = MAXFLOAT;
    anima.delegate = self;
    return anima;

}

//中心源放大填充颜色动画

-(CABasicAnimation *)fillColorAnimationFromValue:(UIColor *)fromeColor toValue:(UIColor *)toColor duration:(CGFloat)duration{

    CABasicAnimation * anima = [CABasicAnimation animationWithKeyPath:@"fillColor"];
    anima.fromValue = (__bridge id _Nullable)(fromeColor.CGColor);
    anima.toValue = (__bridge id _Nullable)(toColor.CGColor);
    anima.duration = duration;
    anima.removedOnCompletion = YES;
    anima.fillMode = kCAFillModeBackwards;
    anima.repeatCount = MAXFLOAT;
    anima.delegate =self;
    return anima;

}

@end
