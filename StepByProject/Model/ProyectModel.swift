//
//  ModelProject.swift
//  StepByProject
//
//  Created by Juan Camilo Fonseca Gomez on 1/06/24.
//

import Foundation

struct ProyectModel: Identifiable {
    var id: Int = 0
    let name: String
    let image: String
    let kind: KindOfProyect
    
    init(name: String, image: String, kind: KindOfProyect) {
        self.name = name
        self.image = image
        self.kind = kind
        self.id += 1
    }
}

enum KindOfProyect {
    case Scrum
    case Kanban
}
