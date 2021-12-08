//
//  APICall.swift
//  XChange
//
//  Created by Walker Browne-Student on 5/24/21.
//

import Foundation

class APIService {
  
  static let shared = APIService()
  private lazy var requestCaller = RequestCaller()
  private let baseUrl:URL = URL(string: "http://apilayer.net")!
  
  private lazy var apiKey:String = {

    guard let _currencyLayerConfig = Bundle.main
      .object(forInfoDictionaryKey: "CurrencyLayer") as? [String: String],
      let _apiKey = _currencyLayerConfig["APIKey"] else {
      fatalError("No CurrencyLayer.APIKey found")
    }
    return _apiKey
  }()
  
  func fetchCurrencies(completion: @escaping(Result<Currencies, RequestError>) -> Void) {
    let endpoint = "api/list"
    requestCaller.call(request: request(from: endpoint), completion: completion)
  }
  
  func fetchLive(source:String, completion: @escaping(Result<Quotes, RequestError>) -> Void) {
    let endpoint = "api/live"
    requestCaller.call(
      request: request(from: endpoint,
                       queryParams: ["source": source]),
      completion: completion)
  }
  
  private func request(from endpoint:String, queryParams:[String:String] = [:]) -> URLRequest {
    var components = URLComponents(url: baseUrl.appendingPathComponent(endpoint), resolvingAgainstBaseURL: true)!
    var items = [URLQueryItem(name: "access_key", value: apiKey)]
    queryParams.forEach {
      items.append(URLQueryItem(name: $0.key, value: $0.value))
    }
    components.queryItems = items
    return URLRequest(url: components.url!)
  }
}
