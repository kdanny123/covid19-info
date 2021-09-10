//
//  CountyModel.swift
//  COVID19 Info
//
//  Created by Kun Lok on 8/6/21.
//

import Foundation

struct CountyModel: Codable, Hashable {
    let state, county, fips: String
    let population, cdcTransmissionLevel: Int
}
