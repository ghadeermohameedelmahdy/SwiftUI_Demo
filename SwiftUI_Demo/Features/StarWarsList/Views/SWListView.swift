//
//  ContentView.swift
//  SwiftUI_Demo
//
//  Created by ghadeer.elmahdy on 11/11/2021.
//

import SwiftUI
import Combine
struct SWListView: View {
    @ObservedObject var viewModel: StarwarsListViewModel
    init(viewModel: StarwarsListViewModel) {
        self.viewModel = viewModel
        viewModel.fetchWeather()
    }
    var body: some View {
        NavigationView {
            VStack{
                switch viewModel.responseState {
                    case .startFetching:
                        Spacer()
                        ProgressView()
                        Spacer()
                    case .finishWithData:
                        searchField
                      if viewModel.dataSource.isEmpty {
                        TextView(title: "No results yet")
                      }else {
                        List {
                        catSection
                        }.listStyle(InsetListStyle())
                        .resignKeyboardOnDragGesture()
                      }
                    case .finishWithError (let error):
                        Text(error)
                    case .idle:
                        TextView(title: "No results yet")
                    }
                }.navigationBarTitle("Star Wars Cats")
            .resignKeyboardOnDragGesture()
            }
    }
}

private extension SWListView {
    var searchField: some View {
        HStack(alignment: .center) {
            TextField("e.g. name", text: $viewModel.searchName)
                .padding(10)
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)
        }.padding(.horizontal)
    }
    
    var catSection: some View {
        Section {
            ForEach(viewModel.dataSource) { item in
                VStack(alignment: .leading) {
                    NavigationLink(
                      destination: SWItemDetailsView()) {
                        SWListItem(item: item)
                    }
                }
            }
        }
    }
   
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ViewsBuilder.makeStarwarsCatsListView()
    }
}
