//
//  ConvertedRate.swift
//  XChange
//
//  Created by Walker Browne-Student on 5/24/21.
//


import Foundation

struct EquivalentRate {
  var currencyCode:String?
  var value:NSDecimalNumber?
}

extension Rate {
  func equivalentRate(at rate: NSDecimalNumber) -> EquivalentRate {
    return EquivalentRate(currencyCode: currencyCode, value: value?.multiplying(by: rate))
  }
}
