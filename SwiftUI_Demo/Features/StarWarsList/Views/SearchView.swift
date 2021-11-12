//
//  SearchView.swift
//  SwiftUI_Demo
//
//  Created by ghadeer.elmahdy on 12/11/2021.
//

import SwiftUI

struct SearchView: View {

    @State var viewModel: SWListViewModel
    @State private var showCancelButton: Bool = false
    var body: some View {
        // Search view
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("search", text: $viewModel.searchName, onEditingChanged: { isEditing in
                    self.showCancelButton = true
                }, onCommit: {
                    print("onCommit")
                }).foregroundColor(.primary)
                Button(action: {
                    self.viewModel.searchName = ""
                }) {
                    Image(systemName: "xmark.circle.fill").opacity(viewModel.searchName == "" ? 0 : 1)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
        }
        .padding(.horizontal)
        .navigationBarHidden(showCancelButton) // .animation(.default) // animation does not work properly
    }
}
//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView(searchText: "search")
//    }
//}
