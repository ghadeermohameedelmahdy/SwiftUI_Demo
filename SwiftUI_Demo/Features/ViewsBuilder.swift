//
//  ViewBuilder.swift
//  SwiftUI_Demo
//
//  Created by ghadeer.elmahdy on 12/11/2021.
//

import Foundation
import SwiftUI
enum ViewsBuilder {
  static func makeStarwarsCatsListView() -> some View {
    let viewModel = StarwarsListViewModel()
    return StarWarsCatsListView(viewModel: viewModel)
  }
}
