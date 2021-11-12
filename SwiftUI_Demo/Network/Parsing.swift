//
//  Parsing.swift
//  SwiftUI_Demo
//
//  Created by ghadeer.elmahdy on 12/11/2021.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, APIError> {
  let decoder = JSONDecoder()
  return
     Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
      .parsing(description: "parsing error")
    }
    .eraseToAnyPublisher()
}
