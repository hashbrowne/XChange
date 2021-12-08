//
//  RequestError.swift
//  XChange
//
//  Created by Walker Browne-Student on 5/24/21.
//

import Foundation

enum RequestError:Error, CustomStringConvertible {
  case responseError(ErrorDetail)
  case unknownError(String)
  case unreachable

  var description: String {
    switch self {
    case .responseError(let detail):
      return detail.info
    case .unknownError(let msg):
      return msg
    case .unreachable:
      return "Please check your internet connection."
    }
  }
}
