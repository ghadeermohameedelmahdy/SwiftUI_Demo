//
//  StarWarsListViewModel.swift
//  SwiftUI_Demo
//
//  Created by ghadeer.elmahdy on 12/11/2021.
//

import SwiftUI
import Combine
enum ViewState: Equatable {
    case startFetching
    case finishWithData
    case finishWithError(error: String)
    case idle
}
class StarwarsListViewModel: ObservableObject {
    @Published var searchName: String = ""
    @Published var dataSource: [SWItemRowViewModel] = []
    @Published var responseState: ViewState = .idle
    private var data: [SWItemRowViewModel] = []
    private let newtworkFetcher: StarwarsListUsecaseProtocol
    private var disposables = Set<AnyCancellable>()
    init(
        newtworkFetcher: StarwarsListUsecaseProtocol = StarwarsListUsecase.shared,
        scheduler: DispatchQueue = DispatchQueue(label: "StarwarsViewModel")
    ) {
        self.newtworkFetcher = newtworkFetcher
            $searchName
            .debounce(for: .seconds(0.5), scheduler: scheduler)
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: {[weak self] search in
                    guard let self = self else { return }
                    self.dataSource = search.isEmpty ? self.data : self.data.filter({$0.title.contains(search.lowercased())})
                })
              .store(in: &disposables)
    }
    
    func fetchWeather() {
        responseState = .startFetching
        newtworkFetcher.fetchStarWarsList()
            .receive(on: DispatchQueue.main)
            .map { response in
                response.results?.map({ item in
                    SWItemRowViewModel(item: item)
                })
            }
            .sink { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .failure(let error):
                    self.responseState = .finishWithError(error: error.localizedDescription)
                    self.data = []
                    self.dataSource = []
                case .finished:
                    self.responseState = .finishWithData
                    break
                }
            } receiveValue: {[weak self] viewModelList in
                guard let self = self else { return }
                self.data = viewModelList ?? []
                self.dataSource = viewModelList ?? []
            } .store(in: &disposables)
    }
    deinit {
        disposables.forEach({$0.cancel()})
    }
}
