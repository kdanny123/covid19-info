//
//  CountySpecificModel.swift
//  COVID19 Info
//
//  Created by Kun Lok on 8/9/21.
//

import Foundation

struct CountySpecificModel: Codable, Hashable {
    let county, fips, lastUpdatedDate : String
    let population, cdcTransmissionLevel: Int
    let actuals: CountyActuals
    let metrics: Metrics
}

struct CountyActuals: Codable, Hashable {
    let cases: Int
}
