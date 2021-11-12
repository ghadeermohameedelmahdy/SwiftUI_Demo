//
//  APIComponents.swift
//  SwiftUI_Demo
//
//  Created by ghadeer.elmahdy on 12/11/2021.
//

import Foundation
protocol APIComponents {
    var scheme: String { get set }
    var host: String {get set}
    var path: String {get set}
    var method: HTTPSMethods {get set}
}
