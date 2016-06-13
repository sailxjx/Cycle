//
//  Record.swift
//  Cycle
//
//  Created by tristan on 16/6/8.
//  Copyright © 2016年 Xu Jingxin. All rights reserved.
//

import Foundation
import RealmSwift

func getCurrentFlatDate() -> String {
  let dateFormatter = NSDateFormatter()
  dateFormatter.dateFormat = "yyyyMMdd"
  return dateFormatter.stringFromDate(NSDate())
}

class Record: Object {
  dynamic var flatDate: String = getCurrentFlatDate()
  dynamic var createdAt = NSDate()
  dynamic var habit: Habit!

  override static func indexedProperties() -> [String] {
    return ["flatDate"]
  }

  static func getCurrentRecord(habit: Habit) -> Record? {
    let realm = try! Realm()
    return realm.objects(Record).filter("habit = %@ AND flatDate = '\(getCurrentFlatDate())'", habit).first
  }

  static func getRecordCount(habit: Habit) -> Int {
    let realm = try! Realm()
    return realm.objects(Record).filter("habit = %@", habit).count
  }
}