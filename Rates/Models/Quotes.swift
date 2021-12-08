//
//  Quotes.swift
//  XChange
//
//  Created by Walker Browne-Student on 5/24/21.
//
import Foundation

struct Quotes:Decodable {
  
  typealias ConversionCode = String

  var timestamp:Date
  var source:String
  var quotes:[ConversionCode:Double]
  
  enum CodingKeys:String, CodingKey {
    case timestamp
    case source
    case quotes
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let timestampUnix = try container.decode(TimeInterval.self, forKey: .timestamp)
    quotes = try container.decode([ConversionCode:Double].self, forKey: .quotes)
    source = try container.decode(String.self, forKey: .source)
    timestamp = Date(timeIntervalSince1970: timestampUnix)
  }
}
