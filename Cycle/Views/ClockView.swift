//
//  ClockView.swift
//  Cycle
//
//  Created by tristan on 16/5/13.
//  Copyright © 2016年 Xu Jingxin. All rights reserved.
//

import UIKit

@IBDesignable class ClockView: UIView {

  @IBInspectable var borderColor: UIColor = UIColor.orangeColor()
  @IBInspectable var shadowColor: UIColor = UIColor.whiteColor()
  @IBInspectable var borderWidth: CGFloat = 30

  override func drawRect(rect: CGRect) {
    drawShadow()
    drawProgress()
  }

  func drawShadow() {
    let surface = CGRect(x: borderWidth / 2,
                         y: borderWidth / 2,
                         width: bounds.width - borderWidth,
                         height: bounds.height - borderWidth)

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
    let radius = bounds.width / 2 - borderWidth / 2

    let startPoint = CGPoint(x: arcCenter.x +  radius * cos(startAngle),
                             y: arcCenter.y + radius * sin(startAngle))
    let endPoint = CGPoint(x: arcCenter.x +  radius * cos(endAngle),
                           y: arcCenter.y + radius * sin(endAngle))

    let progressPath = UIBezierPath(arcCenter: arcCenter,
                                    radius: bounds.width / 2,
                                    startAngle: startAngle,
                                    endAngle: endAngle,
                                    clockwise: true)
    progressPath.addArcWithCenter(endPoint,
                                  radius: borderWidth / 2,
                                  startAngle: endAngle,
                                  endAngle: endAngle + CGFloat(M_PI),
                                  clockwise: true)
    progressPath.addArcWithCenter(arcCenter,
                                  radius: bounds.width / 2 - borderWidth,
                                  startAngle: endAngle,
                                  endAngle: startAngle,
                                  clockwise: false)
    progressPath.addArcWithCenter(startPoint,
                                  radius: borderWidth / 2,
                                  startAngle: startAngle,
                                  endAngle: startAngle + CGFloat(M_PI),
                                  clockwise: false)

    // Draw border
    borderColor.setFill()
    progressPath.fill()
  }

}
