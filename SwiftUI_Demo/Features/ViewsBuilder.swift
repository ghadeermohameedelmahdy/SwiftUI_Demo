//
//  ViewBuilder.swift
//  SwiftUI_Demo
//
//  Created by ghadeer.elmahdy on 12/11/2021.
//

import Foundation
import SwiftUI
enum ViewsBuilder {
  static func makeSWListView() -> some View {
    let viewModel = SWListViewModel()
    return SWListView(viewModel: viewModel)
  }
    static func makeSWItemDetails(item: SWItemRowViewModel) -> some View {
      return SWItemDetailsView(item: item)
    }
}
