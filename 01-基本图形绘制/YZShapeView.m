
#import "YZShapeView.h"

@implementation YZShapeView

- (void)drawRect:(CGRect)rect
{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    // 2.1 设置尺寸
    CGPoint center = CGPointMake(125, 125);
    CGFloat radius = 100;
    CGFloat startA = 0;
    // 注意啊：这里只能传弧度
    CGFloat endA = M_PI_2;
    
    // 2.2创建圆弧路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [path addLineToPoint:center];
    // 3.将路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.将上下文渲染到视图
    
    // 描边路径
//    CGContextStrokePath(ctx);
    
    // 填充路径
    CGContextFillPath(ctx);

}
- (void)drawQuarter
{
    
}
- (void)drawArc
{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    /*
     center：圆心
     radius：半径
     startA:起始角度
     endA:结束角度
     clockwise:是否顺时针
     */
    // 2.1 设置尺寸
    CGPoint center = CGPointMake(125, 125);
    CGFloat radius = 100;
    CGFloat startA = 0;
    // 注意啊：这里只能传弧度
    CGFloat endA = M_PI;
    
    // 2.2创建圆弧路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
    // 3.将路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.将上下文渲染到视图
    CGContextStrokePath(ctx);

}

#pragma mark 画圆
- (void)drawCircle
{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    // 2.1椭圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 200, 100)];
    // 2.2圆
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 200, 200)];
    
    // 3.将路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.将上下文渲染到视图
    CGContextStrokePath(ctx);

}

#pragma mark 画矩形
- (void)drawSquare
{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    // 抽出来方便以后使用
    CGRect r = CGRectMake(10, 10, 200, 200);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(10, 10, 200, 200)];
    path = [UIBezierPath bezierPathWithRoundedRect:r cornerRadius:10];
    
    // 3.将路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.将上下文渲染到视图
    CGContextStrokePath(ctx);

}

#pragma mark 画三角形
- (void)superNene
{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 2.1 设置起点
    [path moveToPoint:CGPointMake(10, 10)];
    // 2.2 添加线段
    [path addLineToPoint:CGPointMake(125, 100)];
    // 2.4 添加线段
    [path addLineToPoint:CGPointMake(240, 10)];
    
    /* 这种方式不好
    // 2.5 添加线段到路径起点
    [path addLineToPoint:CGPointMake(10, 10)];
    */
    
    // 2.5 关闭路径:从路径的终点连接到路径的起点，形成一条封闭的路径.
    [path closePath];
    
    
    // 3.1设置绘图状态(后添加)
    
    // 3.1.1设置填充颜色
    [[UIColor blueColor] setFill];
    
    // 3.1.2设置描边颜色
    [[UIColor redColor] setStroke];
    
    // 3.1.3设置线宽
    CGContextSetLineWidth(ctx, 10);
    
    // 3.将路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.将上下文渲染到视图
    //    CGContextStrokePath(ctx);
    //    CGContextFillPath(ctx);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    // kCGPathFillStroke：既描边又填充

}

@end
