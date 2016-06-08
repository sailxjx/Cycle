//
//  Habit.swift
//  Cycle
//
//  Created by tristan on 16/6/8.
//  Copyright © 2016年 Xu Jingxin. All rights reserved.
//

import Foundation
import RealmSwift

class Habit: Object {
  dynamic var name = ""
  dynamic var createdAt = NSDate()
}