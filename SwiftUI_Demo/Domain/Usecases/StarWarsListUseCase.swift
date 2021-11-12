//
//  StarWarsListUseCase.swift
//  SwiftUI_Demo
//
//  Created by ghadeer.elmahdy on 12/11/2021.
//

import Foundation
import Combine
protocol StarwarsListUsecaseProtocol {
  func fetchStarWarsList() -> AnyPublisher<StarwarsCatsResponse, APIError>
}

class StarwarsListUsecase: StarwarsListUsecaseProtocol {
    static let shared = StarwarsListUsecase()
    private init (){}
    
    func fetchStarWarsList() -> AnyPublisher<StarwarsCatsResponse, APIError> {
        return NetworkManager.shared.makeRequest(with: StarWarsListAPI.shared)
    }
}
