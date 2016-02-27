/*
    1.画一条直线->PPT:上下文分析->我们是不是要把画的东西显示在一个界面啊，先搞一个界面->当需要画图的时候，就需要一个上下文->先拼接路径->然后在添加到上下文->由上下文决定渲染到哪个上面->这里是直接渲染到界面->为什么要这样做->上下文相当于内存缓存区->等路径全加在上下文中了，在一次性渲染到视图上效率高->在内存中操作速度是最快的->比直接操作显示器快多了。
 
    2.添加一条线段，我现在想在添加一条线段，（操作：告诉学生从哪画哪），怎么做了，还需要设置起点吗，注意啊，这时候就不需要了，默认刚刚的终点会成为下一次的起点，因为路径是拼接的，他会从刚刚的终点开始画，我们只需要设置终点就好了。
    
    3.刚刚是不是画了两根相连的线段啊，我现在想画不相连的两根线段，怎么做，(操作：告诉学生从哪画哪)，还需要重新创建一个新的路径吗，是不是不需要啊，直接改变第二根线的起点就好了，是不是就可以画两跟不同的直线了，刚刚说了一个路径是不是可以由很多直线段组成啊。
 
    4.接下来给你们介绍点常识性的东西，假如我现在想给线条加粗点，怎么办。->介绍所有绘图状态(线宽,线段头尾样式，颜色，线段连接样式)->状态调用顺序(一定要在渲染之前)->注意：每次渲染上下文的时候，才会去看最终状态，根据最终状态渲染上下文,也就是说把设置绘图状态的代码写在渲染之前的任何地方都可以.
 
    4.1 注意：每次渲染上下文的时候，才会去看最终状态，根据最终状态渲染上下文
 
    5.接下来我们讲讲如何绘制一条曲线，(操作打开网页),需要3个点，起点，终点，控制点
 
 
 
    提示：
    1.为什么要先认识上下文的类型，因为我们获取上下文是不是先要弄个变量保存起来，方便下次使用，定义变量首先需要定义变量类型。
    2.目前学的上下文都跟UIGraphics有关
    3.drawRect:一创建View就自带的方法，说明是很重要的方法，一般系统自己帮我们生成的代码都是很重要的。
    4.drawRect:在view第一次显示到屏幕上的时候会调用一次
    5.Rect:就是自定义view的尺寸，相当于self.bounds
    6.CG：CoreGraphics
    7.Ref：
    8.UIKit转CoreGraphics就直接CG开头就能转
    9.渲染上下文到视图上，画图分析，为什么要这样设计。为什么要搞个上下文，效率高
    10.曲线：需要3个点，起点，终点，控制点，控制点越远，曲线越尖
 
 
 */

#import "YZLineView.h"

@implementation YZLineView


- (void)drawRect:(CGRect)rect
{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    // 2.1 设置绘制点
    CGPoint startP = CGPointMake(0,50);
    CGPoint endP = CGPointMake(250, 50);
    CGPoint controlP = CGPointMake(125, 200);
    
    // 2.2 创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startP];
    [path addQuadCurveToPoint:endP controlPoint:controlP];
    
    // 3.将路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.将上下文渲染到视图
    CGContextStrokePath(ctx);
    
    
    
}

- (void)draw2Line
{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 2.画一条线
    [path moveToPoint:CGPointMake(10, 10)];
    [path addLineToPoint:CGPointMake(100, 100)];
    
    // 3.画第二条线
//    [path moveToPoint:CGPointMake(150, 150)];
//    [path addLineToPoint:CGPointMake(40, 60)];
    
    // 开发中最好一个线，对应一个贝塞尔路径
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(150, 150)];
    [path1 addLineToPoint:CGPointMake(40, 60)];
    
    // 4.将路径添加上下文
    CGContextAddPath(ctx, path.CGPath);
    CGContextAddPath(ctx, path1.CGPath);
    
    // 5.设置绘图的状态(一定要在渲染之前)
    // 5.1设置线段宽度
    CGContextSetLineWidth(ctx, 10);
    // 5.2设置线段头尾部样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    // 5.3设置线段颜色
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
    // 5.4设置线段转折点样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    // 5.5UIKit设置颜色方法
    [[UIColor greenColor] set];
    
    // 6.将上下文渲染到视图
    CGContextStrokePath(ctx);

}


- (void)drawLine
{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.设置绘图信息/拼接路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 3.设置一个起点
    [path moveToPoint:CGPointMake(10, 10)];
    
    // 4.添加一条直线到一个点
    [path addLineToPoint:CGPointMake(100, 100)];
    
    // 5.添加一条直线到一个点
    [path addLineToPoint:CGPointMake(150, 60)];
    
    // 5.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 6.把上下文渲染到视图
    CGContextStrokePath(ctx);
    
    // stroke:描边
    // fill:  填充
 
}

@end
