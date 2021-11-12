//
//  NetworkManager.swift
//  SwiftUI_Demo
//
//  Created by ghadeer.elmahdy on 12/11/2021.
//

import Foundation
import Combine

class NetworkManager {
  static let shared = NetworkManager()
  private let session: URLSession
  
  private init(session: URLSession = .shared) {
    self.session = session
  }
}

// MARK: - generic request
extension NetworkManager {
  func makeRequest<T>(
    with components: APIComponents
  ) -> AnyPublisher<T, APIError> where T: Decodable {
    guard let urlRequest = makeAPIRequest(apiComp: components) else {
      let error = APIError.network(description: "Couldn't create URL")
      return Fail(error: error).eraseToAnyPublisher()
    }
    return session.dataTaskPublisher(for: urlRequest)
      .mapError { error in
        .network(description: error.localizedDescription)
      }
      .flatMap(maxPublishers: .max(1)) { pair in
        decode(pair.data)
      }
      .eraseToAnyPublisher()
  }
}

// MARK: - create API Components
private extension NetworkManager {
    private func makeAPIRequest(apiComp: APIComponents) -> URLRequest? {
    var component = URLComponents()
    component.scheme = apiComp.scheme
    component.host = apiComp.host
    component.path = apiComp.path
    guard let url = component.url else {return nil}
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = apiComp.method.rawValue
    urlRequest.timeoutInterval = 10.0
    return urlRequest
  }
}
