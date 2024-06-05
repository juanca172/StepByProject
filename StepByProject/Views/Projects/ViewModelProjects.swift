//
//  ViewModelProjects.swift
//  StepByProject
//
//  Created by Juan Camilo Fonseca Gomez on 31/05/24.
//

import Foundation
import Observation

@Observable
class ViewModelProjects {
    var coincidence = ""
    var filterArray: [ProyectModel] {
        guard !coincidence.isEmpty else { return TestData.mockData }
        return TestData.mockData.filter({$0.name.localizedCaseInsensitiveContains(coincidence)})
    }
    func rechargeFilterData(_ information: String) {
        coincidence = information
    }
}
