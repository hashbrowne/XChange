

import Foundation

protocol Bindable {
  
  associatedtype T
  
  func bind(_ data: T)
}
