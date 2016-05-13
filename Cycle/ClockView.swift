//
//  ClockView.swift
//  Cycle
//
//  Created by tristan on 16/5/13.
//  Copyright © 2016年 Xu Jingxin. All rights reserved.
//

import UIKit

class ClockView: UIView {

  override func drawRect(rect: CGRect) {

    let ctx = UIGraphicsGetCurrentContext()

    let rad = CGRectGetWidth(rect) / 3.5
    let endAngle = CGFloat(2 * M_PI)

    CGContextAddArc(ctx, CGRectGetMidX(rect), CGRectGetMidY(rect), rad, 0, endAngle, 1)
    CGContextSetFillColorWithColor(ctx, UIColor.grayColor().CGColor)
    CGContextSetStrokeColorWithColor(ctx, UIColor.whiteColor().CGColor)
    CGContextSetLineWidth(ctx, 4.0)
    CGContextDrawPath(ctx, CGPathDrawingMode.FillStroke)

    CGContextSaveGState(ctx)

    for i in 1...60 {
      CGContextSaveGState(ctx)
      CGContextTranslateCTM(ctx, CGRectGetMidX(rect), CGRectGetMidY(rect))
      CGContextRotateCTM(ctx, degree2radian(CGFloat(i) * 6))
      if i % 5 == 0 {
        drawSecondMarker(ctx!, x: rad - 15, y: 0, radius: rad, color: UIColor.whiteColor())
      } else {
        drawSecondMarker(ctx!, x: rad - 10, y: 0, radius: rad, color: UIColor.whiteColor())
      }
      CGContextRestoreGState(ctx)
    }

  }

  func degree2radian(a: CGFloat) -> CGFloat {
    let b = CGFloat(M_PI) * a / 180
    return b
  }

  func drawSecondMarker(ctx: CGContextRef, x: CGFloat, y: CGFloat, radius: CGFloat, color: UIColor) {
    let path = CGPathCreateMutable()
    CGPathMoveToPoint(path, nil, radius, 0)
    CGPathAddLineToPoint(path, nil, x, y)
    CGPathCloseSubpath(path)
    CGContextAddPath(ctx, path)
    CGContextSetLineWidth(ctx, 1.5)
    CGContextSetStrokeColorWithColor(ctx, color.CGColor)
    CGContextStrokePath(ctx)
  }

}
