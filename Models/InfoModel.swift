//
//  InfoModel.swift
//  COVID19 Info
//
//  Created by Kun Lok on 8/6/21.
//

import Foundation


struct InfoModel: Codable, Hashable {
    let fips, country, state,lastUpdatedDate, url: String
    let population: Int
    let actuals: Actuals
    let metrics: Metrics
}

struct Actuals: Codable, Hashable {
    let cases, deaths, positiveTests, negativeTests, vaccinationsCompleted, vaccinesAdministered: Int
}

struct Metrics: Codable, Hashable {
    let vaccinationsCompletedRatio: Double
}
