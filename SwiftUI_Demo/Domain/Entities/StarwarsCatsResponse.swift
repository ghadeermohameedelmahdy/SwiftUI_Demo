//
//  StarwarsCats.swift
//  SwiftUI_Demo
//
//  Created by ghadeer.elmahdy on 12/11/2021.
//

import Foundation
// MARK: - StarwarsCatsList
struct StarwarsCatsResponse: Codable {
    var results: [Result]?
    // MARK: - Result
    struct Result: Codable {
        var name, height, mass, hairColor: String?
        var skinColor, eyeColor, birthYear, gender: String?
        var image: String?

        enum CodingKeys: String, CodingKey {
            case name, height, mass
            case hairColor = "hair_color"
            case skinColor = "skin_color"
            case eyeColor = "eye_color"
            case birthYear = "birth_year"
            case gender, image
        }
    }
}


