//
//  StarWarsListRouter.swift
//  SwiftUI_Demo
//
//  Created by ghadeer.elmahdy on 12/11/2021.
//

import Foundation
struct StarWarsListAPI: APIComponents {
    var scheme: String = "https"
    var host: String = "github.com"
    var path: String = "/EsraaAbdelmotteleb/DuetAPI/blob/gh-pages/project.json"
    var method: HTTPSMethods = .Get
}

