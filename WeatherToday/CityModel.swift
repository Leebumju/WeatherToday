//
//  CityModel.swift
//  WeatherToday
//
//  Created by 이범준 on 2022/03/13.
//

import Foundation

struct City: Codable{
    let city_name: String
    let state: Int
    let celsius: Double
    let rainfall_probability: Int
}
