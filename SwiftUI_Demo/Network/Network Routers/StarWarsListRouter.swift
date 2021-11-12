//
//  StarWarsListRouter.swift
//  SwiftUI_Demo
//
//  Created by ghadeer.elmahdy on 12/11/2021.
//

import Foundation
struct StarWarsListAPI: APIComponents {
    static let shared = StarWarsListAPI()
    private init (){}
    var scheme: String = "https"
    var host: String = "raw.githubusercontent.com"
    var path: String = "/EsraaAbdelmotteleb/DuetAPI/gh-pages/project.json"
    var method: HTTPSMethods = .Get
}

