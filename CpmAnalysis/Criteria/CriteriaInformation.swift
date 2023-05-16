
//  CriteriaInformation.swift
//  CpmAnalysis
//
//  Created by snlcom on 2023/06/03.
//

import Foundation

class CriteriaList: ObservableObject {
    @Published var criteriadata: [Criteria] = []
    
    init() {
        if let url = Bundle.main.url(forResource: "criterias", withExtension: "json"),
           let data = try? Data(contentsOf: url){
            if let criteriasCheck = try? JSONDecoder().decode([Criteria].self, from: data) {
                self.criteriadata = criteriasCheck
            }
        }
    }
    
    func getCriterias() -> [Criteria] {
        return self.criteriadata
    }
}
