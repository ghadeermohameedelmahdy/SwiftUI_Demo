//
//  APIError.swift
//  SwiftUI_Demo
//
//  Created by ghadeer.elmahdy on 12/11/2021.
//

import Foundation

enum APIError: Error {
  case parsing(description: String)
  case network(description: String)
}
