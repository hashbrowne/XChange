//
//  FetchRequest.swift
//  XChange
//
//  Created by Walker Browne-Student on 5/24/21.
//Rates

import Foundation

class RequestCaller {

  private lazy var decoder = JSONDecoder()
  private let urlSession:URLSession = URLSession.shared
  
  func call<Model:Decodable>(
    request:URLRequest,
    completion: @escaping(Result<Model, RequestError>) -> Void) {
    
    let task = urlSession.dataTask(with: request) { [weak self] (data, response, error) in
      guard let weakSelf = self else { return }
      // Check if the request was reachable.
      guard let httpResponse = response as? HTTPURLResponse,
        httpResponse.statusCode != 0 else {
          completion(Result.failure(.unreachable))
          return
      }
      guard let responseData = data else {
        fatalError("""
                  Decode Error
                """)
      }
      do {
        if let obj = try? weakSelf.decoder.decode(Model.self, from: responseData) {
          completion(Result.success(obj))
        } else {
          // then may be it's the error info.
          let errObj = try weakSelf.decoder.decode(ErrorInfo.self, from: responseData)
          completion(Result.failure(RequestError.responseError(errObj.error)))
        }
      } catch {
        // Maybe related to other things like invalid json format and etc.
        completion(Result.failure(RequestError.unknownError(error.localizedDescription)))
      }
    }
    task.resume()
  }
}
