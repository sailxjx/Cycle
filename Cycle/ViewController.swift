//
//  ViewController.swift
//  Cycle
//
//  Created by tristan on 16/5/5.
//  Copyright © 2016年 Xu Jingxin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var clockView: ClockView!

  override func viewDidLoad() {
    super.viewDidLoad()
    clockView.backgroundColor = .None
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}