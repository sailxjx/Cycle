//
//  ViewController.swift
//  Cycle
//
//  Created by tristan on 16/5/5.
//  Copyright © 2016年 Xu Jingxin. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

  @IBOutlet weak var checkinButton: UIButton!
  @IBOutlet weak var habitNameTextView: UITextView!

  var habit: Habit?

  override func viewDidLoad() {
    super.viewDidLoad()
    self.habit = try! Realm().objects(Habit).first
    refreshView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "AddNewHabit" {
      if let destNavigationController = segue.destinationViewController as? UINavigationController,
        habitDetailViewController = destNavigationController.topViewController as? HabitDetailViewController,
        habit = self.habit {
        habitDetailViewController.habit = habit
      }
    }
  }

  @IBAction func cancelToMainViewController(segue: UIStoryboardSegue) {

  }

  @IBAction func saveHabitAndReturnToMainViewController(segue: UIStoryboardSegue) {
    if let habitDetailViewController = segue.sourceViewController as? HabitDetailViewController {
      self.habit = habitDetailViewController.habit
      refreshView()
    }
  }

  func refreshView() {
    if let habit = self.habit {
      habitNameTextView.text = habit.name
    }
  }

}