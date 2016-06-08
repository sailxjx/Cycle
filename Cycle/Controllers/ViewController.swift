//
//  ViewController.swift
//  Cycle
//
//  Created by tristan on 16/5/5.
//  Copyright © 2016年 Xu Jingxin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var checkinButton: UIButton!
  @IBOutlet weak var habitNameTextView: UITextView!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func cancelToMainViewController(segue: UIStoryboardSegue) {

  }

  @IBAction func saveHabitAndReturnToMainViewController(segue: UIStoryboardSegue) {
    if let habitDetailViewController = segue.sourceViewController as? HabitDetailViewController {
      habitNameTextView.text = habitDetailViewController.habit.name
    }
  }

}