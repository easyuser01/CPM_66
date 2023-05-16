//
//  Criteria.swift
//  CpmAnalysis
//
//  Created by snlcom on 2023/06/05.
//

import Foundation
import SwiftUI
struct Criteria: Decodable, Identifiable, Hashable {
    let id: Int
    let type: String
    let snow: Double
    let rainfall: Double
    let temperaturemin: Double
    let temperaturemax: Double
    let wind: Double
    
    static let exampleCriteria = Criteria( id: 0, type: "Foundation work", snow: 10, rainfall: 5 , temperaturemin: 0, temperaturemax: 100, wind: 10)
    }



