
import Foundation

enum AppDefaultsKey:String {
  case lastFetchTimestamp // the last time we execute the fetch request.
  case lastQuotesTimestamp // the actual timestamp of the quotes
  case baseCurrencyCode
}

protocol AppDefaultsConvertible {
  func get<T>(for key:AppDefaultsKey) -> T?
  func set<T>(value: T?, for key:AppDefaultsKey)
  func remove(key:AppDefaultsKey)
}
