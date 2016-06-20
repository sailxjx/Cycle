//
//  ClockView.swift
//  Cycle
//
//  Created by tristan on 16/5/13.
//  Copyright © 2016年 Xu Jingxin. All rights reserved.
//

import UIKit

@IBDesignable
class ClockView: UIView {

  @IBInspectable var borderColor: UIColor = UIColor.orangeColor()
  @IBInspectable var shadowColor: UIColor = UIColor.whiteColor()
  @IBInspectable var borderWidth: CGFloat = 30
  @IBInspectable var radius: CGFloat = 90

  override func drawRect(rect: CGRect) {
    drawShadow()
    drawProgress()
  }

  func drawShadow() {
    let surface = CGRect(x: bounds.width / 2 - radius,
                         y: bounds.height / 2 - radius,
                         width: radius * 2,
                         height: radius * 2)

    let surfacePath = UIBezierPath(ovalInRect: surface)
    // Draw border
    surfacePath.lineWidth = borderWidth
    shadowColor.setStroke()
    surfacePath.stroke()
  }

  func drawProgress() {
    let arcCenter = CGPoint(x: bounds.width / 2,
                            y: bounds.height / 2)

    let startAngle = 0 - CGFloat(M_PI) / 2
    let endAngle = CGFloat(M_PI) / 4 * 5 - CGFloat(M_PI) / 2

    let progressPath = UIBezierPath(arcCenter: arcCenter,
                                    radius: radius,
                                    startAngle: startAngle,
                                    endAngle: endAngle,
                                    clockwise: true)

    progressPath.lineWidth = borderWidth

    // Draw border
    borderColor.setStroke()
    progressPath.stroke()
  }

}