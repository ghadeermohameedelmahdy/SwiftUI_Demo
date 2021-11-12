//
//  SWCatViewModel.swift
//  SwiftUI_Demo
//
//  Created by ghadeer.elmahdy on 12/11/2021.
//

import Foundation
import SwiftUI

struct SWItemRowViewModel: Identifiable {
    private let item: StarwarsCatsResponse.Result
  
  var id: String {
    return title + (item.gender ?? "n/a")
  }

  var title: String {
    guard let title = item.name else { return "" }
    return title
  }
  var image: String {
        guard let data = item.image else { return "" }
        return data
  }
    var birthYear: String {
        guard let data = item.birthYear else { return "1990" }
          return "Birth Year: \(data)"
    }
    var eyeColor: String {
        guard let data = item.eyeColor else { return "black" }
          return "Eye Color: \(data)"
    }
    var hairColor: String {
        guard let data = item.hairColor else { return "black" }
          return  "Hair Color: \(data)"
    }
    var gender: String {
        guard let data = item.gender else { return "n/a" }
          return  "Gender: \(data)"
    }
    var height: String {
    guard let data = item.height else { return "100" }
          return  "Height: \(data)"
    }
    var mass: String {
        guard let data = item.mass else { return "mass" }
          return  "Mass: \(data)"
    }
    var skinColor: String {
    guard let data = item.skinColor else { return "black" }
          return  "Skin Color: \(data)"
    }
  init(item: StarwarsCatsResponse.Result) {
    self.item = item
  }
}

// Used to hash on just the day in order to produce a single view model for each
// day when there are multiple items per each day.
extension SWItemRowViewModel: Hashable {
  static func == (lhs: SWItemRowViewModel, rhs: SWItemRowViewModel) -> Bool {
    return lhs.title == rhs.title
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(self.title)
  }
}
