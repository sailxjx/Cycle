//
//  BGView.swift
//  Cycle
//
//  Created by tristan on 16/5/31.
//  Copyright © 2016年 Xu Jingxin. All rights reserved.
//

import UIKit

@IBDesignable class BGView: UIView {

  @IBInspectable var startColor: UIColor = UIColor.whiteColor()
  @IBInspectable var endColor: UIColor = UIColor.whiteColor()

  override func drawRect(rect: CGRect) {
    let context = UIGraphicsGetCurrentContext()
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let colors = [startColor.CGColor, endColor.CGColor]

    let colorLocations: [CGFloat] = [0.0, 1.0]
    let gradient = CGGradientCreateWithColors(colorSpace,
                                              colors,
                                              colorLocations)
    let startPoint = CGPoint(x: bounds.width, y: 0)
    let endPoint = CGPoint(x: 0, y: bounds.height)
    CGContextDrawLinearGradient(context,
                                gradient,
                                startPoint,
                                endPoint,
                                [])
  }

}
