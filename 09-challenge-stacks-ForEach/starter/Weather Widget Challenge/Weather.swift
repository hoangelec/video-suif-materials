//
//  Weather.swift
//  Weather Widget Challenge
//
//  Created by Hoang Cap on 22/02/2024.
//  Copyright © 2024 Kodeco. All rights reserved.
//

import SwiftUI
import Foundation

struct Weather {
    struct Forecast: Identifiable {
        let id = UUID()
    let hour: String
    let conditions: Image
    let temperature: String
  }

  let hourlyForecast = [
    Forecast(hour: "8AM", conditions: Image(systemName: "sun.max.fill"), temperature: "63°"),
    Forecast(hour: "9AM", conditions: Image(systemName: "cloud.sun.fill"), temperature: "63°"),
    Forecast(hour: "10AM", conditions: Image(systemName: "sun.max.fill"), temperature: "64°"),
    Forecast(hour: "11AM", conditions: Image(systemName: "cloud.fill"), temperature: "61°"),
    Forecast(hour: "12PM", conditions: Image(systemName: "cloud.rain.fill"), temperature: "62°")
  ]
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Image("challenge")
      .resizable()
      .scaledToFit()
      .previewLayout(.sizeThatFits)

    ContentView()
      .previewLayout(.sizeThatFits)
  }
}
