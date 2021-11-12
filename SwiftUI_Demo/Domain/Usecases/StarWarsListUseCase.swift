//
//  StarWarsListUseCase.swift
//  SwiftUI_Demo
//
//  Created by ghadeer.elmahdy on 12/11/2021.
//

import Foundation
import Combine
protocol WeatherFetchable {
  func weeklyWeatherForecast(
    forCity city: String
  ) -> AnyPublisher<WeeklyForecastResponse, WeatherError>

  func currentWeatherForecast(
    forCity city: String
  ) -> AnyPublisher<CurrentWeatherForecastResponse, WeatherError>
}
