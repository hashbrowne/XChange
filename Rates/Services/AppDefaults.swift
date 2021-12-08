//
//  AppDefaults.swift
//  XChange
//
//  Created by Walker Browne-Student on 5/24/21.
//

import Foundation

class AppDefaults:AppDefaultsConvertible {
 
  static let shared = AppDefaults()
  
  private let defaults = UserDefaults.standard
  
  func get<T>(for key:AppDefaultsKey) -> T? {
    return defaults.object(forKey: key.rawValue) as? T
  }
  
  func set<T>(value: T?, for key:AppDefaultsKey) {
    defaults.set(value, forKey: key.rawValue)
  }
  
  func remove(key: AppDefaultsKey) {
    defaults.removeObject(forKey: key.rawValue)
  }
}
