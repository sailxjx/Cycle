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
  @IBOutlet weak var editHabitButton: UIButton!

  var habit: Habit?
  var currentRecord: Record?
  var recordCount: Int = 0 {
    didSet {
      checkinButton.setTitle("\(recordCount)", forState: .Normal)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    let realm = try! Realm()
    self.habit = realm.objects(Habit).first
    if let habit = self.habit {
      self.currentRecord = Record.getCurrentRecord(habit)
      self.recordCount = Record.getRecordCount(habit)
    }
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
      editHabitButton.setTitle("Edit", forState: .Normal)
    } else {
      editHabitButton.setTitle("Add", forState: .Normal)
    }
  }

  @IBAction func checkinNow(sender: UIButton) {
    let realm = try! Realm()
    if let currentRecord = self.currentRecord {
      try! realm.write {
        realm.delete(currentRecord)
        self.currentRecord = nil
      }
      self.recordCount -= 1
    } else {
      try! realm.write {
        let currentRecord = Record()
        currentRecord.habit = self.habit
        realm.add(currentRecord)
        self.currentRecord = currentRecord
      }
      self.recordCount += 1
    }
  }

}