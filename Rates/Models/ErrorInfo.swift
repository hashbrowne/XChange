//
//  ErrorInfo.swift
//  XChange
//
//  Created by Walker Browne-Student on 5/24/21.
//


struct ErrorDetail:Decodable {
  
  let code:Int
  let info:String
}

struct ErrorInfo:Error, Decodable {
  
  var error: ErrorDetail
}
