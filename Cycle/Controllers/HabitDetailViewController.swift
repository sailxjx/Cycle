//
//  HabitDetailViewController.swift
//  Cycle
//
//  Created by tristan on 16/6/8.
//  Copyright © 2016年 Xu Jingxin. All rights reserved.
//

import UIKit
import RealmSwift

class HabitDetailViewController: UITableViewController {

  var habit: Habit!
  @IBOutlet weak var habitNameTextField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "saveHabit" {
      let realm = try! Realm()
      try! realm.write() {
        let habit = Habit()
        habit.name = habitNameTextField.text!
        realm.add(habit)
        self.habit = habit
      }
    }
  }

}
