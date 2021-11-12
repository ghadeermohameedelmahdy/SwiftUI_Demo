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
        guard let img = item.image else { return "" }
        return img
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
